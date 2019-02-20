package com.sm.household.board;

public class BoardBean {
	private int Board_Id;
	private String Board_Title;
	private String Board_Content;

	private String User_Email; 
	
	public BoardBean() {
		
	}

	public int getBoard_Id() {
		return Board_Id;
	}

	public void setBoard_Id(int board_Id) {
		Board_Id = board_Id;
	}

	public String getBoard_Title() {
		return Board_Title;
	}

	public void setBoard_Title(String board_Title) {
		Board_Title = board_Title;
	}

	public String getBoard_Content() {
		return Board_Content;
	}

	public void setBoard_Content(String board_Content) {
		Board_Content = board_Content;
	}

	public String getUser_Email() {
		return User_Email;
	}

	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}
	
}
