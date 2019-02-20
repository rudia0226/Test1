package com.kwon.ihwac2.sns;

import java.math.BigDecimal;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwon.ihwac2.member.Member;

@Service
public class SNSDAO {
	@Autowired
	private SqlSession ss;

	public void deleteSNSMsg(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		try {
			if (ss.getMapper(SNSMapper.class).deleteSNSMsg(sm) == 1) {
				ss.getMapper(SNSMapper.class).deleteSNSRepl2(sm);
				req.setAttribute("r", "글 삭제 성공");
			} else {
				req.setAttribute("r", "글 삭제 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "글 삭제 실패");
		}
	}

	public void deleteSNSRepl(SNSRepl sr, HttpServletRequest req, HttpServletResponse res) {
		try {
			if (ss.getMapper(SNSMapper.class).deleteSNSRepl(sr) == 1) {
				req.setAttribute("r", "리플 삭제 성공");
			} else {
				req.setAttribute("r", "리플 삭제 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "리플 삭제 실패");
		}
	}

	public void getAllSNSMsg(HttpServletRequest req, HttpServletResponse res) {
		List<SNSMsg> snsMsgs = ss.getMapper(SNSMapper.class).getAllSNSMsg();
		for (SNSMsg snsMsg : snsMsgs) {
			snsMsg.setIs_repls(ss.getMapper(SNSMapper.class).getSNSRepl(snsMsg));
		}
		req.setAttribute("snsMsgs", snsMsgs);
	}

	public void updateSNSMsg(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		try {
			String is_txt = sm.getIs_txt();
			is_txt = is_txt.replace(" ", "&nbsp;");
			sm.setIs_txt(is_txt);

			if (ss.getMapper(SNSMapper.class).updateSNSMsg(sm) == 1) {
				req.setAttribute("r", "글 수정 성공");
			} else {
				req.setAttribute("r", "글 수정 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "글 수정 실패");
		}
	}

	public void writeSNSMsg(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String is_txt = sm.getIs_txt();
			is_txt = is_txt.replace("\n", "<br>");
			is_txt = is_txt.replace(" ", "&nbsp;");
			sm.setIs_owner(m.getIm_id());
			sm.setIs_txt(is_txt);
			sm.setIs_color(new BigDecimal(new Random().nextInt(10)));

			if (ss.getMapper(SNSMapper.class).writeSNSMsg(sm) == 1) {
				req.setAttribute("r", "글쓰기 성공");
			} else {
				req.setAttribute("r", "글쓰기 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "글쓰기 실패");
		}
	}

	public void writeSNSRepl(SNSRepl sr, HttpServletRequest req, HttpServletResponse res) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String isr_txt = sr.getIsr_txt();
			sr.setIsr_owner(m.getIm_id());
			sr.setIsr_txt(isr_txt);

			if (ss.getMapper(SNSMapper.class).writeSNSRepl(sr) == 1) {
				req.setAttribute("r", "리플 등록 성공");
			} else {
				req.setAttribute("r", "리플 등록 실패");
			}
		} catch (Exception e) {
			req.setAttribute("r", "리플 등록 실패");
		}
	}
}
