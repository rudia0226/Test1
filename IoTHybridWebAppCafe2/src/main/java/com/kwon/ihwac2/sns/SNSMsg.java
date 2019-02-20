package com.kwon.ihwac2.sns;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class SNSMsg {
	private BigDecimal is_no;
	private String is_owner;
	private String is_txt;
	private Date is_date;
	private String im_img;
	private BigDecimal is_color;

	private List<SNSRepl> is_repls; // ´ñ±Ûµé

	public SNSMsg() {
		// TODO Auto-generated constructor stub
	}

	public SNSMsg(BigDecimal is_no, String is_owner, String is_txt, Date is_date, String im_img, BigDecimal is_color,
			List<SNSRepl> is_repls) {
		super();
		this.is_no = is_no;
		this.is_owner = is_owner;
		this.is_txt = is_txt;
		this.is_date = is_date;
		this.im_img = im_img;
		this.is_color = is_color;
		this.is_repls = is_repls;
	}

	public BigDecimal getIs_no() {
		return is_no;
	}

	public void setIs_no(BigDecimal is_no) {
		this.is_no = is_no;
	}

	public String getIs_owner() {
		return is_owner;
	}

	public void setIs_owner(String is_owner) {
		this.is_owner = is_owner;
	}

	public String getIs_txt() {
		return is_txt;
	}

	public void setIs_txt(String is_txt) {
		this.is_txt = is_txt;
	}

	public Date getIs_date() {
		return is_date;
	}

	public void setIs_date(Date is_date) {
		this.is_date = is_date;
	}

	public String getIm_img() {
		return im_img;
	}

	public void setIm_img(String im_img) {
		this.im_img = im_img;
	}

	public BigDecimal getIs_color() {
		return is_color;
	}

	public void setIs_color(BigDecimal is_color) {
		this.is_color = is_color;
	}

	public List<SNSRepl> getIs_repls() {
		return is_repls;
	}

	public void setIs_repls(List<SNSRepl> is_repls) {
		this.is_repls = is_repls;
	}

}
