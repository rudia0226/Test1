package com.sm.household.bookData;

import java.util.Date;

public class BookDataBean {
	private int Data_No;
	private Date Data_Date;
	private int Data_Amount;
	private String Data_Memo;
	private int Book_No;
	private String User_Email;
	private int Ca_Key;
	private int Pay_Id;
	public BookDataBean(Date day, int amount, String data_Memo, String user_Email, int ca_Key,int pay_Id) {
		Data_Date = day;
		Data_Amount = amount;
		Data_Memo = data_Memo;
		User_Email = user_Email;
		Ca_Key = ca_Key;
		Pay_Id = pay_Id;
	}
	public BookDataBean(int amount, String data_Memo, int ca_Key,int pay_Id) {
		Data_Amount = amount;
		Data_Memo = data_Memo;
		Ca_Key = ca_Key;
		Pay_Id = pay_Id;
	}
	
	public int getData_No() {
		return Data_No;
	}
	public void setData_No(int data_No) {
		Data_No = data_No;
		
	}
	public Date getData_Date() {
		return Data_Date;
	}
	public void setData_Date(Date data_Date) {
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
	
	public int getBook_No() {
		return Book_No;
	}
	public void setBook_No(int book_No) {
		Book_No = book_No;
	}
	public BookDataBean() {
		// TODO Auto-generated constructor stub
	}
}
