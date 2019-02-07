package com.wws.chart.dao;

import java.util.List;
import java.util.Map;

import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.ColorVO;

@MyMapper
public interface ChartMapper {
	public abstract List<ChartVO>  list();
	public abstract List<ChartVO>  searchChart(Map<String, Object> map);
	public abstract List<ChartVO>  chartWithFunction(Map<String, Object> map);
	public abstract List<ColorVO>  colorList();
}
