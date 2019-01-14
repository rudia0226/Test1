package com.wws.chart.service;

import java.util.List;
import java.util.Map;

import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.selectBoxVO;

public interface ChartService {
	
	/*public List<ChartVO>  list();*/
	public List<ChartVO> searchChart(Map<String,Object> map);
	public List<selectBoxVO> getSelectBoxValue();
}
