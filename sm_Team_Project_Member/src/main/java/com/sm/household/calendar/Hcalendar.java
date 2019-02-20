package com.sm.household.calendar;

public class Hcalendar {

	private int Data_No;
	private String Data_Date;
	private int Data_Amount;
	private String Data_Memo;
	private int Book_No;
	private String User_Email;
	private int Ca_Key;
	private int Pay_Id;
	
	private int goal_amount;
	private String Ca_Group;
	private String Ca_Value;
	
	public Hcalendar() {
		// TODO Auto-generated constructor stub
	}

	public Hcalendar(int data_No, String data_Date, int data_Amount, String data_Memo, int book_No, String user_Email,
			int ca_Key, int pay_Id, int goal_amount, String ca_Group, String ca_Value) {
		super();
		Data_No = data_No;
		Data_Date = data_Date;
		Data_Amount = data_Amount;
		Data_Memo = data_Memo;
		Book_No = book_No;
		User_Email = user_Email;
		Ca_Key = ca_Key;
		Pay_Id = pay_Id;
		this.goal_amount = goal_amount;
		Ca_Group = ca_Group;
		Ca_Value = ca_Value;
	}

	public int getData_No() {
		return Data_No;
	}

	public void setData_No(int data_No) {
		Data_No = data_No;
	}

	public String getData_Date() {
		return Data_Date;
	}

	public void setData_Date(String data_Date) {
		Data_Date = data_Date;
	}

	public int getData_Amount() {
		return Data_Amount;
	}

	public void setData_Amount(int data_Amount) {
		Data_Amount = data_Amount;
	}

	public String getData_Memo() {
		return Data_Memo;
	}

	public void setData_Memo(String data_Memo) {
		Data_Memo = data_Memo;
	}

	public int getBook_No() {
		return Book_No;
	}

	public void setBook_No(int book_No) {
		Book_No = book_No;
	}

	public String getUser_Email() {
		return User_Email;
	}

	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}

	public int getCa_Key() {
		return Ca_Key;
	}

	public void setCa_Key(int ca_Key) {
		Ca_Key = ca_Key;
	}

	public int getPay_Id() {
		return Pay_Id;
	}

	public void setPay_Id(int pay_Id) {
		Pay_Id = pay_Id;
	}

	public int getGoal_amount() {
		return goal_amount;
	}

	public void setGoal_amount(int goal_amount) {
		this.goal_amount = goal_amount;
	}

	public String getCa_Group() {
		return Ca_Group;
	}

	public void setCa_Group(String ca_Group) {
		Ca_Group = ca_Group;
	}

	public String getCa_Value() {
		return Ca_Value;
	}

	public void setCa_Value(String ca_Value) {
		Ca_Value = ca_Value;
	}
	
	
	
	
	
}
