package com.kwon.ihwac2.community;

import java.math.BigDecimal;
import java.util.Date;

public class Msg {
	private BigDecimal im_no;
	private String im_from;
	private String im_to;
	private String im_txt;
	private Date im_date;

	public Msg() {
		// TODO Auto-generated constructor stub
	}

	public Msg(BigDecimal im_no, String im_from, String im_to, String im_txt, Date im_date) {
		super();
		this.im_no = im_no;
		this.im_from = im_from;
		this.im_to = im_to;
		this.im_txt = im_txt;
		this.im_date = im_date;
	}

	public BigDecimal getIm_no() {
		return im_no;
	}

	public void setIm_no(BigDecimal im_no) {
		this.im_no = im_no;
	}

	public String getIm_from() {
		return im_from;
	}

	public void setIm_from(String im_from) {
		this.im_from = im_from;
	}

	public String getIm_to() {
		return im_to;
	}

	public void setIm_to(String im_to) {
		this.im_to = im_to;
	}

	public String getIm_txt() {
		return im_txt;
	}

	public void setIm_txt(String im_txt) {
		this.im_txt = im_txt;
	}

	public Date getIm_date() {
		return im_date;
	}

	public void setIm_date(Date im_date) {
		this.im_date = im_date;
	}

}
