package com.wws.chart.vo;

import java.util.List;

public class OrderVO {

	private String areaNm;
	private String gr; 
	private String totalData;
	private String seoul;
	private String kyunggi;
	private String incheon;
	private String pyungtek;
	private String ulsan;
	private String daejoen;
	private String busan;
	private String gwangju;
	private String numOrderInput;
	
	
	private List<OrderVO>  mainList;
	

	public OrderVO(String areaNm, String gr, String totalData, String seoul, String kyunggi, String incheon,
			String pyungtek, String ulsan, String daejoen, String busan, String gwangju, String numOrderInput,
			List<OrderVO> mainList) {
		super();
		this.areaNm = areaNm;
		this.gr = gr;
		this.totalData = totalData;
		this.seoul = seoul;
		this.kyunggi = kyunggi;
		this.incheon = incheon;
		this.pyungtek = pyungtek;
		this.ulsan = ulsan;
		this.daejoen = daejoen;
		this.busan = busan;
		this.gwangju = gwangju;
		this.numOrderInput = numOrderInput;
		this.mainList = mainList;
	}
	
	
	public List<OrderVO> getMainList() {
		return mainList;
	}
	public void setMainList(List<OrderVO> mainList) {
		this.mainList = mainList;
	}
	public OrderVO() { 	}

	public String getAreaNm() {
		return areaNm;
	}


	public void setAreaNm(String areaNm) {
		this.areaNm = areaNm;
	}


	public String getGr() {
		return gr;
	}

	public void setGr(String gr) {
		this.gr = gr;
	}

	public String getTotalData() {
		return totalData;
	}

	public void setTotalData(String totalData) {
		this.totalData = totalData;
	}

	public String getSeoul() {
		return seoul;
	}

	public void setSeoul(String seoul) {
		this.seoul = seoul;
	}

	public String getKyunggi() {
		return kyunggi;
	}

	public void setKyunggi(String kyunggi) {
		this.kyunggi = kyunggi;
	}

	public String getIncheon() {
		return incheon;
	}

	public void setIncheon(String incheon) {
		this.incheon = incheon;
	}

	public String getPyungtek() {
		return pyungtek;
	}

	public void setPyungtek(String pyungtek) {
		this.pyungtek = pyungtek;
	}

	public String getUlsan() {
		return ulsan;
	}

	public void setUlsan(String ulsan) {
		this.ulsan = ulsan;
	}

	public String getDaejoen() {
		return daejoen;
	}

	public void setDaejoen(String daejoen) {
		this.daejoen = daejoen;
	}

	public String getBusan() {
		return busan;
	}

	public void setBusan(String busan) {
		this.busan = busan;
	}

	public String getGwangju() {
		return gwangju;
	}

	public void setGwangju(String gwangju) {
		this.gwangju = gwangju;
	}

	public String getNumOrderInput() {
		return numOrderInput;
	}

	public void setNumOrderInput(String numOrderInput) {
		this.numOrderInput = numOrderInput;
	}
	
	
}
