package com.rudia.s.member;

public interface MemberMapper {
	
	public  abstract  int join(Member m);  // 회원가입 insert
	public  abstract   Member  getMemberById(Member m); // 로그인 login
}
