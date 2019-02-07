package com.wws.chart.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wws.chart.dao.ChartDao;
import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.ColorVO;
import com.wws.chart.vo.selectBoxVO;


@Service
public class ChartServiceImpl implements ChartService{

	@Resource
	private ChartDao  chartdao;

	// Select Checked All
	@Override
	public List<ChartVO>  searchChart(Map<String,Object> map) {
		System.out.println("Service part");
		return chartdao.searchChart(map);
	}
	@Override
	public List<ChartVO>  chartWithFunction(Map<String,Object> map) {
		System.out.println("Service part - chartWithFunction");
		return chartdao.chartWithFunction(map);
	}
	//SelectBox For AREA_CD
	@Override
	public List<selectBoxVO> getSelectBoxValue() {
		System.out.println("Service part - selectBox");
		return chartdao.getSelectBoxValue();
	}
	
	// change chart color 
	@Override
	public void colorChange(String cmt, String cdId) {
		chartdao.colorChange(cmt, cdId);
	}
	
	// selectList color chart
	@Override
	public List<ColorVO> colorList() {
		return chartdao.colorList();
	}
}
