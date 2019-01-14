package com.wws.chart.dao;

import java.util.List;
import java.util.Map;

import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.selectBoxVO;


public interface ChartDao {
	
	/*public List<ChartVO> list();*/
	public List<ChartVO> searchChart(Map<String,Object> map) ;
	public List<selectBoxVO> getSelectBoxValue();
	
}
