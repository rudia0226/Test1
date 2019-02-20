package com.kwon.ihwac2.dataroom;

import java.math.BigDecimal;
import java.util.Date;

public class Data {
	private BigDecimal id_id;
	private String id_owner;
	private String id_title;
	private String id_file;
	private Date id_date;

	public Data() {
		// TODO Auto-generated constructor stub
	}

	public Data(BigDecimal id_id, String id_owner, String id_title, String id_file, Date id_date) {
		super();
		this.id_id = id_id;
		this.id_owner = id_owner;
		this.id_title = id_title;
		this.id_file = id_file;
		this.id_date = id_date;
	}

	public BigDecimal getId_id() {
		return id_id;
	}

	public void setId_id(BigDecimal id_id) {
		this.id_id = id_id;
	}

	public String getId_owner() {
		return id_owner;
	}

	public void setId_owner(String id_owner) {
		this.id_owner = id_owner;
	}

	public String getId_title() {
		return id_title;
	}

	public void setId_title(String id_title) {
		this.id_title = id_title;
	}

	public String getId_file() {
		return id_file;
	}

	public void setId_file(String id_file) {
		this.id_file = id_file;
	}

	public Date getId_date() {
		return id_date;
	}

	public void setId_date(Date id_date) {
		this.id_date = id_date;
	}

}
