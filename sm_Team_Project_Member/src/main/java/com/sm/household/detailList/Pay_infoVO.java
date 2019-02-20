package com.sm.household.detailList;

public class Pay_infoVO {
	private int Pay_Id;
	private String User_Email;
	private String Pay_Value;
	
	public Pay_infoVO() {
		// TODO Auto-generated constructor stub
	}
	
	public Pay_infoVO(int pay_Id, String user_Email, String pay_Value) {
		super();
		Pay_Id = pay_Id;
		User_Email = user_Email;
		Pay_Value = pay_Value;
	}
	
	public int getPay_Id() {
		return Pay_Id;
	}
	public void setPay_Id(int pay_Id) {
		Pay_Id = pay_Id;
	}
	public String getUser_Email() {
		return User_Email;
	}
	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}
	public String getPay_Value() {
		return Pay_Value;
	}
	public void setPay_Value(String pay_Value) {
		Pay_Value = pay_Value;
	}
	
	
}
