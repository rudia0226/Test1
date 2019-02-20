package com.sm.household.statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sm.household.detailList.BookCa;

@Controller
public class ChartController {
	
	@Autowired
	ChartDAO dao;
	
	@RequestMapping(value="chart.go", method=RequestMethod.GET)
	public String chartView(@RequestParam(value="ca_group", defaultValue= "2")int ca_group, 
				HttpServletRequest req, HttpServletResponse res) {
		dao.goChart(ca_group, req, res);
		
		if(req.getSession().getAttribute("loginMember") == null) {
			req.setAttribute("menuPage", "member/index.jsp");
			req.setAttribute("contentPage", "member/login.jsp");
			
		} else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "statistics/chart.jsp");
			
		}
		
		return "indexMem";
	}
	
	@RequestMapping(value="chart2.go", method= RequestMethod.GET,
			produces="application/json; charset=utf-8")
	public @ResponseBody List<BookCa> chartView2(@RequestParam(value="ca_group", defaultValue= "2")int ca_group, 
			HttpServletRequest req, HttpServletResponse res) {
		System.out.println(ca_group);
		
		return dao.goChart2(ca_group, req, res);
	}
	
}
