package com.wws.chart.vo;

import java.util.List;
import lombok.Data;

@Data
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
	

	
	
}
