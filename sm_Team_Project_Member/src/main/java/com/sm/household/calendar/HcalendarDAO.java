package com.sm.household.calendar;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HcalendarDAO {

	@Autowired
	private SqlSession ss;

	public HsumAmounts getAllcalendar(Hcalendar h) {
		return new HsumAmounts(ss.getMapper(HcalendarMapper.class).seldailySum(h));

	}
	
	public void get_date(Hcalendar h, HttpServletRequest request) {

		HcalendarMapper hcm= ss.getMapper(HcalendarMapper.class);
		
		
		//세션의 User_Email값을 가져와서 붙여주기
		String User_Email = (String) request.getSession().getAttribute("User_Email");
		h.setUser_Email(User_Email);
		
		Date gjd = hcm.getJoinDate(h);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String ggg = sdf.format(gjd);
		//가입날짜 가져오기
		
		LocalDate J_Date =LocalDate.parse(ggg); 
		
		// 날짜와 변동비의 합계비용의 리스트
		List<HsumAmount> hcate = hcm.seldailySum(h); 
		
		// 월별 목표 금액 가져오기
		int MonthGoal = ss.getMapper(HcalendarMapper.class).getGoalAmount(h);
		request.setAttribute("MonthGoal", MonthGoal);
		
		//날짜DB json리스트로 만들기 
		JSONArray arr = new JSONArray();
		JSONObject jsonObj;
		
		// 월별 목표 달성 리스트 만들기
		int currentMSum =0;
		int remaining = 0;
		String goalDay;
		
		String curDate= Datemanager.current_date(request);
		
		LocalDate cdate = LocalDate.parse(curDate);
		
		// json 객체를 만들어주기
		
		final List<LocalDate> li =  new ArrayList<LocalDate>();
		
		for (LocalDate date = J_Date; date.isBefore(cdate); date = date.plusDays(1)) {
			
			li.add(date);
		}
		
		List<LocalDate> li2 =  new ArrayList<LocalDate>();
		
		String dbd;
		String dbd2;
		LocalDate dbdate;
		
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
		 
		for (int i = 0; i < hcate.size(); i++) {
			
			dbd = hcate.get(i).getBdate();
			dbd2 = dbd.substring(0, 10);
			dbdate = LocalDate.parse(dbd2, formatter); 
			li2.add(dbdate);
		}
		
		li.removeAll(li2);
		
			
		
		for (int i = 0; i < hcate.size(); i++) {
			
			//일별 목표 금액
			int dailyGoal = MonthGoal / 30;
			
			// 날짜별 합계값
			int sum = hcate.get(i).getAmount(); // 날짜별 sum(*)값을 가져와야함
			
			// 일별 목표 금액 
			dailyGoal -= sum;
			
			// 목표 금액에 달성했으면 
			if (dailyGoal > 0) {
				jsonObj = new JSONObject();
				jsonObj.put("start", hcate.get(i).getBdate());
				jsonObj.put("title", "Victory");
				jsonObj.put("goal", dailyGoal);
				
				arr.add(jsonObj);
			}
			
			goalDay = hcate.get(i).getBdate();
			
			// 여기에서 현재 년도와 달인지 판별해주고 true라면
			if (Datemanager.dividedate(goalDay,request) ==true) {
				
				// 현재달 날짜별 사용 합계값을 더해줌
				currentMSum +=sum;
			}
			
			// 목표금액에서 이번달 사용금액을 빼준다. 
			remaining =  MonthGoal - currentMSum;  
			
		}
		
				
		for (LocalDate ld : li) {
			String ndate = ld.format(formatter);
			
			jsonObj = new JSONObject();
			jsonObj.put("start", ndate);
			jsonObj.put("title", "Victory");
			jsonObj.put("goal", MonthGoal/30);
			
			arr.add(jsonObj);
			
		}
		
		
		request.setAttribute("events", arr);
		request.setAttribute("remaining", remaining);
		
	}
	
	public Hcalendars hdailydata(Hcalendar h, HttpServletRequest request){
			
			//구하는 날짜 가지고 오기
			h.setData_Date(request.getParameter("wantedday"));
			
			//세션에서 가지고 오기 - 확인필요
			String User_Email = (String) request.getSession().getAttribute("User_Email");
			h.setUser_Email(User_Email);

			return new Hcalendars(ss.getMapper(HcalendarMapper.class).getDataByDate(h));
	}
	
	public int setGoalAmount(Hcalendar h, HttpServletRequest request) {

		//세션에서 User_Email가져와 넣기
		h.setUser_Email((String) request.getSession().getAttribute("User_Email"));	
		
		// 목표금액 set
		ss.getMapper(HcalendarMapper.class).setGoalAmount(h);
		
		//사실 필요가 없음
		request.setAttribute("goal_amount", h.getGoal_amount());
		
		return h.getGoal_amount();
		
	}

}
