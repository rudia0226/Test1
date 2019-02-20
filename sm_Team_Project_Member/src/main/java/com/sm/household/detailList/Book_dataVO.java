package com.sm.household.detailList;

import java.sql.Date;
import java.util.List;

public class Book_dataVO {
	private int Data_No;
	private Date Data_Date;
	private int Data_Amount;
	private String Data_Memo;
	private String User_Email;
	private int Ca_Key;
	private int Pay_Id;
	

	
	public Book_dataVO() {
		// TODO Auto-generated constructor stub
	}



	public Book_dataVO(int data_No, Date data_Date, int data_Amount, String data_Memo, String user_Email, int ca_Key,
			int pay_Id) {
		super();
		Data_No = data_No;
		Data_Date = data_Date;
		Data_Amount = data_Amount;
		Data_Memo = data_Memo;
		User_Email = user_Email;
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


	
	
}
