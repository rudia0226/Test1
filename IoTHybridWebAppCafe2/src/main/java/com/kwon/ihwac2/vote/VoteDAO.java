package com.kwon.ihwac2.vote;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwon.ihwac2.member.Member;

@Service
public class VoteDAO {
	@Autowired
	private SqlSession ss;

	public void getVote(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("v", ss.getMapper(VoteMapper.class).getVote());
		req.setAttribute("vis", ss.getMapper(VoteMapper.class).getVoteItem());
	}

	public void regVote(Vote v, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String iv_owner = m.getIm_id();
			v.setIv_owner(iv_owner);

			if (ss.getMapper(VoteMapper.class).regVote(v) == 1) {
				ss.getMapper(VoteMapper.class).delVoteItem();
				ss.getMapper(VoteMapper.class).delVoteVote();

				String iv_items = req.getParameter("iv_items");
				String[] iv_items2 = iv_items.split("\r\n");

				for (int i = 0; i < iv_items2.length; i++) {
					VoteItem vi = new VoteItem();
					vi.setIvi_no(new BigDecimal(i));
					vi.setIvi_item(iv_items2[i]);
					ss.getMapper(VoteMapper.class).regVoteItem(vi);
				}
			} else {
				req.setAttribute("r", "투표 등록 실패");
			}

		} catch (Exception e) {
			req.setAttribute("r", "투표 등록 실패");
		}

	}

	public void vote(VoteVote vv, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			vv.setIvv_im_id(m.getIm_id());
			if (ss.getMapper(VoteMapper.class).vote(vv) == 1) {
				ss.getMapper(VoteMapper.class).updateVoteCount();
				ss.getMapper(VoteMapper.class).updateVoteItemCount(vv);
			} else {
				req.setAttribute("r", "투표 실패");
			}

		} catch (Exception e) {
			req.setAttribute("r", "투표 실패");
		}
	}
}
