package com.kwon.ihwac2.sns;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwon.ihwac2.community.CommunityDAO;
import com.kwon.ihwac2.member.MemberDAO;

@Controller
public class SNSController {
	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private SNSDAO sDAO;

	@RequestMapping(value = "/sns.delete", method = RequestMethod.GET)
	public String snsDelete(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.deleteSNSMsg(sm, req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/sns.repl.delete", method = RequestMethod.GET)
	public String snsReplDelete(SNSRepl sr, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.deleteSNSRepl(sr, req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/sns.repl.write", method = RequestMethod.GET)
	public String snsReplWrite(SNSRepl sr, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.writeSNSRepl(sr, req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/sns.update", method = RequestMethod.GET)
	public String snsUpdate(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.updateSNSMsg(sm, req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/sns.write", method = RequestMethod.GET)
	public String snsWrite(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.writeSNSMsg(sm, req, res);
		}
		sDAO.getAllSNSMsg(req, res);
		req.getSession().setAttribute("contentPage", "home.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

}
