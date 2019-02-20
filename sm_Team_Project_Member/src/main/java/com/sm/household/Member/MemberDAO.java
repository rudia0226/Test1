package com.sm.household.Member;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberDAO {
	
	@Autowired
	private  SqlSession  ss;
	
	//회원가입 입력값 set
	public  void  join(Member m , HttpServletRequest  req, HttpServletResponse res) {
	
		System.out.println(m.getUser_Email());
		System.out.println(m.getUser_Pw());
		System.out.println(m.getUser_Name());
		System.out.println(m.getUser_Birth());
		System.out.println(m.getUser_Sex());
		System.out.println(m.getGoal_Amount());
		
		ss.getMapper(MemberMapper.class).join(m);
		ss.getMapper(MemberMapper.class).InsertDefault(m);
		ss.getMapper(MemberMapper.class).DefaultPay(m);
		
		
	}
	
	
	// 로그인 : DB와 비교해서 로그인 체크
	public  boolean  login(Member m , HttpServletRequest req, HttpServletResponse res) {
		boolean result = false;
		
		HttpSession session = req.getSession();
		
		try {
			Member  dbMember = ss.getMapper(MemberMapper.class).getMemberById(m);
			
			if (dbMember == null) {
				req.setAttribute("r", "존재하지 않는 이메일입니다.");
				System.out.println("존재하지 않는 이메일입니다.");
				
				result = false;
			} else {
				if (m.getUser_Pw().equals(dbMember.getUser_Pw())) {
					System.out.println("--------------------");
					System.out.println(dbMember.getUser_Email());
					System.out.println(dbMember.getUser_Name());
					System.out.println("--------------------");
					
					req.setAttribute("r", "로그인 완료");
					System.out.println("로그인 완료");
					session.setAttribute("loginMember", dbMember);
					session.setAttribute("User_Email", dbMember.getUser_Email());
					session.setMaxInactiveInterval(1800);
					Cookie  c = new Cookie("lastLoginId", m.getUser_Email()); 
					c.setMaxAge(20);
					res.addCookie(c);  
					System.out.println("----------------------------------------------");
					System.out.println(dbMember.getUser_Email());
					result = true;
				} else {
					req.setAttribute("r", "비밀번호 불일치");
					System.out.println("비밀번호 불일치");
					
					result = false;
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r","DB 문제");
		}
		
		return result;
	}
	
	
	// 아이디 중복 체크
	public int idcheck(String User_Email) {
		return ss.getMapper(MemberMapper.class).idcheck(User_Email);
	}
	
	// 회원정보수정
	public  void  update(Member m, HttpServletRequest req, HttpServletResponse  res) {
		
		if (ss.getMapper(MemberMapper.class).update(m) == 1) {
			System.out.println("Update Success!");
		} else {
			System.out.println("Update Fail");
		}
	}

	
	// 회원정보 보기
	public  void  getUserInfo( HttpServletRequest req, HttpServletResponse res) {
		
		Member m = (Member) req.getSession().getAttribute("loginMember");
		System.out.println(m.getUser_Email());
		System.out.println("으악");
		req.setAttribute("UserInfo", ss.getMapper(MemberMapper.class).getMemberById(m));
		
	}
	
	// 아이디 체크
	public boolean  idLoginCheck(HttpServletRequest req, HttpServletResponse res) {
		if (req.getSession().getAttribute("loginMember") != null ) {
			return true;
		}
		else {
			return false;
		}
	}
}
