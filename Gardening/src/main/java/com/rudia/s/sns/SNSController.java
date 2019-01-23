package com.rudia.s.sns;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rudia.s.member.MemberDAO;

@Controller
public class SNSController {

	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SNSDAO  sDAO;
	
	
	// sns.jsp 페이지로 이동 
	@RequestMapping(value = "/board.go.sns", method = RequestMethod.GET)
	public String snsHome( HttpServletRequest  req, HttpServletResponse  res) {
		
		//로그인이 살아있을때만 게시판이 보이게.
		if (mDAO.loginCheck(req, res)) {
	//		sDAO.getSNSMsg(req, res);  // 조회하기
			sDAO.getSNSMsgRPL(req, res);
			req.setAttribute("contentPage", "board/sns.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	
	// write 하기
	@RequestMapping(value = "/board.write.sns", method = RequestMethod.GET)
	public String write(SNSMsg sm, HttpServletRequest  req, HttpServletResponse  res) {
		
		//로그인체크해서 글 쓸 수 있도록
		if (mDAO.loginCheck(req, res)) {
			sDAO.writeSNS(sm, req, res);
			sDAO.getSNSMsgRPL(req, res);
		//	sDAO.getSNSMsg(req, res);
			req.setAttribute("contentPage", "board/sns.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	// 댓글 write 하기
	@RequestMapping(value = "/board.writeRPL.sns", method = RequestMethod.GET)
	public String write(SNSRepl sl, HttpServletRequest  req, HttpServletResponse  res) {
		
		//로그인체크해서 글 쓸 수 있도록
		if (mDAO.loginCheck(req, res)) {
			sDAO.writeRepl(sl, req, res);
	//		sDAO.getSNSMsg(req, res);   // 단순조회..
			sDAO.getSNSMsgRPL(req, res);  // 뎃글 포함 글조회
			req.setAttribute("contentPage", "board/sns.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	
	// 댓글 update 수정하기
	@RequestMapping(value = "/board.updateRPL.sns", method = RequestMethod.GET)
	public String updateRepl(SNSRepl sl, HttpServletRequest  req, HttpServletResponse  res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.updateRepl(sl, req, res);
			sDAO.getSNSMsgRPL(req, res);  // 뎃글 포함 글조회
			req.setAttribute("contentPage", "board/sns.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	
	// 글 삭제
	@RequestMapping(value = "/board.delete.sns", method = RequestMethod.GET)
	public String delSNS(SNSMsg  sm, HttpServletRequest  req, HttpServletResponse  res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.delSNS(sm, req, res);
			sDAO.getSNSMsgRPL(req, res);  // 뎃글 포함 글조회
			req.setAttribute("contentPage", "board/sns.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	
	// 댓글만 삭제
	@RequestMapping(value = "/board.delete.sns.Repl", method = RequestMethod.GET)
	public String delSNSRepl(SNSRepl  sm, HttpServletRequest  req, HttpServletResponse  res) {
		if (mDAO.loginCheck(req, res)) {
			sDAO.delSNSRepl(sm, req, res);
			sDAO.getSNSMsgRPL(req, res);  // 뎃글 포함 글조회
			req.setAttribute("contentPage", "board/sns.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		
		return "index";
	}
	
}
