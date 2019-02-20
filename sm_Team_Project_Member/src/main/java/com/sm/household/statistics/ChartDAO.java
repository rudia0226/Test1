package com.sm.household.statistics;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.household.Member.Member;
import com.sm.household.detailList.BookCa;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

@Service
public class ChartDAO {
	@Autowired
	SqlSession ss;
	
	// get data
	public List<BookCa> getChart(int ca_group, String User_Email) {
		return ss.getMapper(ChartMapper.class).getChartList(ca_group, User_Email);
	}
	
	//set chart
	public void goChart(int ca_group, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String User_Email= m.getUser_Email();

			req.setAttribute("chartData",getChart(ca_group, User_Email));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//ajax set chart
	public List<BookCa> goChart2(int ca_group, HttpServletRequest req, HttpServletResponse res) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String User_Email= m.getUser_Email();
		
		return getChart(ca_group, User_Email);
	}
	
}
