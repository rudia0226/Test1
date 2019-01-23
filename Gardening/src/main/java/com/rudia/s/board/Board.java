package com.rudia.s.board;

public class Board {
	private  String s_name; 
	private  String e_name; 
	private  String p_img;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	public Board(String s_name, String e_name, String p_img) {
		super();
		this.s_name = s_name;
		this.e_name = e_name;
		this.p_img = p_img;
	}

	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}  
	       
}
