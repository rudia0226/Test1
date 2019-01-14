<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result</title>
<style type="text/css">
h2 {
margin-left: auto;
margin-right: auto;
text-align: center;}
.container{
	font-size: 11pt;
}
.containerTable{
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<body>


<p>
<h2>GOOGLE CHART</h2>
<p>

<table>
<tr  id="trTitle">
		<th>AREA_CD</th>	 
		<th>NM</th>	
		<th>REGION_AREA</th>	
		<th>COL0</th>	
		<th>COL1</th>	
		<th>COL2</th>	
		<th>COL3</th>	
		<th>COL4</th>	
		<th>COL5</th>	
		<th>COL6</th>	
		<th>COL7</th>	
		<th>COL8</th>	
		<th>COL9</th>	
		<th>TOT</th>	
	</tr>
	
	<c:forEach  var="chart"  items="${chartList }"  varStatus="loop">
	<tr>
		<td>${chart.areaCd }</td>
		<td>${chart.nm }</td>
		<td>${chart.regionArea }</td>
		<td>${chart.col0 }</td>
		<td>${chart.col1 }</td>
		<td>${chart.col2 }</td>
		<td>${chart.col3 }</td>
		<td>${chart.col4 }</td>
		<td>${chart.col5 }</td>
		<td>${chart.col6 }</td>
		<td>${chart.col7 }</td>
		<td>${chart.col8 }</td>      
		<td>${chart.col9 }</td>
		<td>${chart.tot }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>