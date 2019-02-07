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
	
	// Select Checked All
	@Override
	public List<ChartVO> searchChart(Map<String,Object> map)  {
		System.out.println("DAO part");
		return sqlSessionTemplate.selectList("searchChart", map);
	}
	
	//SelectBox For AREA_CD
	@Override
	public List<selectBoxVO> getSelectBoxValue() {
		System.out.println("DAO part - selectBox");
		return sqlSessionTemplate.selectList("getSelectBoxValue");
	}

	// changing chart color 
	@Override
	public void colorChange(Map<String, String> map) {
		
		String cmt = "";
		String cdId = "";
		cmt = map.get("cmt");
		cdId = map.get("cdId");
		
		for( Map.Entry<String, String> elem : map.entrySet() ){
            System.out.println( String.format("키 : %s, 값 : %s", elem.getKey(), elem.getValue()) );
		}
        
            // parameter를 String으로 2개 넣어주기 (cmt, cdId) 
            // 
		
}
	
	
}
