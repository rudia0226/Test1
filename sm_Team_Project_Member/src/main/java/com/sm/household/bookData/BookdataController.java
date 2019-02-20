package com.sm.household.bookData;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sm.household.Member.Member;


@Controller   
public class BookdataController {
	@Autowired
	private BookdataDAO bdDAO;
	BookDataBean bd;
	//달력에서 입력버튼을 눌렀을때 발생
	@RequestMapping(value = "/bookData", method = RequestMethod.GET)
	public String boardList(BookDataBean bd,HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("menuPage", "loginMenu.jsp");
		request.setAttribute("contentPage", "bookdata/insertBookData.jsp");
		/*bdDAO.selectData_No(bd,request, response); */
		return "indexMem";
	}
	//AJAX 부분 : selectbox Ca_Group을 눌렀을때 발생
	@RequestMapping(value = "/getPayinfo.do", method = RequestMethod.POST,produces="application/json; charset=utf-8")
	public @ResponseBody List<PayBean> selectPay(HttpServletRequest req, HttpServletResponse res, String param) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		return bdDAO.getCateType(req, res, param);
		
	}
	//AJAX 부분 : selectbox Pay_Value를 눌렀을때 발생 
	@RequestMapping(value = "/getCatevalue.do", method = RequestMethod.POST ,produces="application/json; charset=utf-8")
	public @ResponseBody List<CateBean> selectCate(HttpServletRequest req, HttpServletResponse res,String param2) throws UnsupportedEncodingException {
		String pp = (String) req.getParameter("param2");
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		return bdDAO.getPayType(req, res,pp);
	}
	
	/*입력버튼을 눌렀을때 실행되는 주소*/
	@RequestMapping(value = "/insertData.do", method = RequestMethod.POST,  produces="application/json; charset=utf-8")
	public @ResponseBody String insertDataDo(BookDataBean bd,HttpServletRequest req, HttpServletResponse res,String param1
			,String param2,String param3,String param4,String param5,String param6) {

		bdDAO.inserData(req,res,param1,param2,param3,param4,param5,param6);
		return bdDAO.selectData_No(bd,req, res);
	}
	
	/*수정버튼을 눌렀을때 실행되는 주소*/
	@RequestMapping(value = "/updateData.do", method = RequestMethod.POST,  produces="application/json; charset=utf-8")
	public @ResponseBody String updateData(HttpServletRequest req, HttpServletResponse res,String param1
			,String param2,String param3,String param4,String param5,String param6,String param7) {
		
		bdDAO.updateData(req,res,param1,param2,param3,param4,param5,param6,param7);
		return bdDAO.selectData_No(bd,req, res);
		
	}
	
	/*삭제버튼을 눌렀을때 실행되는 주소*/
	@RequestMapping(value = "/deleteData.do", method = RequestMethod.POST,  produces="application/json; charset=utf-8")
	public @ResponseBody void deleteData(HttpServletRequest req, HttpServletResponse res,String param7) {
		
		bdDAO.deleteData(req, res,param7);
		
	}
}
