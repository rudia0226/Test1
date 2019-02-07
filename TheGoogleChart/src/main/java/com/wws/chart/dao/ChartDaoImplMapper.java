package com.wws.chart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wws.chart.vo.ChartVO;
import com.wws.chart.vo.ColorVO;
import com.wws.chart.vo.selectBoxVO;

@Repository
public class ChartDaoImplMapper implements ChartDao{

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;  
	}
	
	// Select Checked All
	@Override
	public List<ChartVO> searchChart(Map<String,Object> map)  {
		System.out.println("DAO part");
		return sqlSessionTemplate.selectList("searchChart", map);
	}
	
	// Select Checked All
	@Override
	public List<ChartVO> chartWithFunction(Map<String,Object> map)  {
		System.out.println("DAO part - chartWithFunction");
		return sqlSessionTemplate.selectList("chartWithFunction", map);
	}
	
	//SelectBox For AREA_CD
	@Override
	public List<selectBoxVO> getSelectBoxValue() {
		System.out.println("DAO part - selectBox");
		return sqlSessionTemplate.selectList("getSelectBoxValue");
	}

	// changing chart color 
	@Override
	public void colorChange(String cmt, String cdId) {
        // parameter를 String으로 2개 넣어주기 (cmt, cdId) 
        Map<String, String> map = new HashMap<>();
        map.put("cmt", cmt);
        map.put("cdId", cdId);
        sqlSessionTemplate.update("colorUpdate", map);
	}

	@Override
	public List<ColorVO> colorList() {
		System.out.println("SelectList ColorChart----");
		return sqlSessionTemplate.selectList("colorSelectList");
	}
	
}
