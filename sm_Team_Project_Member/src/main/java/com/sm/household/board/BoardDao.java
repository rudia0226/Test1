package com.sm.household.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.household.Member.Member;

@Service
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public void boardList(HttpServletRequest request) {
		try {
			Member member = (Member) request.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();
			
			ArrayList<BoardBean> boardList =  (ArrayList<BoardBean>) sqlSession.getMapper(BoardMapper.class).boardList(User_Email);
			
			request.setAttribute("boardList", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void boardWrite(BoardBean board , HttpServletRequest request) {
		try {
			
			String brd_content = board.getBoard_Content();
			brd_content = brd_content.replace("\r\n", "<br>");
			board.setBoard_Content(brd_content);
			
			sqlSession.getMapper(BoardMapper.class).boardWrite(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void boardEdit(BoardBean board) {
		try {
			String brd_content = board.getBoard_Content();
			brd_content = brd_content.replace("\r\n", "<br>");
			board.setBoard_Content(brd_content);
			sqlSession.getMapper(BoardMapper.class).boardEdit(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void boardDelete(int Board_Id) {
		try {
			sqlSession.getMapper(BoardMapper.class).boardDelete(Board_Id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
