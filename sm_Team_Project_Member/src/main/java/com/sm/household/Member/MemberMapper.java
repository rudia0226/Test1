package com.sm.household.Member;

import java.util.List;

public interface MemberMapper {
	public  abstract   int  join(Member m); // 회원가입에 사용
	public  abstract  Member  getMemberById(Member  m); // 로그인에 사용
	public abstract int idcheck (String User_Email);//아이디 중복체크
	public  abstract  int update(Member m);  // 회원 정보수정
	public  abstract  List<Member>  getMemberById2();
	public abstract int InsertDefault(Member m); // 회원가입시 
	public abstract int DefaultPay(Member m); // 회원가입시 
}
