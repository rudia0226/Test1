package com.rudia.s.sns;

import java.math.BigDecimal;
import java.util.Date;

public class SNSRepl {
	private BigDecimal csr_no;
	private BigDecimal csr_cs_no;
	private String csr_owner;
	private Date csr_date;
	private String csr_txt;

	public SNSRepl() {
		// TODO Auto-generated constructor stub
	}
	
	public BigDecimal getCsr_no() {
		return csr_no;
	}

	public void setCsr_no(BigDecimal csr_no) {
		this.csr_no = csr_no;
	}

	public BigDecimal getCsr_cs_no() {
		return csr_cs_no;
	}

	public void setCsr_cs_no(BigDecimal csr_cs_no) {
		this.csr_cs_no = csr_cs_no;
	}

	public String getCsr_owner() {
		return csr_owner;
	}

	public void setCsr_owner(String csr_owner) {
		this.csr_owner = csr_owner;
	}

	public Date getCsr_date() {
		return csr_date;
	}

	public void setCsr_date(Date csr_date) {
		this.csr_date = csr_date;
	}

	public String getCsr_txt() {
		return csr_txt;
	}

	public void setCsr_txt(String csr_txt) {
		this.csr_txt = csr_txt;
	}

	public SNSRepl(BigDecimal csr_no, BigDecimal csr_cs_no, String csr_owner, Date csr_date, String csr_txt) {
		super();
		this.csr_no = csr_no;
		this.csr_cs_no = csr_cs_no;
		this.csr_owner = csr_owner;
		this.csr_date = csr_date;
		this.csr_txt = csr_txt;
	}

}
