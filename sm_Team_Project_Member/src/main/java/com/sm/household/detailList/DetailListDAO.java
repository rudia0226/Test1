package com.sm.household.detailList;

import java.lang.ProcessBuilder.Redirect;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;
import org.omg.CORBA.DATA_CONVERSION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sm.household.Member.Member;
import com.sm.household.detailList.DateManager;;

@Service
public class DetailListDAO {

	@Autowired
	private SqlSession ss;

	private List<BookCa> BookCas;

	
	
	
	public void detailList(HttpServletRequest request, HttpServletResponse response, int nowPage) {
		
		Member member = (Member) request.getSession().getAttribute("loginMember");
		String User_Email = member.getUser_Email();

		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
		String curYear = sdf.format(now);
		System.out.println(now);

		request.setAttribute("curYear", curYear);
		System.out.println(curYear);

		int detailCount = ss.getMapper(DetailListMapper.class).getDetailCount(User_Email);
		int perPage = 10;
		
		int startPage = 1;
		int endPage = (detailCount - 1) / perPage + 1;

		int startNum = (nowPage - 1) * 10 + 1;
		int endNum = startNum + 9;
		if (endNum > detailCount)
			endNum = detailCount;
		BookCas = ss.getMapper(DetailListMapper.class).detailList(User_Email, startNum, endNum);
		// request.getSession().setAttribute("search", null);//전체목록을 봤을 때 검색 결과가 null로
		// 보이도록

		System.out.println(User_Email);
		System.out.println(startPage);
		System.out.println(endPage);
			
		request.setAttribute("BookCas", BookCas);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("nowPage", nowPage);

	}

	public void searchList(BookCa bc, HttpServletRequest request, HttpServletResponse response) {
		
		try {
			bc.setData_Date(DateManager.getDate("m_y", "m_m", "m_d", request));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("test2");
		System.out.println(bc.getData_Date());

		Member member = (Member) request.getSession().getAttribute("loginMember");
		String User_Email = member.getUser_Email();
		
		bc.setUser_Email(User_Email);
		System.out.println(User_Email);
		
		List<BookCa> bb = ss.getMapper(DetailListMapper.class).searchList(bc);
		System.out.println(bb.size());
		request.getSession().setAttribute("search", bb);

	}

	public void paging(int page, HttpServletRequest request, HttpServletResponse response) {
	
		
		List<BookCa> bc = (List<BookCa>) request.getSession().getAttribute("search");
		List<BookCa> data = null;
		
		Member member = (Member) request.getSession().getAttribute("loginMember");
		String User_Email = member.getUser_Email();
		
		if (bc == null || bc.size() == 0) {
			data = ss.getMapper(DetailListMapper.class).getsearchList(User_Email);

			if (BookCas == null || BookCas.size() == 0) {
				return;
			}
		} else {
			data = bc;
		}

	
		
		// System.out.println(bc.size()); 얘 문제
		int count = 10;// 한페이지당 보여줄 게시물 갯수(한페이지 당 10개)

		// 현재페이지 추출 계산
		int pageCount = (int) (Math.ceil(data.size() / (double) count));
		request.setAttribute("pageCount", pageCount);

		// 현재페이지 번호에 맞는 게시물들 추출
		int start = data.size() - ((page - 1) * count);
		int end = (page == pageCount) ? 1 : start - (count - 1);
		
		ArrayList<BookCa> BookCas2 = new ArrayList<BookCa>();


		System.out.println(start);
		System.out.println(end);
		

		for (int i = start - 1; i >= end - 1; i--) {
			BookCas2.add(data.get(i));
		}

		request.setAttribute("BookCas", BookCas2);
		;
	}

	// 검색 목록 가져오기
	public void getDetailList(HttpServletRequest request, HttpServletResponse response) {
				
		request.getSession().setAttribute("search", null);// 전체목록을 봤을 때 검색 결과가 null로 보이도록

	}
	
	//삭제하기
	public void delDetail(BookCa bc, HttpServletRequest req, HttpServletResponse res ) {
		
		Member member = (Member) req.getSession().getAttribute("loginMember");
		String User_Email = member.getUser_Email();
		
		bc.setUser_Email(User_Email);
	
		System.out.println("test5");
		System.out.println(User_Email);

		
		ss.getMapper(DetailListMapper.class).delDetailList(bc);
	}
	
	

}
