package com.sm.household.detailList;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class DateManager {

	
	public static Date getDate(String y, String m, String d, HttpServletRequest req) throws java.text.ParseException {
		String m_y = req.getParameter(y);
		
		String m_m = req.getParameter(m); 		
		int m_m2 = Integer.parseInt(m_m); 

/**		String m_d = req.getParameter(d); 		
		int m_d2 = Integer.parseInt(m_d);**/
		
		int m_d2 = 1;

		String Data_Date = String.format("%s%02d%02d", m_y, m_m2, m_d2);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		return sdf.parse(Data_Date);
		
}

}







