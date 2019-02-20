package com.sm.household.calendar;

public class Member {
	private String User_Email;
	private int goal_amount;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String user_Email, int goal_amount) {
		super();
		User_Email = user_Email;
		this.goal_amount = goal_amount;
	}

	public String getUser_Email() {
		return User_Email;
	}

	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}

	public int getGoal_amount() {
		return goal_amount;
	}

	public void setGoal_amount(int goal_amount) {
		this.goal_amount = goal_amount;
	}
	
	
}
