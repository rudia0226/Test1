package com.rudia.s.sns;

import java.util.List;

public interface SNSMapper {
	public  abstract int writeSNS(SNSMsg sm);  // 글 작성
	public  abstract List<SNSMsg> getSNSMsg();  // 조인한 테이블 이용 
	public  abstract  int writeRepl(SNSRepl sl);  // 댓글작성
	public  abstract List<SNSRepl> getSNSMsgRPL(SNSMsg  sm);  // 댓글을 조회
	public  abstract int updateRepl(SNSRepl sr);  // 댓글을 수정
	public  abstract int delSNSMsg(SNSMsg sm); // 글 삭제
	public  abstract int delSNSRepl(SNSMsg sm); // 댓글 삭제
	public  abstract int delSNSRepl2(SNSRepl sm); // 댓글만 삭제
	
}
