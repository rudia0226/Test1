package com.kwon.ihwac2.member;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Member {
	private String im_id;
	private String im_pw;
	private String im_name;
	private String im_addr1;
	private String im_addr2;
	private String im_addr3;
	private String im_img;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String im_id, String im_pw, String im_name, String im_addr1, String im_addr2, String im_addr3,
			String im_img) {
		super();
		this.im_id = im_id;
		this.im_pw = im_pw;
		this.im_name = im_name;
		this.im_addr1 = im_addr1;
		this.im_addr2 = im_addr2;
		this.im_addr3 = im_addr3;
		this.im_img = im_img;
	}

	public String getIm_id() {
		return im_id;
	}
	@XmlElement
	public void setIm_id(String im_id) {
		this.im_id = im_id;
	}

	public String getIm_pw() {
		return im_pw;
	}
	@XmlElement
	public void setIm_pw(String im_pw) {
		this.im_pw = im_pw;
	}

	public String getIm_name() {
		return im_name;
	}
	@XmlElement
	public void setIm_name(String im_name) {
		this.im_name = im_name;
	}

	public String getIm_addr1() {
		return im_addr1;
	}
	@XmlElement
	public void setIm_addr1(String im_addr1) {
		this.im_addr1 = im_addr1;
	}

	public String getIm_addr2() {
		return im_addr2;
	}
	@XmlElement
	public void setIm_addr2(String im_addr2) {
		this.im_addr2 = im_addr2;
	}

	public String getIm_addr3() {
		return im_addr3;
	}
	@XmlElement
	public void setIm_addr3(String im_addr3) {
		this.im_addr3 = im_addr3;
	}

	public String getIm_img() {
		return im_img;
	}
	@XmlElement
	public void setIm_img(String im_img) {
		this.im_img = im_img;
	}

}
