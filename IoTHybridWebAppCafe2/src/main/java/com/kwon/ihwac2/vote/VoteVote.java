package com.kwon.ihwac2.vote;

import java.math.BigDecimal;

public class VoteVote {
	private String ivv_im_id;
	private BigDecimal ivv_ivi_no;

	public VoteVote() {
		// TODO Auto-generated constructor stub
	}

	public VoteVote(String ivv_im_id, BigDecimal ivv_ivi_no) {
		super();
		this.ivv_im_id = ivv_im_id;
		this.ivv_ivi_no = ivv_ivi_no;
	}

	public String getIvv_im_id() {
		return ivv_im_id;
	}

	public void setIvv_im_id(String ivv_im_id) {
		this.ivv_im_id = ivv_im_id;
	}

	public BigDecimal getIvv_ivi_no() {
		return ivv_ivi_no;
	}

	public void setIvv_ivi_no(BigDecimal ivv_ivi_no) {
		this.ivv_ivi_no = ivv_ivi_no;
	}

}
