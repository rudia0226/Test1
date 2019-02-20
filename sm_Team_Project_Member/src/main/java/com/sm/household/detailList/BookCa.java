package com.sm.household.detailList;

import java.util.Date;
import java.util.List;

public class BookCa {
	private int Data_No;
	private Date Data_Date;
	private int Data_Amount;
	private String Data_Memo;
	private String User_Email;
	private int Ca_Key;
	private int Pay_Id;
	private int Ca_Group;
	private int Ca_Type;
	private String Ca_Value;
	private int Ca_Icon;
	private String Pay_Value;

	public BookCa() {
		// TODO Auto-generated constructor stub
	}

	public BookCa(int data_No, Date data_Date, int data_Amount, String data_Memo, String user_Email, int ca_Key,
			int pay_Id, int ca_Group, int ca_Type, String ca_Value, int ca_Icon, String pay_Value) {
		super();
		Data_No = data_No;
		Data_Date = data_Date;
		Data_Amount = data_Amount;
		Data_Memo = data_Memo;
		User_Email = user_Email;
		Ca_Key = ca_Key;
		Pay_Id = pay_Id;
		Ca_Group = ca_Group;
		Ca_Type = ca_Type;
		Ca_Value = ca_Value;
		Ca_Icon = ca_Icon;
		Pay_Value = pay_Value;
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

	public int getCa_Group() {
		return Ca_Group;
	}

	public void setCa_Group(int ca_Group) {
		Ca_Group = ca_Group;
	}

	public int getCa_Type() {
		return Ca_Type;
	}

	public void setCa_Type(int ca_Type) {
		Ca_Type = ca_Type;
	}

	public String getCa_Value() {
		return Ca_Value;
	}

	public void setCa_Value(String ca_Value) {
		Ca_Value = ca_Value;
	}

	public int getCa_Icon() {
		return Ca_Icon;
	}

	public void setCa_Icon(int ca_Icon) {
		Ca_Icon = ca_Icon;
	}

	public String getPay_Value() {
		return Pay_Value;
	}

	public void setPay_Value(String pay_Value) {
		Pay_Value = pay_Value;
	}

	
	
}
