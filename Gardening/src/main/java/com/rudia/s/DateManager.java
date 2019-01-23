package com.rudia.s;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 객체를 만드는 이유?
// 

public class DateManager { //날짜 관련된 것들을 처리해주는 클래스
	// 멤버변수 없음 => 저장할 정보가 없음 => 정보가 저장될 공간이 필요하지 않음
	// => 객체를 만들 필요 없음	: 클래스에 @Service 붙일 필요 없음
	// => 메소드에 static 붙여줘서 객체 안만들고도 호출 가능한 메소드로 만듬
	
	// deprecated  : 업데이트 때 수정할 계획이 섰으니, 쓰지 않기를 권장 
	//현재 버젼에서는 괜찮지만 다음버젼에서 적용 안될 수 있는것 (사용하면 안됨..)
	
	//현재 년도 가져오기 : join.jsp 에서 년도 꺼내올때 사용
	public static  void  getCurrentYear(HttpServletRequest req, HttpServletResponse  res) {
		
		Date  now = new Date();
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy");
		String  curYear = sdf.format(now);
		req.setAttribute("curYear", curYear);
	}
	
	
	// 파라메터명을 날짜명으로 해서 리턴을 Date로..
	public  static  Date  getDate(String y, String m, String d, HttpServletRequest req) throws ParseException {
		
		String  m_y = req.getParameter(y);    //"1989"
		String  m_m = req.getParameter(m);  // "1"
		int m_m2 = Integer.parseInt(m_m);// 1 : 글자상태로 있던 것을 숫자로 받음
		String  m_d = req.getParameter(d);  // "3" 
		int m_d2 = Integer.parseInt(m_d);//3 
		
		// 자리수 다 합침
		// 19890103
		String  m_birth = String.format("%s%02d%02d", m_y, m_m2, m_d2);
		
		// String -> Date
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyyMMdd");
		
		return  sdf.parse(m_birth);  
		//  sdf.parse(m_birth); 빨간 줄 생겨서 에러 뜨면 예외처리해준다.
		// 예외처리 : throws ParseException 를 사용해 받는 쪽에서 처리하도록..
	}
}
