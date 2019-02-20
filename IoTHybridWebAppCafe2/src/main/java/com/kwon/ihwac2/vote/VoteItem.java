package com.kwon.ihwac2.vote;

import java.math.BigDecimal;

public class VoteItem {
	private BigDecimal ivi_no;
	private String ivi_item;
	private BigDecimal ivi_count;
	private BigDecimal ivi_percent;

	public VoteItem() {
		// TODO Auto-generated constructor stub
	}

	public VoteItem(BigDecimal ivi_no, String ivi_item, BigDecimal ivi_count, BigDecimal ivi_percent) {
		super();
		this.ivi_no = ivi_no;
		this.ivi_item = ivi_item;
		this.ivi_count = ivi_count;
		this.ivi_percent = ivi_percent;
	}

	public BigDecimal getIvi_no() {
		return ivi_no;
	}

	public void setIvi_no(BigDecimal ivi_no) {
		this.ivi_no = ivi_no;
	}

	public String getIvi_item() {
		return ivi_item;
	}

	public void setIvi_item(String ivi_item) {
		this.ivi_item = ivi_item;
	}

	public BigDecimal getIvi_count() {
		return ivi_count;
	}

	public void setIvi_count(BigDecimal ivi_count) {
		this.ivi_count = ivi_count;
	}

	public BigDecimal getIvi_percent() {
		return ivi_percent;
	}

	public void setIvi_percent(BigDecimal ivi_percent) {
		this.ivi_percent = ivi_percent;
	}

}
