$(document).ready(function () {
	$("#submit").click(function(){
		var data = $('#form').serialize();   // id 가 form 인 form의 input, select 의 name, value를 담아줌
		console.log(data); 
		$.ajax({
			type: 'get',
		    url : 'chart/chartsToMVM', 
		  	contentType: 'application/json; chartset=utf-8',
		    data :  JSON.stringify(data), 
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
			type: 'get',  
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
	 