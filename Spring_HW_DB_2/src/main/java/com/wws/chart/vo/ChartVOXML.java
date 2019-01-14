package com.wws.chart.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="charts")
public class ChartVOXML {
	 private String status;
	private List<ChartVO>  chart;
	
	public ChartVOXML() {
		// TODO Auto-generated constructor stub
	}
	
	public ChartVOXML(String status, List<ChartVO> chart) {
		super();
		this.status = status;
		this.chart = chart;
	}

	@XmlElement(name="chart")
	public void setChart(List<ChartVO> chart) {
		this.chart = chart;
	}
	public List<ChartVO> getChart() {
		return chart;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}


