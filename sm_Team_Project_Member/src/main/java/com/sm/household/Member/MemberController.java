package com.sm.household.Member;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private  MemberDAO  mDAO;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest  req, HttpServletResponse res) {
		
		if(req.getSession().getAttribute("loginMember") == null) {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/index.jsp");
			  
		} else {
			return "redirect:/calendar";
		}
		return "indexMem";
	}
	
	// 로그인창 이동
	@RequestMapping(value="/member.loginGo", method=RequestMethod.GET)
	public  String  loginGo(Member m,  HttpServletRequest req, HttpServletResponse  res) {
		req.setAttribute("menuPage", "loginMenu.jsp");
		req.setAttribute("contentPage", "member/login.jsp");
		return "indexMem";
	}
	
	// 로그인 실행
	@RequestMapping(value="/member.loginDo" , method=RequestMethod.POST)
	public  String login(Member m, HttpServletRequest req, HttpServletResponse  res) {

		//로그인 성공
		if(mDAO.login(m, req, res)) {
			mDAO.getUserInfo(req, res);
			/*req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "re.jsp");*/
			
			return "redirect:/calendar";
			
		// 실패
		} else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/login.jsp");
		}
		
		return "indexMem";
	}
	
	
	//회원가입창 이동
	@RequestMapping(value="/member.joinGo", method=RequestMethod.GET)
	public  String  joinGo(Member m,  HttpServletRequest req, HttpServletResponse  res) {
		req.setAttribute("menuPage", "loginMenu.jsp");
		req.setAttribute("contentPage", "member/join.jsp");
		return "indexMem";
	}
	
	// 회원가입창에서 로그인,회원가입 선택창으로 돌아가기 이동
	@RequestMapping(value="/member.returnGo", method=RequestMethod.GET)
	public  String retrunGo(Member m,  HttpServletRequest req, HttpServletResponse  res) {
		req.setAttribute("menuPage", "loginMenu.jsp");
		req.setAttribute("contentPage", "member/index.jsp");
		return "indexMem";
	}
	
	
	// 로그인 상태에서 돌아가기 이동
	@RequestMapping(value="/member.return.log", method=RequestMethod.GET)
	public  String returnGoLGN(Member m, HttpServletRequest req, HttpServletResponse res) {
	
		if (mDAO.idLoginCheck(req, res)) {

			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/info.jsp");
		}
		else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/login.jsp");
		}
		
		return "indexMem";
	}
	
	//회원가입 실행
	@RequestMapping(value="/member.joinDo", method=RequestMethod.POST)
	public  String joinDo(Member m,  HttpServletRequest req, HttpServletResponse  res) {
		
		mDAO.join(m, req, res);
		req.setAttribute("menuPage", "loginMenu.jsp");
		req.setAttribute("contentPage", "member/login.jsp");
		return "indexMem";
	}
	
	// 아이디 중복체크
	@RequestMapping(value = "/idcheck.do",produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String User_Email) {
		int count = 0;
		System.out.println(User_Email);
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = mDAO.idcheck(User_Email);
		map.put("cnt", count);
		System.out.println("count : " + count);

		return map;
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public  String logout(HttpServletRequest req, HttpServletResponse  res) {
		req.getSession().removeAttribute("loginMember");
		req.getSession().removeAttribute("User_Email");
		
		req.setAttribute("menuPage", "loginMenu.jsp");
		req.setAttribute("contentPage", "member/index.jsp");
		
		return "indexMem";
	}
	
	// 회원정보 수정으로 이동
	@RequestMapping(value="/member.updateGo", method=RequestMethod.GET)
	public  String updateGo(HttpServletRequest req, HttpServletResponse  res) {
		
		Member a = (Member) req.getSession().getAttribute("loginMember");
		System.out.println(a.getUser_Email()); 
		
		req.setAttribute("menuPage", "loginMenu.jsp");
		req.setAttribute("contentPage", "member/update.jsp");
		 
		return "indexMem";
	}
	
	
	// 회원정보 수정
	@RequestMapping(value="/member.update.do", method=RequestMethod.POST)
	public  String updateDo(Member m, HttpServletRequest req, HttpServletResponse  res) {
		
		if (mDAO.login(m, req, res)) {
			mDAO.update(m, req, res);
			
			mDAO.login(m, req, res);
			return "redirect:/calendar";
		}
		else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/login.jsp");
		}
		
		return "indexMem";
	}
	
	
	// 회원정보 보기으로 이동
	@RequestMapping(value="/member.infoView", method=RequestMethod.GET)
	public  String infoView( HttpServletRequest req, HttpServletResponse  res) {
		
		if (mDAO.idLoginCheck(req, res)) {
			mDAO.getUserInfo(req, res);
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/info.jsp");
		}
		else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/login.jsp");
		}
		return "indexMem";
	}
	
	/*// 제목을 누르면 홈으로 요청
	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String goHome( HttpServletRequest  req, HttpServletResponse  res) {
		
		if (mDAO.idLoginCheck(req, res)) {
			mDAO.getUserInfo(req, res);
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "calendar/calendar.jsp");
		}
		else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "member/login.jsp");
		}
		return "indexMem";
	}*/
	
	
}

