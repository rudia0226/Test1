package com.wws.chart.vo;

public class selectBoxVO {
	
	private String cds;
	private String nms;
	
	
	@Override
	public String toString() {
		return "selectBoxVO [cds=" + cds + ", nms=" + nms + "]";
	}

	public selectBoxVO() {
		// TODO Auto-generated constructor stub
	}

	public selectBoxVO(String cds, String nms) {
		super();
		this.cds = cds;
		this.nms = nms;
	}

	public String getCds() {
		return cds;
	}

	public void setCds(String cds) {
		this.cds = cds;
	}

	public String getNms() {
		return nms;
	}

	public void setNms(String nms) {
		this.nms = nms;
	}
	
	
}
