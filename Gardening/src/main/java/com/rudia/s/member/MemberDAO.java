package com.rudia.s.member;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rudia.s.DateManager;

@Service    // 멤버변수가 필요하니까 Service 어노테이션 붙여줌
public class MemberDAO {

	@Autowired
	private  SqlSession  ss;
	
	
	//회원가입하기
	public  void  join( Member m,  HttpServletRequest  req, HttpServletResponse  res) {
		
		try {
			m.setM_birth(DateManager.getDate("m_y", "m_m", "m_d", req));
		
			// insert 해줘서 DB에 넣기
			if (ss.getMapper(MemberMapper.class).join(m) == 1) {
				req.setAttribute("r", "가입 성공");
			} else {
				req.setAttribute("r", "가입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입 실패");
		}
		System.out.println(m.getM_id());
		System.out.println(m.getM_pw());
		System.out.println(m.getM_name());
		System.out.println(m.getM_birth());
	}
	
	

	// 로그인 : DB와 비교해서 로그인 체크
	public  void  login(Member m, HttpServletRequest req, HttpServletResponse  res) {
		try {
			// DB에서 가져온 멤버 객체
			Member  dbMember = ss.getMapper(MemberMapper.class).getMemberById(m);
			
			if (dbMember == null) { //db 에서 select 해왔을때 일치하는 아이디가 없는경우
				req.setAttribute("r", "미가입 ID");
			} else {
				// 비번체크 : db에서의 비번과 인풋비번 비교
				if (m.getM_pw().equals(dbMember.getM_pw())) {
					req.setAttribute("r", "로그인 성공");
					
					// 사이트를 어떤식으로 사용하든 로그인 상태는 유지되어야.
					// 로그인 유지 시간 (이러한 문제도 있고..)
					// 사이트에서 접속을 끊으면 로그인 상태가 끊어지게 
					// => Session 이용이 적당
					
					// 세션의 어트리뷰트 
					// 로그인 성공한 사람의 dbMember 를 세션에 담는다.
					req.getSession().setAttribute("loginMember", dbMember);
					req.getSession().setMaxInactiveInterval(600); // 세션 유지시간 (단위 : 초)
					
					/*
					req.getSession().setMaxInactiveInterval(30); // 세션 유지시간 (단위 : 초)
					// 30초 동안 아무것도 안하면 세션이 종료/ 30초 내에 요청을 하면 refresh.
					*/
					
					//로그인 성공 시점에 그 아이디를 lastLoginId라는 이름으로 쿠키 하나 만들고 
					// .jsp 페이지 가서 value="${ 쿠키.쿠키이름.value}" 이런식으로 써줌
					Cookie  c = new Cookie("lastLoginId", m.getM_id()); 
					c.setMaxAge(20);//20초
		//			c.setMaxAge(24 * 60 * 60);//20초
					
					res.addCookie(c);  
					
				} else {
					req.setAttribute("r", "비번 오류");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "DB서버 쪽 문제..");
		}
		
	}
	
	
	
	//로그인 체크 : 로그인이 되면 true, 로그인이 풀리면 false 
	public  boolean  loginCheck(HttpServletRequest  req, HttpServletResponse  res) {
		Member  m = (Member) req.getSession().getAttribute("loginMember");
		if (m == null) {  //m이 없으면 : 로그인 안된경우
			req.setAttribute("menuPage", "member/login.jsp");
			return  false;
		} else { //m이 있으면 : 로그인 된 경우
			req.setAttribute("menuPage", "menu.jsp");
			return  true;
		}
	}
	
	
	//로그아웃
	public void  logout(HttpServletRequest req, HttpServletResponse  res) {
		req.getSession().setAttribute("loginMember", null); //세션에 저장된 로그인 정보 날림
	}

	
	// 아이디 체크
	public   Members   idCheck(Member m, HttpServletRequest req, HttpServletResponse res) {
		// 이 메소드를 부르면 table (복수형) 이 나가도록 Members로 ..
		Member mm = ss.getMapper(MemberMapper.class).getMemberById(m);  // select 해옴
		List<Member>  lm = new ArrayList<Member>();
		lm.add(mm);
		Members  ms = new Members(lm);
		return  ms;
		
	}
	
	
	
	
}
