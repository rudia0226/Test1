package com.sm.household.board;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	// Board List
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList( HttpServletRequest request, HttpServletResponse response) {
		dao.boardList(request);
		
		request.setAttribute("menuPage", "loginMenu.jsp");
		request.setAttribute("contentPage", "board/boardList.jsp");
		
		return "indexMem";
	}

	// Write View
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardWriteView(HttpServletRequest request) {
		
		request.setAttribute("menuPage", "loginMenu.jsp");
		request.setAttribute("contentPage", "board/boardWriteView.jsp");
		
		return "indexMem";
	}

	// Write
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String boardWrite(BoardBean board, HttpSession session, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			dao.boardWrite(board, request);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect:/boardList";
	}
	
	// Edit View
	@RequestMapping(value = "/boardEditView", method = RequestMethod.POST)
	public String boardEditView(BoardBean board, HttpServletRequest request) {
		
		String brd_content = board.getBoard_Content();
		brd_content = brd_content.replace("<br>", "\r\n");
		board.setBoard_Content(brd_content);
		
		
		request.setAttribute("board", board);
		
		request.setAttribute("menuPage", "loginMenu.jsp");
		request.setAttribute("contentPage", "board/boardWriteView.jsp");
		
		return "indexMem";
	}

	// Edit
	@RequestMapping(value = "/boardEdit", method = RequestMethod.POST)
	public String boardEdit(BoardBean board, HttpSession session, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		dao.boardEdit(board);
		
//		boardList(session, request);
		return "redirect:/boardList";
	}

	// Delete View
	@RequestMapping(value = "/boardDeleteView", method = RequestMethod.GET)
	public String boardDeleteView(@RequestParam(value="Board_Id") int Board_Id, HttpServletRequest request) {
		request.setAttribute("Board_Id", Board_Id);
		
		request.setAttribute("menuPage", "loginMenu.jsp");
		request.setAttribute("contentPage", "board/boardDeleteView.jsp");
		
		return "indexMem";
	}
	
	// Delete
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam(value="Board_Id") int Board_Id, HttpServletRequest request) {
		dao.boardDelete(Board_Id);
		
//		boardList(session, request);
		return "redirect:/boardList";
	}
	
}
