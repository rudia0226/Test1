package com.rudia.s.sns;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rudia.s.member.Member;

@Service
public class SNSDAO {

	
	@Autowired
	private SqlSession  ss;
	
	// 글쓰기
	public  void  writeSNS(SNSMsg sm, HttpServletRequest req, HttpServletResponse res) {
		
		// 글쓴이는 따로 챙겨야.(세션에서 가져옴.)
		Member  m = (Member) req.getSession().getAttribute("loginMember");
		String  cs_owner = m.getM_id();
		sm.setCs_owner(cs_owner); // sm 객체에 글쓴이를 넣어준다.
		
		// 내용 체크
		String  cs_txt = sm.getCs_txt();   // 여기엔 \b로 들어가있는걸 
		cs_txt = cs_txt.replace("\n", "<br>");  // br 태그로 바꿈
		sm.setCs_txt(cs_txt); // sm객체에 내용을 넣어줌 (br태그로 바꿔서..)
		
		ss.getMapper(SNSMapper.class).writeSNS(sm);
	}
	
	// 뎃글 수정
	public  void  updateRepl(SNSRepl  sr, HttpServletRequest req, HttpServletResponse res) {
		ss.getMapper(SNSMapper.class).updateRepl(sr);
	}
	
	// 뎃글만 삭제
	public  void  delSNSRepl(SNSRepl  sm, HttpServletRequest req, HttpServletResponse res) {
		
		ss.getMapper(SNSMapper.class).delSNSRepl2(sm);
		
	}
	
	// 삭제
	public  void  delSNS(SNSMsg  sm, HttpServletRequest req, HttpServletResponse res) {
		ss.getMapper(SNSMapper.class).delSNSMsg(sm);
		ss.getMapper(SNSMapper.class).delSNSRepl(sm);
	}
	
	
	
	
	
/*	// 글 조회
	public  void  getSNSMsg(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute("msgs", ss.getMapper(SNSMapper.class).getSNSMsg());
	}
	*/
	
	
	// 댓글조회
	public  void  getSNSMsgRPL( HttpServletRequest req, HttpServletResponse res) {
		
		List<SNSMsg>  msgs = ss.getMapper(SNSMapper.class).getSNSMsg();
		for (SNSMsg  snsMsg : msgs) {
			snsMsg.setCsr(ss.getMapper(SNSMapper.class).getSNSMsgRPL(snsMsg));
		}
		
		req.setAttribute("msgs", msgs);
	}
	
	// 댓글쓰기
	public  void writeRepl(SNSRepl sl , HttpServletRequest req, HttpServletResponse res) {
		
		Member  m = (Member) req.getSession().getAttribute("loginMember");
		String  csr_owner = m.getM_id();
		sl.setCsr_owner(csr_owner);
		
		// 내용 체크
		String  csr_txt = sl.getCsr_txt();   
		csr_txt = csr_txt.replace("\n", "<br>");  
		sl.setCsr_txt(csr_txt); 
		 
		ss.getMapper(SNSMapper.class).writeRepl(sl);
	}
	
	
	
	
	
}
