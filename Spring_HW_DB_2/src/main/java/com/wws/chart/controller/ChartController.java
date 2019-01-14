package com.wws.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wws.chart.aop.LoggerAspect;
import com.wws.chart.service.ChartService;
import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.selectBoxVO;


@Controller
@SessionAttributes("ChartVO")
public class ChartController {

	@Autowired
	private ChartService chartService;

	
	
	// Select All 
	/*
	@RequestMapping(value = "/chartsXml", method = RequestMethod.GET)
	public @ResponseBody ChartVOXML getChartListXml() {
		
		List<ChartVO> list = chartService.list();
		ChartVOXML xml = new ChartVOXML("success",list);
		System.out.println("selectAll 성공");
		return xml;
	}
	*/
	
	
	
	// Select Checked All
	@RequestMapping(value="/chartsToMVM", method=RequestMethod.GET, produces="application/json; chartset=utf-8") 
	public @ResponseBody Map<String,Object>  getChartList(@RequestParam MultiValueMap<String,Object> parametersMultiMap) throws Exception{
		
		long start  = System.currentTimeMillis();
		
		Map<String,Object> map = parametersMultiMap.toSingleValueMap();
		List<ChartVO> orderList = chartService.searchChart(map);
		
		long end = System.currentTimeMillis();
		Map<String,Object> result = new HashMap<String,Object>();
		
		String time = String.format("%.2f", (end - start)/1000.0); 
		
		System.out.println("MeasuringTime : " + String.format("%.3f", (end - start)/1000.0));
		
		result.put("data", orderList);
		result.put("time", time);
		/*
		System.out.println("Map으로 받은 값 : " + parametersMultiMap );
		System.out.println("map : " + map);
		for (String key : map.keySet()) {
			System.out.println( "--" +key+ " : " + map.get(key));
		System.out.println("Dao 넘기고 다시 넘어온 값 : " + orderList);
		System.out.println("selectOrderAll 성공");
		
		ChartVOXML xml = new ChartVOXML("success", orderList);
		System.out.println("xml : " + xml);
		*/
		
		return result;
		
	}
	
	
	
	@RequestMapping(value="/getSelectBoxValue", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getSelectBoxValue() {
		
		List<selectBoxVO> getSelectBoxValueList = chartService.getSelectBoxValue();
		Map<String, Object> resultForSelectBox = new HashMap<String, Object>();
		
		System.out.println(getSelectBoxValueList);
		
		resultForSelectBox.put("selectBox", getSelectBoxValueList);
		
		System.out.println("Controller : New SelectBox");
		
		return resultForSelectBox;
	}
	
}
