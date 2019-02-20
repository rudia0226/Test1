package com.sm.household.detailList;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DetailListMapper {

	//리스트 불러오기
	public abstract List<BookCa> detailList(@Param("User_Email")String User_Email,  
			@Param("startNum") int startNum, @Param("endNum")int endNum);
	
	//리스트 총 카운팅 하기
	public int getDetailCount(String User_Email);

	//검색용
	public abstract List<BookCa> searchList(BookCa bc);
	public abstract List<BookCa> getList(String User_Email);
	
	//검색 시 날짜으로 죄회되는 값이 없을 때 리스트 출력
	List<BookCa> getsearchList(String User_Email);
	
	public abstract int delDetailList(BookCa bc);
	
}
