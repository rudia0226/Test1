package com.sm.household.ca;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CaController {

	@Autowired
	private CaDAO bDAO;
	
/*	@RequestMapping(value = "/calistview.go", method = RequestMethod.POST)
	public String caListView(CaBean c, HttpServletRequest req, @Param(value ="BookNo") int BookNo) {
		bDAO.getListOut(req, BookNo);
		req.setAttribute("contentPage", "member/login.jsp");
		return "book/calistview";
	}*/
	
/*	@RequestMapping(value = "/caList.go", method = RequestMethod.GET)
	public String caListView(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("contentPage", "book/write.jsp");		
		return "indexMem";
	}*/
	
	/*@RequestMapping(value = "/searchCa.go", method = RequestMethod.GET)
	public void searchCaByGroup(CaBean c, HttpServletRequest req, HttpServletResponse res) {
		System.out.println(c.getCa_Group());
		bDAO.getListAllOut(c, req);
	}*/
	
	@RequestMapping(value = "/caedit.go", method = RequestMethod.GET)
	public String caEdit(CaBean c, HttpServletRequest req, HttpServletResponse res) {
		if (req.getSession().getAttribute("loginMember") != null) {
			System.out.println(c.getCa_Group());
			bDAO.getListByGroup(c, req);
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "category/caEdit.jsp");
		} else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "home.jsp");
		} 
		return "indexMem";
	} 
	
	@RequestMapping(value = "/modify.calist.do", method = RequestMethod.GET)
	public @ResponseBody int modifiedCa(CaBean c, int K, int T, String V, HttpServletRequest req, HttpServletResponse respond) {
		req.setAttribute("caKey", K);
		req.setAttribute("caType", T);
		req.setAttribute("caValue", V);
		System.out.println(K);
		System.out.println(V);
		System.out.println(T);
		int result =  bDAO.modiCaListOne(K, T, V, req);
		return result;
	}
	
	@RequestMapping(value = "/newCa.reg", method = RequestMethod.GET)
	public @ResponseBody int createCa(CaBean c, int GG, int TT, String VV, HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("caGroup", GG);
		req.setAttribute("caType", TT);
		req.setAttribute("caValue", VV);
		int rstInsert =  bDAO.newCaCreate(req, GG, TT, VV);
		bDAO.getListByGroup(c, req);
		return rstInsert;
	}
	
	/****************************************************************************************/
	@RequestMapping(value = "/delete.calist.do", method = RequestMethod.GET)
	public String deleteCa(CaBean c,HttpServletRequest req, HttpServletResponse respond) {
		bDAO.deleteCa(c, req);
		
		if (req.getSession().getAttribute("loginMember") != null) {
			System.out.println(c.getCa_Group());
			bDAO.getListByGroup(c, req);
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "category/caEdit.jsp");
		} else {
			req.setAttribute("menuPage", "loginMenu.jsp");
			req.setAttribute("contentPage", "home.jsp");
		} 
		return "indexMem";
	}
	
	/****************************************************************************************/
}
