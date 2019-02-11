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
		this.sqlSessionTemplate = sqlSessionTemplate;  // ㄴ sqlSession  injection
	}
	
	// Select Checked All
	@Override
	public List<ChartVO> searchChart(Map<String,Object> map)  {
//		return sqlSessionTemplate.selectList("searchChart", map);   // Using namespace+id (String) <mapper namespace="com.wws.chart.dao.ChartDao">
		return sqlSessionTemplate.getMapper(ChartMapper.class).searchChart(map);  // Using Mapper Interface <mapper namespace="com.wws.chart.dao.ChartMapper">
	}
	
	// Select Checked All
	@Override
	public List<ChartVO> chartWithFunction(Map<String,Object> map)  {
//		return sqlSessionTemplate.selectList("chartWithFunction", map);
		return sqlSessionTemplate.getMapper(ChartMapper.class).chartWithFunction(map);
	}
	
	//SelectBox For AREA_CD
	@Override
	public List<selectBoxVO> getSelectBoxValue() {
//		return sqlSessionTemplate.selectList("getSelectBoxValue");
		return sqlSessionTemplate.getMapper(ChartMapper.class).getSelectBoxValue();
	}

	// changing chart color 
	@Override
	public void colorChange(String cmt, String cdId) {
        // parameter를 String으로 2개 넣어주기 (cmt, cdId) 
        Map<String, String> map = new HashMap<>();
        map.put("cmt", cmt);
        map.put("cdId", cdId);
//        sqlSessionTemplate.update("colorUpdate", map);
        sqlSessionTemplate.getMapper(ChartMapper.class).colorUpdate(map);
	}

	@Override
	public List<ColorVO> colorList() {
//		return sqlSessionTemplate.selectList("colorSelectList");
		return sqlSessionTemplate.getMapper(ChartMapper.class).colorSelectList();
	}
}
