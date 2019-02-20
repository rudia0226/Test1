package com.sm.household.detailList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DetailListController {

	@Autowired
	private DetailListDAO dDAO;
	
	@RequestMapping(value = "/detailList", method = RequestMethod.GET)
	public String detailList(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
		
		
		if(request.getSession().getAttribute("loginMember") != null) {
			dDAO.detailList(request, response, nowPage);
			request.setAttribute("menuPage", "loginMenu.jsp");
			request.setAttribute("contentPage", "detailList/detailList.jsp");
			
		} else {
			request.setAttribute("menuPage", "menuBar.jsp");
			request.setAttribute("contentPage", "home.jsp");
			
		}
		return "indexMem";
	}
	

	
	//search
	@RequestMapping(value = "/detailList.search",method =RequestMethod.GET )
	public String ds(BookCa bc, HttpServletRequest request, HttpServletResponse response) {
		

		if(request.getSession().getAttribute("loginMember") != null) {
			dDAO.searchList(bc, request, response);
			dDAO.paging(1, request, response);
			request.setAttribute("menuPage", "loginMenu.jsp");
			request.setAttribute("contentPage", "detailList/searchdetailList.jsp");
			
		} else {
			request.setAttribute("menuPage", "menuBar.jsp");
			request.setAttribute("contentPage", "home.jsp");
			
		}
		return "indexMem";
	
	
	}

	
	//페이징 처리
	@RequestMapping(value = "/detaileList.page.change", method = RequestMethod.GET)
	public String pc(HttpServletRequest request, HttpServletResponse response) {
	
		if(request.getSession().getAttribute("loginMember") != null) {
			int p = Integer.parseInt(request.getParameter("p"));
			dDAO.paging(p, request, response);
			request.setAttribute("menuPage", "loginMenu.jsp");
			request.setAttribute("contentPage", "detailList/searchdetailList.jsp");
			
		} else {
			request.setAttribute("menuPage", "menuBar.jsp");
			request.setAttribute("contentPage", "home.jsp");
			
		}
		return "indexMem";
	
	}
	

	
	
	//페이지 검색후 총리스트 가져오기	
	@RequestMapping(value = "/getdetailList", method = RequestMethod.GET)
	public String listShow(Book_dataVO b, HttpServletRequest request, HttpServletResponse response) {
		
		if(request.getSession().getAttribute("loginMember") != null) {
			dDAO.getDetailList(request, response);
			dDAO.paging(1, request, response);
			request.setAttribute("menuPage", "loginMenu.jsp");
			request.setAttribute("contentPage", "detailList/searchdetailList.jsp");
			
		} else {
			request.setAttribute("menuPage", "menuBar.jsp");
			request.setAttribute("contentPage", "home.jsp");
			
		}
		return "indexMem";
		
	
	}
	
	//페이지 지우기
	@RequestMapping(value = "/sns.delete", method = RequestMethod.GET)
	public String delDetail(BookCa bc, HttpServletRequest request, HttpServletResponse response, 	
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage) {
	
		
		
		if(request.getSession().getAttribute("loginMember") != null) {
			dDAO.delDetail(bc, request, response);
			
			dDAO.detailList(request, response, nowPage);

			request.setAttribute("menuPage", "loginMenu.jsp");
			request.setAttribute("contentPage", "detailList/detailList.jsp");
			
		} else {
			request.setAttribute("menuPage", "menuBar.jsp");
			request.setAttribute("contentPage", "home.jsp");
			
		}
		return "indexMem";
	}


}
