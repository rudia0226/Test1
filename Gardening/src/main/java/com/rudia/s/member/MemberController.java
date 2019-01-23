package com.rudia.s.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rudia.s.DateManager;

@Controller
public class MemberController {
	
	@Autowired
	private  MemberDAO  mDAO;
	
	//회원가입창으로 이동
	@RequestMapping(value = "/member.join.go", method = RequestMethod.GET)
	public String home( HttpServletRequest  req, HttpServletResponse  res) {
		
		mDAO.loginCheck(req, res);
		
		DateManager.getCurrentYear(req, res);		// 현재 날짜 챙겨서
		req.setAttribute("contentPage", "member/join.jsp");
		req.setAttribute("bottomPage", "bottom.jsp");
		return "index";
	}
	
	
	// 회원가입 실행
	@RequestMapping(value = "/member.join", method = RequestMethod.POST)
	public String join( Member m,  HttpServletRequest  req, HttpServletResponse  res) {
		
		// DAO에 있는 메소드 부르고 치움
		mDAO.join(m, req, res);
		mDAO.loginCheck(req, res);
		
		// 회원가입 완료 후 돌아갈 페이지
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("bottomPage", "bottom.jsp");
		return "index";
	}
	
	
	// 로그인 실행 : 비번적히니까 POST 로 	
	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
	public String login( Member m,  HttpServletRequest  req, HttpServletResponse  res) {
		
		mDAO.login(m, req, res);
		mDAO.loginCheck(req, res);
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("bottomPage", "bottom.jsp");
		return "index";
		
	}	
	
	
	//제목을 누르면 홈으로 요청
	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String goHome( HttpServletRequest  req, HttpServletResponse  res) {
		
		mDAO.loginCheck(req, res);  // 로그인 되면 상단메뉴바로 바뀌게 하는 메소드 호출
		
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("bottomPage", "bottom.jsp");
		return "index";
	}

	// 로그아웃
	@RequestMapping(value = "/member.logout", method = RequestMethod.GET)
	public String logOut(HttpServletRequest  req, HttpServletResponse  res) {
		
		mDAO.logout(req, res);
		mDAO.loginCheck(req, res);  
		
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("bottomPage", "bottom.jsp");
		return "index";
	}
	
	
	//아이디 체크
	@RequestMapping(value = "/member.check", method = RequestMethod.GET,  produces="application/xml; charset=utf-8" )
	public @ResponseBody Members idCheck(Member m,  HttpServletRequest  req, HttpServletResponse  res) {
		//@ResponseBody : 응답 내용이 다음에 오는 값 (여기서는 Members)
		
		return mDAO.idCheck(m, req, res);
	}
	
	
}

