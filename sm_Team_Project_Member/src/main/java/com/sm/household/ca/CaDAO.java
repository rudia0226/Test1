package com.sm.household.ca;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.household.Member.Member;

@Service   
public class CaDAO {

	@Autowired   
	private SqlSession ss;
	
	// 수입, 지출내역 가져오기
	public void getListAllOut(CaBean c, HttpServletRequest req) {		
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String userID = m.getUser_Email();
		c.setUser_Email(userID);
		System.out.println(userID);
		
		req.setAttribute("getCaList", ss.getMapper(CaMapper.class).getAllList(c));
	}
	
	public void getListByGroup(CaBean c, HttpServletRequest req) {		
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String userID = m.getUser_Email();
		c.setUser_Email(userID);
		System.out.println(userID);
		System.out.println("Ca_Group:" + c.getCa_Group());
		
		int cagroupNo = 0;
		cagroupNo = c.getCa_Group();
		
		if(cagroupNo == 0) {
			req.setAttribute("getCaList", ss.getMapper(CaMapper.class).getAllList(c));
			System.out.println("All 쿼리를 수행했습니다. ");
		} else {
			req.setAttribute("getCaList", ss.getMapper(CaMapper.class).getListByGroup(c));
			System.out.println("byGroup 쿼리를 실행했습니다. ");
		} 
	}
	
	// 카테고리 수정 
	public int modiCaListOne(int K, int T, String V, HttpServletRequest req){
		CaBean ca = new CaBean();
		ca.setCa_Key(K);
		ca.setCa_Type(T);
		ca.setCa_Value(V); 
		int result =  ss.getMapper(CaMapper.class).modifyCaByKey(ca);
		return result;
	}
	
	// 카테고리 신규생성
	public int newCaCreate(HttpServletRequest req, int GG, int TT, String VV){
		CaBean ca = new CaBean();
		Member m = (Member) req.getSession().getAttribute("loginMember");
		String userID = m.getUser_Email();
		ca.setUser_Email(userID);		
		
		System.out.println(VV);
		System.out.println(TT);
		System.out.println(GG);
		
		ca.setCa_Type(TT);
		ca.setCa_Value(VV);
		ca.setCa_Group(GG);
				
		return ss.getMapper(CaMapper.class).newCaCreate(ca);
	}	
	
	/*************************************************/
	public void deleteCa(CaBean c, HttpServletRequest req) {
	/*	c = new CaBean();*/
		
		System.out.println((String) req.getSession().getAttribute("User_Email"));
		c.setUser_Email((String) req.getSession().getAttribute("User_Email"));
		System.out.println("==================");
	
		ss.getMapper(CaMapper.class).delCate(c);
		ss.getMapper(CaMapper.class).updateNull(c);
		
		}
	
}
