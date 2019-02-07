package com.wws.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wws.chart.service.ChartService;
import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.selectBoxVO;

@Controller
@SessionAttributes("ChartVO")
public class ChartController {

	@Autowired
	private ChartService chartService;
	
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
		System.out.println("Success getChartList");
		return result;
	}
	
	// SelectBox For AREA_CD
	@RequestMapping(value="/getSelectBoxValue", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getSelectBoxValue() {
		List<selectBoxVO> getSelectBoxValueList = chartService.getSelectBoxValue();
		Map<String, Object> resultForSelectBox = new HashMap<String, Object>();
		//System.out.println(getSelectBoxValueList);
		resultForSelectBox.put("selectBox", getSelectBoxValueList);
		return resultForSelectBox;
	}
	
	@RequestMapping(value="/colorChange", method = RequestMethod.GET)
	public String colorChange() {
		return "color";
	}
	
	@RequestMapping(value="/doColorChange", method = RequestMethod.POST , produces="application/json; chartset=utf-8") 
	@ResponseBody
	public String doColorChange(@RequestParam MultiValueMap<String,Object> param) {
		
		String status = ""; 
		param.get("datas");
		System.out.println("넘어온 데이터 : " + param.get("datas"));
		Map<String,Object> map = param.toSingleValueMap();
		System.out.println(map);
		/*
		try {
			chartService.colorChange(map);
			status = "success";
		} catch (Exception e) {
			status = "false";
		}
		*/
		return status;
	}
	
	
	
	
}
