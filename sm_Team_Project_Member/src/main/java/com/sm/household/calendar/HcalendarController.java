package com.sm.household.calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HcalendarController {
	
	@Autowired
	private HcalendarDAO hDAO;
	
	

	@RequestMapping(value= {"/calendar", "/home.go"},method=RequestMethod.GET)
	public String viewDo(Hcalendar h, HttpServletRequest request, HttpServletResponse response) {			
		
		
		if (request.getSession().getAttribute("User_Email") != null || 
				request.getSession().getAttribute("loginMember") != null) {
			Datemanager.current_date(request);
			
			hDAO.get_date(h, request);
			request.setAttribute("menuPage", "loginMenu.jsp"); 
			request.setAttribute("contentPage", "calendar/calendar.jsp");
			
		}
		else {
			request.setAttribute("menuPage", "loginMenu.jsp");
			request.setAttribute("contentPage", "member/login.jsp");
		}
		return "indexMem";
	}
		
	@RequestMapping(value="/calendar.getdaily", 
				method=RequestMethod.GET, 
				produces="application/json; charset=utf-8")
	public @ResponseBody Hcalendars getAllcalendar(Hcalendar h, HttpServletRequest request) {
		System.out.println("��Ʈ�ѷ����� getdaily");
		return hDAO.hdailydata(h, request);
		
	}
	
	@RequestMapping(value="/calendar.setGoal", 
			method=RequestMethod.GET)
	public @ResponseBody int setGoal(Hcalendar h, HttpServletRequest request) {
		System.out.println("����Ǵ�??1");
		return hDAO.setGoalAmount(h, request);
		
	}

}
