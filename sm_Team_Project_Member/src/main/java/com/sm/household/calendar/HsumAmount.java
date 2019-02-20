package com.sm.household.calendar;

public class HsumAmount {
	private String bdate;
	private int amount;

	public HsumAmount() {
		// TODO Auto-generated constructor stub
	}

	public HsumAmount(String bdate, int amount) {
		super();
		this.bdate = bdate;
		this.amount = amount;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
