package com.wws.chart.vo;

import java.math.BigDecimal;

public class ChartVO {

private String  areaCd;
private String nm;
private String regionArea;
private String col0;
private String col1;
private String col2;
private String col3;
private String col4;
private String col5;
private String col6;
private String col7;
private String col8;
private String col9;
private BigDecimal tot;


public ChartVO() {   }


public ChartVO(String areaCd, String nm, String regionArea, String col0, String col1, String col2, String col3,
		String col4, String col5, String col6, String col7, String col8, String col9, BigDecimal tot) {
	super();
	this.areaCd = areaCd;
	this.nm = nm;
	this.regionArea = regionArea;
	this.col0 = col0;
	this.col1 = col1;
	this.col2 = col2;
	this.col3 = col3;
	this.col4 = col4;
	this.col5 = col5;
	this.col6 = col6;
	this.col7 = col7;
	this.col8 = col8;
	this.col9 = col9;
	this.tot = tot;
}



public String getAreaCd() {
	return areaCd;
}
public void setAreaCd(String areaCd) {
	this.areaCd = areaCd;
}

public String getRegionArea() {
	return regionArea;
}

public void setRegionArea(String regionArea) {
	this.regionArea = regionArea;
}

public String getNm() {
	return nm;
}
public void setNm(String nm) {
	this.nm = nm;
}
public String getCol0() {
	return col0;
}
public void setCol0(String col0) {
	this.col0 = col0;
}
public String getCol1() {
	return col1;
}
public void setCol1(String col1) {
	this.col1 = col1;
}
public String getCol2() {
	return col2;
}
public void setCol2(String col2) {
	this.col2 = col2;
}
public String getCol3() {
	return col3;
}
public void setCol3(String col3) {
	this.col3 = col3;
}
public String getCol4() {
	return col4;
}
public void setCol4(String col4) {
	this.col4 = col4;
}
public String getCol5() {
	return col5;
}
public void setCol5(String col5) {
	this.col5 = col5;
}
public String getCol6() {
	return col6;
}
public void setCol6(String col6) {
	this.col6 = col6;
}
public String getCol7() {
	return col7;
}
public void setCol7(String col7) {
	this.col7 = col7;
}
public String getCol8() {
	return col8;
}
public void setCol8(String col8) {
	this.col8 = col8;
}
public String getCol9() {
	return col9;
}
public void setCol9(String col9) {
	this.col9 = col9;
}

public BigDecimal getTot() {
	return tot;
}

public void setTot(BigDecimal tot) {
	this.tot = tot;
}


}
