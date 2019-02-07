<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WWS Spring 구현 숙제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link  href="resources/css/index.css" rel="stylesheet"  type="text/css" />
<script type="text/javascript">
$(document).ready(function () {
	$("#submit").click(function(){
		var data = $('#form').serialize();   // id 가 form 인 form의 input, select 의 name, value를 담아줌
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
	 
	$("#submitF").click(function(){  // Using Oracle Function
		var data = $('#form').serialize();   
		$.ajax({
			type: 'get',
		    url : 'chartWithFunction', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),   
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success: showResultWithFunciton
 		 });  //ajax close
	});	 // submit click close
	 
	$("#areaNm").mouseenter(function(){
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
	$("#areaNm").find("option").remove().end().append("<option value=''>전체</option>");
	$.each(xhr.selectBox, function(idx, item){
		$("#areaNm").append("<option value='"+item.cds+"'>"+item.nms+"</option>")
	});// each close 
} // showSelected Fn 종료

	
function showResult(xhr) {
	console.log("작성하기");
    console.log('Measuring Time  : ' + xhr.time);
    $('#div1').remove();
    var div = $('<div></div>').attr('id','div1');
    div.append(' Time\t: '+xhr.time + ' sec');
    $('#div').prepend(div).css("width","250").css("height","40").css("font-size","20pt").css("color","red").css("background-color","yellow");
    $("tbody").empty();
    //console.log(xhr.data);
    $.each(xhr.data, function(idx, item) {
       $('<tr>') 
       .append($('<td>').html(item.areaNm))
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


function showResultWithFunciton(xhr) {
	 console.log("작성하기");
     console.log('Measuring Time  : ' + xhr.time);
     $('#div1').remove();
     var div = $('<div></div>').attr('id','div1');
     div.append(' Time\t: '+xhr.time + ' sec');
     $('#div').prepend(div).css("width","250").css("height","40").css("font-size","20pt").css("color","red").css("background-color","yellow");
     $("#tbody").empty();
     var htmlStr = "";
     $.each(xhr.data, function(idx, item) {
    	htmlStr += item.areaNm
    	htmlStr += item.nm
    	htmlStr += item.regionArea
    	htmlStr += item.col0     
    	htmlStr += item.col1    
    	htmlStr += item.col2
    	htmlStr += item.col3
    	htmlStr += item.col4
    	htmlStr += item.col5
    	htmlStr += item.col6    
    	htmlStr += item.col7
    	htmlStr += item.col8
    	htmlStr += item.col9
    	htmlStr += item.tot
     });//each                
     //console.log(htmlStr); 
     $("#tbody").html(htmlStr);
} // showResult fn종료

function doPopupopen() {
	   window. open("colorChange", "Change Color", "width=400, height=400");
} // doPopupopen Fn 종료 
	 
</script>  
</head>

<body>  
<p><h1>GOOGLE CHART</h1>
<hr color="#9932CC"> <p>
<form  id="form" > 
		<input type="hidden"  name="hidden1" value="0">	 <!-- name, value값이 json으로 잘 넘어가기위해 앞뒤로 넣어줌. 의미없음 -->
		<select name="areaNm"  id="areaNm"></select> 
<!-- 		<select name="areaCd"  id="areaCd"></select> -->
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
	    서울 <input type="text" name="seoul"  maxlength="1" id="input001" > 
	    경기 <input type="text" name="kyunggi"  maxlength="1" id="input001"> 
	    인천 <input type="text" name="incheon"  maxlength="1" id="input001"> 
	    평택 <input type="text" name="pyungtek"  maxlength="1" id="input001">
	    울산 <input type="text" name="ulsan"  maxlength="1" id="input001"> 
	    대전 <input type="text" name="daejoen"  maxlength="1" id="input001"> 
	    부산 <input type="text" name="busan"  maxlength="1" id="input001"> 
	    광주 <input type="text" name="gwangju"  maxlength="1" id="input001">
	</div>
	<p>
		건수<input type="text"  name="numOrderInput"  id="input002" > 
	<p>
	
	<input type="hidden"  name="hidden2"  value="0"><!-- name, value값이 json으로 잘 넘어가기위해 앞뒤로 넣어줌. 의미없음 -->
</form>
<input type="button"  id="submit"  value="그냥확인"> 
<input type="button"  id="submitF"  value="함수적용"> 
<button  onclick="doPopupopen();"  id="colorBtn">색상설정</button>
<hr  color="#9932CC">



<div id="div" class="div"  align="center"></div>
<p> 
<div class="container" >	
<table  class="containerTable"  border="1">
<thead>
	<tr  id="trTitle">
	  <th>지역번호</th>		 <!-- AREA_CD -->
		<th>지역이름</th>	 <!-- NM -->
		<th>나라</th>	     <!-- REGION_AREA -->
		<th>청소기</th>	     <!-- COL0 -->
		<th>세탁기</th>		 <!-- COL1 -->
		<th>건조기</th>		 <!-- COL2 -->
		<th>정수기</th>		 <!-- COL3 -->
		<th>도어락</th>	 	 <!-- COL4 -->
		<th>전화기</th>		 <!-- COL5 -->
		<th>냉장고</th>		 <!-- COL6 -->
		<th>김치냉장고</th>	<!-- COL7 -->
		<th>전자레인지</th>	<!-- COL8 -->
		<th>가스레인지</th>	<!-- COL9 -->
		<th>총계</th>	 <!-- TOT -->
</tr>
</thead>
<tbody  id="tbody"></tbody>
</table>
</div>	
</body>
</html>