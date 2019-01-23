package com.rudia.s.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rudia.s.member.MemberDAO;

@Controller
public class BoardController {
	
	
	@Autowired
	private  BoardDAO  bDAO;
	
	@Autowired
	private  MemberDAO  mDAO;
	
	//trees 게시판으로 이동
	@RequestMapping(value = "/board.go.trees", method = RequestMethod.GET)
	public String home( HttpServletRequest  req, HttpServletResponse  res) {
		
		//로그인이 살아있을때만 게시판이 보이게.
		if (mDAO.loginCheck(req, res)) {
			bDAO.getAllBoard(req, res); //10/02 : 전체 목록 불러오기
			bDAO.paging(1, req, res); // 10/02 : 그중에 1페이지 것만 추출
			req.setAttribute("contentPage", "board/trees.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	
	// 게시판에 파일 등록하기
	@RequestMapping(value = "/board.reg", method = RequestMethod.POST)
	public String reg( HttpServletRequest  req, HttpServletResponse  res) {
		
		bDAO.reg(req, res);
		
		if (mDAO.loginCheck(req, res)) {
			req.setAttribute("contentPage", "board/trees.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	// 10/02 : 이미지 눌렀을때 주소처리
	@RequestMapping(value = "/board.page.change", method = RequestMethod.GET)
	public String pc( HttpServletRequest  req, HttpServletResponse  res) {
		
		//로그인이 살아있을때만 게시판이 보이게.
		if (mDAO.loginCheck(req, res)) {
			int p = Integer.parseInt(req.getParameter("page"));  // 보내준 페이지 번호p를 받아서 거기로 넘겨주는..
			bDAO.paging(p, req, res);  // 눌러진 번호로 페이지 바꿈
			
			req.setAttribute("contentPage", "board/trees.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
	// 10/04 : 검색하면 ..나오는..
	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String bs(Board b,   HttpServletRequest  req, HttpServletResponse  res) {
		
		
		
		//로그인이 살아있을때만 게시판이 보이게.
		if (mDAO.loginCheck(req, res)) {
			bDAO.searchBoard(b, req, res); //검색
			bDAO.paging(1, req, res); //검색한거 1페이지 분량으로 나오게끔 페이징처리
			
			req.setAttribute("contentPage", "board/trees.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		} else {
			req.setAttribute("contentPage", "home.jsp");
			req.setAttribute("bottomPage", "bottom.jsp");
		}
		return "index";
	}
	
}
