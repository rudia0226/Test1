package com.sm.household.statistics;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sm.household.detailList.BookCa;

public interface ChartMapper {
	public abstract List<BookCa> getChartList(@Param("ca_group") int ca_group, 
			@Param("User_Email") String User_Email);
}
