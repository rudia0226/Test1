package com.kwon.ihwac2.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwon.ihwac2.member.Member;

@Service
public class CommunityDAO {
	@Autowired
	private SqlSession ss;

	public void delMsg(Msg m, HttpServletRequest req, HttpServletResponse res) {
		try {
			if (ss.getMapper(CommunityMapper.class).delMsg(m) == 1) {
				req.setAttribute("r", "쪽지 삭제 성공");
			} else {
				req.setAttribute("r", "쪽지 삭제 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "쪽지 삭제 실패");
		}
	}

	public void getAllMember(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("members", ss.getMapper(CommunityMapper.class).getAllMember());
	}

	public void getMsg(HttpServletRequest req, HttpServletResponse res) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			Msg msg = new Msg();
			msg.setIm_to(m.getIm_id());
			req.setAttribute("msgs", ss.getMapper(CommunityMapper.class).getMsg(msg));
		}
	}

	public void sendMsg(Msg m, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member member = (Member) req.getSession().getAttribute("loginMember");
			m.setIm_from(member.getIm_id());

			if (ss.getMapper(CommunityMapper.class).sendMsg(m) == 1) {
				req.setAttribute("r", "쪽지 전송 성공");
			} else {
				req.setAttribute("r", "쪽지 전송 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "쪽지 전송 실패");
		}
	}

}
