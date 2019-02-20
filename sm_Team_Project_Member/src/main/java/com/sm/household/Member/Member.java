package com.sm.household.Member;

import java.util.Date;

public class Member {
	private String User_Email;
	private String User_Name;
	private String User_Pw;
	private String User_Birth;
	private String User_Sex;
	private int Goal_Amount;
	private Date join_Date;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String user_Email, String user_Name, String user_Pw, String user_Birth, String user_Sex,
			int goal_Amount, Date join_Date) {
		super();
		User_Email = user_Email;
		User_Name = user_Name;
		User_Pw = user_Pw;
		User_Birth = user_Birth;
		User_Sex = user_Sex;
		Goal_Amount = goal_Amount;
		this.join_Date = join_Date;
	}

	public String getUser_Email() {
		return User_Email;
	}

	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}

	public String getUser_Name() {
		return User_Name;
	}

	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}

	public String getUser_Pw() {
		return User_Pw;
	}

	public void setUser_Pw(String user_Pw) {
		User_Pw = user_Pw;
	}

	public String getUser_Birth() {
		return User_Birth;
	}

	public void setUser_Birth(String user_Birth) {
		User_Birth = user_Birth;
	}

	public String getUser_Sex() {
		return User_Sex;
	}

	public void setUser_Sex(String user_Sex) {
		User_Sex = user_Sex;
	}

	public int getGoal_Amount() {
		return Goal_Amount;
	}

	public void setGoal_Amount(int goal_Amount) {
		Goal_Amount = goal_Amount;
	}

	public Date getJoin_Date() {
		return join_Date;
	}

	public void setJoin_Date(Date join_Date) {
		this.join_Date = join_Date;
	}
	
	

}
