package com.kwon.ihwac2.dataroom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kwon.ihwac2.community.CommunityDAO;
import com.kwon.ihwac2.member.Member;
import com.kwon.ihwac2.member.MemberDAO;

@Controller
public class DataroomController {
	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private DataroomDAO dDAO;
	@Autowired
	private MemberDAO mDAO;

	@RequestMapping(value = "/dataroom.delete", method = RequestMethod.GET)
	public String dataroomDelete(Data d, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			dDAO.delete(d, req, res);
		}
		dDAO.getAllData(req, res);
		req.getSession().setAttribute("contentPage", "dataroom/dataroom.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/dataroom.go", method = RequestMethod.GET)
	public String dataroomGo(Member m, HttpServletRequest req, HttpServletResponse res) {
		mDAO.loginCheck(req, res);
		dDAO.getAllData(req, res);
		req.getSession().setAttribute("contentPage", "dataroom/dataroom.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}

	@RequestMapping(value = "/dataroom.upload", method = RequestMethod.POST)
	public String dataroomUpload(Data d, HttpServletRequest req, HttpServletResponse res) {
		if (mDAO.loginCheck(req, res)) {
			dDAO.upload(d, req, res);
		}
		dDAO.getAllData(req, res);
		req.getSession().setAttribute("contentPage", "dataroom/dataroom.jsp");
		cDAO.getMsg(req, res);
		return "index";
	}
}
