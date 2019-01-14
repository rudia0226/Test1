$(document).ready(function () {
	
	$("#submit").click(function(){
		
		var data = $('#form').serialize();
		$.ajax({
			type: 'get',
		    url : 'chartsToMVM', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success: showResult
 		 });  //ajax close
	});	 // submit click close
	
	
	$("#areaCd").click(function(){
		console.log('#areaCd 클릭함');
		$ajax({
			
			type : 'get',
			url : 'getSelectBoxValue',
			contentType : '' ,
			error : function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success : showSelected
			
			
		}); // ajax close 
	}); // areaCd click close
	
	
	
}); // fn close 



	
function showSelected(xhr) {
	console.log('selectBox 값 가져오기');
}








function showResult(xhr) {
	 console.log("작성하기");
     console.log(xhr.time);
     
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



