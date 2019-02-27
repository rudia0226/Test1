package com.wws.chart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wws.chart.service.ChartService;
import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.ColorVO;
import com.wws.chart.vo.selectBoxVO;

@Controller
@SessionAttributes("ChartVO")
public class ChartController extends AbstractLogger{

	@Autowired
	private ChartService chartService;
	
	// Select Checked All
	@RequestMapping(value="/chart/chartsToMVM", method=RequestMethod.GET,  produces="application/json; chartset=utf-8") 
	public @ResponseBody Map<String,Object>  getChartList(@RequestParam MultiValueMap<String,Object> parametersMultiMap) throws Exception{
		long start  = System.currentTimeMillis();
		Map<String,Object> map = parametersMultiMap.toSingleValueMap();
		List<ChartVO> orderList = chartService.searchChart(map); 
		long end = System.currentTimeMillis();
		Map<String,Object> result = new HashMap<String,Object>();
		String time = String.format("%.2f", (end - start)/1000.0); 
		logger.info("MeasuringTime : " + String.format("%.3f", (end - start)/1000.0));
		result.put("data", orderList);
		result.put("time", time);
		logger.info("�ڷ���");
		return result;
	}
	
	// Select Checked All chartWithFunction
	@RequestMapping(value="/chartWithFunction", method=RequestMethod.GET, produces="application/json; chartset=utf-8") 
	public @ResponseBody Map<String,Object>  chartWithFunction(@RequestParam MultiValueMap<String,Object> parametersMultiMap) throws Exception{
		long start  = System.currentTimeMillis();
		Map<String,Object> map = parametersMultiMap.toSingleValueMap();
		List<ChartVO> orderList = chartService.chartWithFunction(map);
		long end = System.currentTimeMillis();
		Map<String,Object> result = new HashMap<String,Object>();
		String time = String.format("%.2f", (end - start)/1000.0); 
		logger.info("MeasuringTime with Function : " + String.format("%.3f", (end - start)/1000.0));
		result.put("data", orderList); 
		result.put("time", time);
		logger.info("Success getFunctionChartList");
		return result;
	}
	
	// SelectBox For AREA_CD
	@RequestMapping(value="/getSelectBoxValue", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSelectBoxValue() {
		List<selectBoxVO> getSelectBoxValueList = chartService.getSelectBoxValue();
		Map<String, Object> resultForSelectBox = new HashMap<String, Object>();
//		logger.info(getSelectBoxValueList);
		resultForSelectBox.put("selectBox", getSelectBoxValueList);
		return resultForSelectBox;
	}
	
	// Move to PopupWindow
	@RequestMapping(value="/colorChange")
	public String colorChange() {
		return "color";
	}
	
	// Change DB Function color
	@RequestMapping(value="/doColorChange" , method=RequestMethod.GET)
	public String doColorChange(HttpServletRequest request) {
		logger.info("hello Color Change" );   
		String[] cdIds = request.getParameterValues("cdId");
		String[] cmts = request.getParameterValues("cmt");
		for (int i = 0; i < cmts.length; i++) {
//			logger.info("cmt : " + cmts[i] + ", cdId : " + cdIds[i] );
			chartService.colorChange(cmts[i], cdIds[i]);
		}
		return "color";
	}
	
	// SelectLIst Color Chart
	@RequestMapping(value="/selectListColorChart" , method=RequestMethod.GET , produces="application/json; chartset=utf-8")
	public @ResponseBody Map<String, Object> colorList(){
		List<ColorVO> getColorList = chartService.colorList();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("colorChart", getColorList);
		logger.info("selectColor : value= "+ getColorList);
		return  map;
	} 
}
