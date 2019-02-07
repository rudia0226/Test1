package com.wws.chart.vo;

public class ColorVO {

	private String cdId;
	private String cdNm;
	private String useYn;
	private String cmt;
	
	public ColorVO(String cdId, String cdNm, String useYn, String cmt) {
		super();
		this.cdId = cdId;
		this.cdNm = cdNm;
		this.useYn = useYn;
		this.cmt = cmt;
	}
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	
}

