package com.kwon.ihwac2.vote;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwon.ihwac2.community.CommunityDAO;
import com.kwon.ihwac2.member.Member;
import com.kwon.ihwac2.member.MemberDAO;

@Controller
public class VoteController {

	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private VoteDAO vDAO;

	@RequestMapping(value = "/vote.do", method = RequestMethod.GET)
	public String voteDo(VoteVote vv, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			vDAO.vote(vv, req, res);
			vDAO.getVote(req, res);
			req.getSession().setAttribute("contentPage", "vote/vote.jsp");
		} else {
			req.getSession().setAttribute("contentPage", "home.jsp");
		}
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/vote.go", method = RequestMethod.GET)
	public String voteGo(Member m, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			vDAO.getVote(req, res);
			req.getSession().setAttribute("contentPage", "vote/vote.jsp");
		} else {
			req.getSession().setAttribute("contentPage", "home.jsp");
		}
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/vote.reg", method = RequestMethod.GET)
	public String voteReg(Vote v, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			vDAO.regVote(v, req, res);
			vDAO.getVote(req, res);
			req.getSession().setAttribute("contentPage", "vote/vote.jsp");
		} else {
			req.getSession().setAttribute("contentPage", "home.jsp");
		}
		cDAO.getMsg(req, res);
		return "index";
	}
}
