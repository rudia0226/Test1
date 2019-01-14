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
thead{
	background: #aaa;
}
.div{
	font-weight: bolder;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function () {
	
	$("#submit").click(function(){
		
		var data = $('#form').serialize();
		$.ajax({
			type: 'get',
		    url : 'chartsToMVM', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    //async   : false,   //asyncronous to syncronous
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success: showResult
 		 });  //ajax close
	});	 // submit click close
	
	 
	$("#areaCd").mouseenter(function(){
		console.log('#areaCd 클릭함');  
		$.ajax({
			type: 'post',  
		    url : 'getSelectBoxValue', 
		  	contentType: 'application/json; chartset=utf-8',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success: showSelected
 		 });  //ajax close
	}); // areaCd click close 
	
	
}); // fn close 
 
	
function showSelected(xhr) {
	console.log('selectBox 값 가져오기');
	//console.log(xhr.selectBox);
	 
	$("#areaCd").find("option").remove().end().append("<option value=''>전체</option>");

	$.each(xhr.selectBox, function(idx, item){
		$("#areaCd").append("<option value='"+item.cds+"'>"+item.nms+"</option>")
	});// each close 
}


function showResult(xhr) {
	 console.log("작성하기");
     console.log('Measuring Time  : ' + xhr.time);
     
     $('#div1').remove();
     var div = $('<div></div>').attr('id','div1');
     div.append(' Time\t: '+xhr.time + ' sec');
     
     $('#div').prepend(div).css("width","400").css("height","40").css("font-size","20pt").css("color","red").css("background-color","yellow");
     
     $("tbody").empty();
     $.each(xhr.data, function(idx, item) {
        $('<tr>')
        .append($('<td>').html(item.areaCd))
        .append($('<td>').html(item.nm))
        .append($('<td>').html(item.regionArea))
        .append($('<td>').html(item.col0))
        .append($('<td>').html(item.col1))
        .append($('<td>').html(item.col2))
        .append($('<td>').html(item.col3))
        .append($('<td>').html(item.col4))
        .append($('<td>').html(item.col5))
        .append($('<td>').html(item.col6))
        .append($('<td>').html(item.col7))
        .append($('<td>').html(item.col8))
        .append($('<td>').html(item.col9))
        .append($('<td>').html(item.tot))
        .appendTo('tbody');
     	$( 'td:contains("▼")' ).css( 'color', 'blue' );
     	$( 'td:contains("▲")' ).css( 'color', 'red' );
     	$( 'tr:contains("합계")' ).css( 'background', '#D5F5E3' ).css('font-weight', 'bold');
     	$( 'tr:contains("총계")' ).css( 'background', '#D6EAF8' ).css('font-weight', 'bold');

     });//each
} // showResult fn종료

</script>

</head>
<body>  

<p>
<h2>GOOGLE CHART</h2>
<p>

<form  id="form"  > <!--  onsubmit="moveToJSP();" -->
		<input type="hidden"  name="hidden1" value="0">
		<!-- <select  name="areaCd"  id="areaCd">
			<option  value="">전체</option>
			<option  value="10">서울</option>
			<option  value="20">경기</option>
			<option  value="30">인천</option>
			<option  value="40">평택</option>
			<option  value="50">울산</option>
			<option  value="60">대전</option>
			<option  value="70">부산</option>
			<option  value="80">광주</option>
		</select> -->
		
		<select name="areaCd"  id="areaCd">
		</select>
		
		
		
	<p>
	<div class="AreaCheck">
		<input type="radio" name="gr" id="gr" value="D"> DATA
		<input type="radio" name="gr" id="gr" value="M"> 중간총계
		<input type="radio" name="gr" id="gr" value="T"> 총계
		<input type="radio" name="gr" id="gr" value="R"  checked="checked"> 전체
	</div>   
	<p>
	<div class="DataOrder">
		<input type="radio" id="totalData"  name="totalData"  value="F"  checked="checked">DATA우선
		<input type="radio" id="totalData"	name="totalData"  value="D">  합계우선
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
		<!-- <input type="submit"  value="JSP이동"> -->
</form>
	<input type="button"  id="submit"  value="확인버튼">
<p>

<hr>
<div id="div" class="div"  align="center">

</div>

<p> 
<div class="container" >	
<table  class="containerTable"  border="1">
<thead>
	<tr  id="trTitle">
		<th>AREA_CD</th>	 
		<th>NM</th>	
		<th>REGION_AREA</th>	
		<th>청소기</th>	 
		<th>세탁기</th>	
		<th>건조기</th>	
		<th>정수기</th>	
		<th>도어락</th>	 
		<th>전화기</th>	
		<th>냉장고</th>	
		<th>김치냉장고</th>	
		<th>전자레인지</th>	
		<th>가스레인지</th>	
		<th>TOT</th>	
</tr>
</thead>
<tbody></tbody>
	
</table>
</div>	
</body>
</html>