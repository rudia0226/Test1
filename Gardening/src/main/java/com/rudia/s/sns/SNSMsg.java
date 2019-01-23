package com.rudia.s.sns;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

// 자바빈
// 온전히 전부 다 표현할 수 있어야.

public class SNSMsg {
	private BigDecimal cs_no;
	private String cs_owner;
	private Date cs_date;
	private String cs_txt;

	// 포함시켜야 할 내용.
	// 글쓴이 이름
	private String m_name; // member table 에 있는거..

	// 댓글들
	private List<SNSRepl> csr;

	// ???

	
	
	public SNSMsg() {
		// TODO Auto-generated constructor stub
	}

	public SNSMsg(BigDecimal cs_no, String cs_owner, Date cs_date, String cs_txt, String m_name, List<SNSRepl> csr) {
		super();
		this.cs_no = cs_no;
		this.cs_owner = cs_owner;
		this.cs_date = cs_date;
		this.cs_txt = cs_txt;
		this.m_name = m_name;
		this.csr = csr;
	}

	public BigDecimal getCs_no() {
		return cs_no;
	}

	public void setCs_no(BigDecimal cs_no) {
		this.cs_no = cs_no;
	}

	public String getCs_owner() {
		return cs_owner;
	}

	public void setCs_owner(String cs_owner) {
		this.cs_owner = cs_owner;
	}

	public Date getCs_date() {
		return cs_date;
	}

	public void setCs_date(Date cs_date) {
		this.cs_date = cs_date;
	}

	public String getCs_txt() {
		return cs_txt;
	}

	public void setCs_txt(String cs_txt) {
		this.cs_txt = cs_txt;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public List<SNSRepl> getCsr() {
		return csr;
	}

	public void setCsr(List<SNSRepl> csr) {
		this.csr = csr;
	}

}
