package com.sm.household.calendar;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class Datemanager {
	
	
	// 오늘 날짜 구함 - full calendar에서 set day
	public static String current_date(HttpServletRequest request) {
		
		System.out.println("current_date 실행");
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String current_date = dateFormat.format(date);
		request.setAttribute("current_date", current_date);
		System.out.println(current_date);
		
		return current_date;
	}
	
	
	public static boolean dividedate(String goalDay, HttpServletRequest request) {
		
		try {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdf.parse(goalDay);
			
			SimpleDateFormat sdfY = new SimpleDateFormat("yyyy");
			SimpleDateFormat sdfM = new SimpleDateFormat("MM");
			
			int year = Integer.parseInt(sdfY.format(date));
			int month = Integer.parseInt(sdfM.format(date));
			System.out.println(year+"년도를 구함");
			System.out.println(month+"달을 구함");
			
			
			//현재날짜 구해오기
			String curDate = current_date(request);
			
			Date cdate = sdf.parse(curDate);
			
			int curYear = Integer.parseInt(sdfY.format(cdate));
			int curMonth = Integer.parseInt(sdfM.format(cdate));
			
			System.out.println(curYear+"현재 년도를 구함");
			System.out.println(curMonth+"현재 달을 구함");
			
			if (year == curYear) {
				
				if (month == curMonth) {

					return true;
				}
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return false;
	}
	

}
