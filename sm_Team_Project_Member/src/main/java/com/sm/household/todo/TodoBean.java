package com.sm.household.todo;

public class TodoBean {
	private int Todo_Id;
	private String Todo_Title;

	private String User_Email;
	
	public TodoBean() {
		
	}

	public int getTodo_Id() {
		return Todo_Id;
	}

	public void setTodo_Id(int todo_Id) {
		Todo_Id = todo_Id;
	}

	public String getTodo_Title() {
		return Todo_Title;
	}

	public void setTodo_Title(String todo_Title) {
		Todo_Title = todo_Title;
	}

	public String getUser_Email() {
		return User_Email;
	}

	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}
	
}