package com.wws.chart.dao;

import java.util.List;
import java.util.Map;

import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.ColorVO;
import com.wws.chart.vo.selectBoxVO;

@MyMapper
public interface ChartMapper { // mapper Interface
	public abstract List<ChartVO>  list();
	public abstract List<ChartVO>  searchChart(Map<String, Object> map);
	public abstract List<ChartVO>  chartWithFunction(Map<String, Object> map);
	public abstract List<selectBoxVO>  getSelectBoxValue();
	public abstract List<ColorVO>  colorSelectList();
	public abstract void colorUpdate(Map<String, String> map);
}
