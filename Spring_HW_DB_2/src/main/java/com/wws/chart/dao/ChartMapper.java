package com.wws.chart.dao;

import java.util.List;
import java.util.Map;

import com.wws.chart.vo.ChartVO;

@MyMapper
public interface ChartMapper {
	public abstract List<ChartVO>  list();
	public abstract List<ChartVO>  searchChart(Map<String, Object> map);
}
