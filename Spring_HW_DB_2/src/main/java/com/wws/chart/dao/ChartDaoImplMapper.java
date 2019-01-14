package com.wws.chart.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.selectBoxVO;


@Repository
public class ChartDaoImplMapper implements ChartDao{

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
/*	
	@Override
	public List<ChartVO> list() {
		return sqlSessionTemplate.selectList("list");
	}
*/
	@Override
	public List<ChartVO> searchChart(Map<String,Object> map)  {
		System.out.println("DAO part");
		/*
		if (map.values() == null || map.values().isEmpty()) {
			map.values().add(" ");
		}else map.values();
		*/
		return sqlSessionTemplate.selectList("searchChart", map);
	//return sqlSessionTemplate.getMapper(ChartMapper.class).searchChart(map);
	}
	
	@Override
	public List<selectBoxVO> getSelectBoxValue() {
		System.out.println("DAO part - selectBox");
		return sqlSessionTemplate.selectList("getSelectBoxValue");
	}

}
