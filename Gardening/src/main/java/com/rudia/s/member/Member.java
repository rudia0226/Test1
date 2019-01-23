package com.rudia.s.member;

import java.util.Date;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


// 숫자라고 무조건 Number 아니고
// 날짜라고 무조건 Date 쓸게 아니고..
// 실제로 프로젝트 할 때에는 자료형을 따질 게 아니라 용도를 따져야..
// 날짜로서의 의미가 있는지에 따라 구분
// 생년월일 받아서 연도별 정렬, 나이계산, ..  => Date 로 작성
// 생년월일 받아서 조회 => char 로 작성

// 나이를 받아서 +-*/ => Number 로 작성
// 나이를 받아서 조회 => char 로 작성

// 주민번호 는 number 로 하지말고 char 쓰는게 맞다.
// 핸드폰 1, 2, 3... 이거 의미없다.. char 로 작성해..

@XmlRootElement
public class Member { // javaBean
	private String m_id;
	private String m_pw;
	private String m_name;
	private Date m_birth;

	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String m_id, String m_pw, String m_name, Date m_birth) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birth = m_birth;
	}

	public String getM_id() {
		return m_id;
	}
	
	@XmlElement
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	@XmlElement
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	@XmlElement
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public Date getM_birth() {
		return m_birth;
	}

	@XmlElement
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

}
