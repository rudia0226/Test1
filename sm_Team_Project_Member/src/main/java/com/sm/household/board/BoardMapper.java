package com.sm.household.board;

import java.util.List;

public interface BoardMapper {
	public List<BoardBean> boardList(String User_Email);	//select
	
	public void boardWrite(BoardBean board);  //update
	public void boardEdit(BoardBean board); 	 //update
	
	public void boardDelete(int Book_No);	//delete
}
