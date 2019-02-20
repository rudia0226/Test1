package com.sm.household.bookData;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.household.Member.Member;


@Service
public class BookdataDAO {
	@Autowired
	private SqlSession ss;

	BookDataBean bd;
	CateBean ca; 
	PayBean p;
	public List<PayBean> getCateType(HttpServletRequest req, HttpServletResponse res, String param) {
		try {
			System.out.println("33123");
			p = new PayBean();
			String Ca_Group = param;
			BookDataMapper idm = ss.getMapper(BookDataMapper.class);
			
			Member member = (Member) req.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();
			System.out.println(User_Email);
			p.setUser_Email(User_Email);
			
			List<String> inoutList = new ArrayList();
			List<PayBean> payType = idm.getPayType(User_Email);
			
			
			return payType;
		} catch (Exception e) {
			System.out.println("Controller error");
		}
		return null;
	}

	public List<CateBean> getPayType(HttpServletRequest req, HttpServletResponse res, String param) {
		try {
			ca = new CateBean();
			
			String Ca_Group = param;
			
			BookDataMapper idm = ss.getMapper(BookDataMapper.class);
			ca.setCa_Group(Integer.parseInt(Ca_Group));	//ajax로 넘어온값 직접 setter로 주입해야 함
			Member member = (Member) req.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();
			ca.setUser_Email(User_Email);
			
			List<String> valueList = new ArrayList();
			List<CateBean> catevalue =idm.getCateValue(ca);
			return catevalue;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public void inserData(HttpServletRequest req, HttpServletResponse res, String param1, String param2, String param3,
			String param4, String param5, String param6) {
		try {
			bd = new BookDataBean();
			String User_Email = (String) req.getSession().getAttribute("User_Email");
			Date daydd = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			daydd = sdf.parse(param4);
			BookDataMapper idm = ss.getMapper(BookDataMapper.class);
			
			int pay_Id = Integer.parseInt(param2);
			int ca_key = Integer.parseInt(param3);
			int amount = Integer.parseInt(param5);
			String memo = param6;
			
			bd = new BookDataBean(amount, memo, ca_key, pay_Id);
			bd.setData_Date(sdf.parse(param4)); 
			bd.setUser_Email(User_Email);
			
			System.out.println("[입력끝]");
			ss.getMapper(BookDataMapper.class).insertData(bd);
			System.out.println("[isert끝]");
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public void updateData(HttpServletRequest req, HttpServletResponse res, String param1, String param2, String param3,
			String param4, String param5, String param6,String param7){
		try {
			bd = new BookDataBean(); 
			Member member = (Member) req.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();
			
			Date daydd = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			daydd = sdf.parse(param4);
			
			BookDataMapper idm = ss.getMapper(BookDataMapper.class);
			int pay_Id = Integer.parseInt(param2);
			int ca_key = Integer.parseInt(param3);
			int amount = Integer.parseInt(param5);
			String memo = param6;
			
			bd = new BookDataBean(amount, memo, ca_key, pay_Id);
			bd.setData_Date(sdf.parse(param4));
			bd.setUser_Email(User_Email);
			bd.setData_No(Integer.parseInt(param7));
			System.out.println("[입력끝]");
			ss.getMapper(BookDataMapper.class).updateData(bd);
			System.out.println("[insert+delete 끝]");
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteData(HttpServletRequest req, HttpServletResponse res,String param7){
		try {
			bd = new BookDataBean();
			/*Member member = (Member) req.getSession().getAttribute("loginMember");
			String User_Email = member.getUser_Email();*/
			/*Date daydd = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			daydd = sdf.parse(param4);*/
			
			BookDataMapper idm = ss.getMapper(BookDataMapper.class);
			/*int pay_Id = Integer.parseInt(param2);
			int ca_key = Integer.parseInt(param3);
			int amount = Integer.parseInt(param5);
			String memo = param6;*/
			
			/*bd = new BookDataBean(amount, memo, ca_key, pay_Id);*/
			/*bd.setData_Date(sdf.parse(param4));*/
		/*	bd.setUser_Email(User_Email);*/
			bd.setData_No(Integer.parseInt(param7));
			System.out.println("[입력끝]");
			ss.getMapper(BookDataMapper.class).deleteData(bd);
			System.out.println("[delete끝]");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String selectData_No(BookDataBean bd,HttpServletRequest req, HttpServletResponse res) {
		bd = new BookDataBean();
		String User_Email = (String) req.getSession().getAttribute("User_Email");
		bd.setUser_Email(User_Email);
		String id = ss.getMapper(BookDataMapper.class).getBookData(bd);
		System.out.println(id);
		return id;
	}
	
}
