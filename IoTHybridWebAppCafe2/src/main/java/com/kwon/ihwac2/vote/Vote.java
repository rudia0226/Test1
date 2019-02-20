package com.kwon.ihwac2.vote;

public class Vote {
	private String iv_title;
	private String iv_owner;
	private String iv_count;

	public Vote() {
		// TODO Auto-generated constructor stub
	}

	public Vote(String iv_title, String iv_owner, String iv_count) {
		super();
		this.iv_title = iv_title;
		this.iv_owner = iv_owner;
		this.iv_count = iv_count;
	}

	public String getIv_title() {
		return iv_title;
	}

	public void setIv_title(String iv_title) {
		this.iv_title = iv_title;
	}

	public String getIv_owner() {
		return iv_owner;
	}

	public void setIv_owner(String iv_owner) {
		this.iv_owner = iv_owner;
	}

	public String getIv_count() {
		return iv_count;
	}

	public void setIv_count(String iv_count) {
		this.iv_count = iv_count;
	}

}
