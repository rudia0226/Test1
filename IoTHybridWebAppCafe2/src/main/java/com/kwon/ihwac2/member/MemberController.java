package com.kwon.ihwac2.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kwon.ihwac2.PageChanger;
import com.kwon.ihwac2.community.CommunityDAO;
import com.kwon.ihwac2.sns.SNSDAO;

@Controller
public class MemberController {
	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private PageChanger pc;
	@Autowired
	private SNSDAO sDAO;

	@RequestMapping(value = "/bye.do", method = RequestMethod.GET)
	public String byeDo(Member m, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			mDAO.bye(m, req, res);
			mDAO.logout(req, res);
			mDAO.loginCheck(req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}
	
	
	@RequestMapping(value = "/member.id.check", 
			method = RequestMethod.GET,
			produces = "application/xml; charset=utf-8")
	public @ResponseBody Members idCheck(Member m, HttpServletRequest req, HttpServletResponse res) {
		return mDAO.idCheck(m, req, res);
	}
	
	
	
	
	

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String joinDo(Member m, HttpServletRequest req, HttpServletResponse res) {
		mDAO.join(m, req, res);
		mDAO.loginCheck(req, res);
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/join.go", method = RequestMethod.GET)
	public String joinGo(HttpServletRequest req, HttpServletResponse res) {
		mDAO.loginCheck(req, res);
		req.getSession().setAttribute("contentPage", "member/join.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginDo(Member m, HttpServletRequest req, HttpServletResponse res) {
		mDAO.login(m, req, res);
		mDAO.loginCheck(req, res);
		pc.remainCurrentPage(req, res);
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutDo(HttpServletRequest req, HttpServletResponse res) {
		mDAO.logout(req, res);
		mDAO.loginCheck(req, res);
		pc.remainCurrentPage(req, res);
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/member.update.do", method = RequestMethod.POST)
	public String updateDo(Member m, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			mDAO.update(m, req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/member.update.go", method = RequestMethod.GET)
	public String updateGo(HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			req.getSession().setAttribute("contentPage", "member/update.jsp");
		} else {
			sDAO.getAllSNSMsg(req, res);
			req.getSession().setAttribute("contentPage", "home.jsp");
		}
		cDAO.getMsg(req, res);
		return "index";
	}
}
