package com.rudia.s;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rudia.s.member.MemberDAO;

@Controller
public class HomeController {
	
	
	@Autowired
	private  MemberDAO mDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( HttpServletRequest  req, HttpServletResponse  res) {
		
		mDAO.loginCheck(req, res);  // 로그인 되면 상단메뉴바로 바뀌게 하는 메소드 호출
		
		req.setAttribute("contentPage", "home.jsp");
		req.setAttribute("bottomPage", "bottom.jsp");
		return "index";
	}
	
	

	
	
	
}
