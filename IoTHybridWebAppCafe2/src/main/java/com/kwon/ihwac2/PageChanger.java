package com.kwon.ihwac2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwon.ihwac2.community.CommunityDAO;
import com.kwon.ihwac2.dataroom.DataroomDAO;
import com.kwon.ihwac2.sns.SNSDAO;
import com.kwon.ihwac2.vote.VoteDAO;

@Service
public class PageChanger {
	@Autowired
	private CommunityDAO cDAO;
	@Autowired
	private DataroomDAO dDAO;
	@Autowired
	private SNSDAO sDAO;
	@Autowired
	private VoteDAO vDAO;

	public void remainCurrentPage(HttpServletRequest req, HttpServletResponse res) {
		String curPage = (String) req.getSession().getAttribute("contentPage");
		if (curPage == null || curPage.equals("home.jsp")) {
			req.getSession().setAttribute("contentPage", "home.jsp");
			sDAO.getAllSNSMsg(req, res);
		} else if (curPage.equals("community/community.jsp")) {
			cDAO.getAllMember(req, res);
		} else if (curPage.equals("vote/vote.jsp")) {
			vDAO.getVote(req, res);
		} else if (curPage.equals("dataroom/dataroom.jsp")) {
			dDAO.getAllData(req, res);
		}
	}
}
