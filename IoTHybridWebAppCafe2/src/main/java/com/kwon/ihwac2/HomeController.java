package com.kwon.ihwac2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwon.ihwac2.community.CommunityDAO;
import com.kwon.ihwac2.member.MemberDAO;
import com.kwon.ihwac2.sns.SNSDAO;

@Controller
public class HomeController {

	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private SNSDAO sDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse res) {
		mDAO.autologin(req, res);
		mDAO.loginCheck(req, res);
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/home.go", method = RequestMethod.GET)
	public String home2(HttpServletRequest req, HttpServletResponse res) {
		mDAO.loginCheck(req, res);
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

}
