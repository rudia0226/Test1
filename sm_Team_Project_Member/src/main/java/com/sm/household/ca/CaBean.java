package com.sm.household.ca;

import org.apache.ibatis.type.Alias;

@Alias("caBean")
public class CaBean {
	private int Ca_Key;
	private String User_Email;
	private int Ca_Group;
	private int Ca_Type;
	private String Ca_Value;
	private int Ca_Icon;
	
	public CaBean() {
		// TODO Auto-generated constructor stub
	}
	
	

	public CaBean(int ca_Key, String user_Email, int ca_Group, int ca_Type, String ca_Value, int ca_Icon) {
		super();
		Ca_Key = ca_Key;
		User_Email = user_Email;
		Ca_Group = ca_Group;
		Ca_Type = ca_Type;
		Ca_Value = ca_Value;
		Ca_Icon = ca_Icon;
	}
	
	public CaBean(int ca_Key, int ca_Type, String ca_Value) {
		super();
		Ca_Key = ca_Key;
		Ca_Type = ca_Type;
		Ca_Value = ca_Value;
	}
	
	public CaBean(int ca_Group, int ca_Type, String ca_Value, String user_Email) {
		super();
		Ca_Group = ca_Group;
		Ca_Type = ca_Type;
		Ca_Value = ca_Value;
		User_Email = user_Email;
	}
	
	public int getCa_Key() {
		return Ca_Key;
	}

	public void setCa_Key(int ca_Key) {
		Ca_Key = ca_Key;
	}

	public String getUser_Email() {
		return User_Email;
	}

	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
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
	
}
