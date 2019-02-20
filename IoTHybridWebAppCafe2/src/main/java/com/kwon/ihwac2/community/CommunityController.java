package com.kwon.ihwac2.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwon.ihwac2.PageChanger;
import com.kwon.ihwac2.member.Member;
import com.kwon.ihwac2.member.MemberDAO;
import com.kwon.ihwac2.sns.SNSDAO;

@Controller
public class CommunityController {
	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private PageChanger pc;
	@Autowired
	private SNSDAO sDAO;

	@RequestMapping(value = "/community.go", method = RequestMethod.GET)
	public String communityGo(Member m, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.loginCheck(req, res)) {
			cDAO.getAllMember(req, res);
			req.getSession().setAttribute("contentPage", "community/community.jsp");
		} else {
			sDAO.getAllSNSMsg(req, res);
			req.getSession().setAttribute("contentPage", "home.jsp");
		}
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/msg.delete", method = RequestMethod.GET)
	public String msgDelete(Msg m, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.loginCheck(req, res)) {
			cDAO.delMsg(m, req, res);
		}
		pc.remainCurrentPage(req, res);
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/msg.resend", method = RequestMethod.GET)
	public String msgReSend(Msg m, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.loginCheck(req, res)) {
			cDAO.sendMsg(m, req, res);
		}
		pc.remainCurrentPage(req, res);
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/msg.send", method = RequestMethod.GET)
	public String msgSend(Msg m, HttpServletRequest req, HttpServletResponse res) {

		if (mDAO.loginCheck(req, res)) {
			cDAO.sendMsg(m, req, res);
			cDAO.getAllMember(req, res);
			req.getSession().setAttribute("contentPage", "community/community.jsp");
		} else {
			sDAO.getAllSNSMsg(req, res);
			req.getSession().setAttribute("contentPage", "home.jsp");
		}
		cDAO.getMsg(req, res);
		return "index";
	}

}
