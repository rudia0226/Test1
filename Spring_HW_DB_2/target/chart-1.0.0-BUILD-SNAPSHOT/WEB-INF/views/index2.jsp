<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WWS Spring 구현 숙제</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(function () {
	$.ajax({
		type: 'get',
		url:'chartsXml',
		contentType:'application/xml;charset=utf-8',
		dataType:'xml',
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:showResult
		
	}); // ajax
}); //fn 종료
	

function showResult(xhr) {
	alert('CCC');
	console.log(xhr);
	if($(xhr).find("status").text() == 'success'){
		$(xhr).find("chart").each(function (idx, chart) {
			$('<tr>').attr("id","tr")  
			.append($('<td>').html($(chart).find("areaCd").text()))
			.append($('<td>').html($(chart).find("nm").text()))
			.append($('<td>').html($(chart).find("regionArea").text()))
			.append($('<td>').html($(chart).find("col0").text()))
			.append($('<td>').html($(chart).find("col1").text()))
			.append($('<td>').html($(chart).find("col2").text()))
			.append($('<td>').html($(chart).find("col3").text()))
			.append($('<td>').html($(chart).find("col4").text()))
			.append($('<td>').html($(chart).find("col5").text()))
			.append($('<td>').html($(chart).find("col6").text()))
			.append($('<td>').html($(chart).find("col7").text()))
			.append($('<td>').html($(chart).find("col8").text()))
			.append($('<td>').html($(chart).find("col9").text()))
			.append($('<td>').html($(chart).find("tot").text()))
			.appendTo('tbody');
			
		}); //each문 닫음
	}// if문닫음
}// showResult fn종료
 


</script>
</head>
<body>

<p>
<h2>GOOGLE CHART</h2>
<p>

<form  id="form"  method="post"  onsubmit="href.location='chartsToJSP'">
		<input type="hidden"  name="hidden1" value="0">
		<select  name="areaCd"  id="areaCd">
			<option  value="">전체</option>
			<option  value="10">서울</option>
			<option  value="20">경기</option>
			<option  value="30">인천</option>
			<option  value="40">평택</option>
			<option  value="50">울산</option>
			<option  value="60">대전</option>
			<option  value="70">부산</option>
			<option  value="80">광주</option>
		</select>
	<p>
	<div class="AreaCheck">
		<input type="radio" name="gr" id="gr" value="D"> DATA
		<input type="radio" name="gr" id="gr" value="S"> 중간총계
		<input type="radio" name="gr" id="gr" value="T"> 총계
		<input type="radio" name="gr" id="gr" value="R"> 전체
	</div> 
	<p>
	<div class="DataOrder">
		<input type="radio" id="totalData"  name="totalData"  value="D">DATA우선
		<input type="radio" id="totalData"	name="totalData"  value="F">  총계우선
	</div>
	<p>
	<div class="AreaOrder">
	    서울 <input type="text" name="seoul"  maxlength="1" id="seoul"  > 
	    경기 <input type="text" name="kyunggi"  maxlength="1" id="kyunggi"> 
	    인천 <input type="text" name="incheon"  maxlength="1" id="incheon"> 
	    평택 <input type="text" name="pyungtek"  maxlength="1" id="pyungtek">
	    울산 <input type="text" name="ulsan"  maxlength="1" id="ulsan"> 
	    대전 <input type="text" name="daejoen"  maxlength="1" id="daejoen"> 
	    부산 <input type="text" name="busan"  maxlength="1" id="busan"> 
	    광주 <input type="text" name="gwangju"  maxlength="1" id="gwangju">
	</div>
	<p>
		건수 <input type="text"  name="numOrderInput"  id="numOrderInput" > 
		<input type="hidden"  name="hidden2"  value="0">
		<input type="submit"  value="JSP이동">
</form>
	<input type="button"  id="submit"  value="확인버튼">

<p>
<hr>
<p>
<div class="container">	
<table  class="containerTable"  border="1">
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
	
	
	<%-- 
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
	</c:forEach>	 --%>
</table>
</div>	
</body>
</html>