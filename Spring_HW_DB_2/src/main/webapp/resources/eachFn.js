if($(xhr).find("status").text() == 'success'){
	
	

	function showResult(xhr) {
		console.log("전체출력 : " + xhr);
		
		$('#chartList1').remove();
		
		var t = $('<tr></r>').attr('border','1').attr('id','chartList1');
		if($(xhr).find("status").text() == 'success'){
		$(xhr).find('chart').each(function (i, chart) {
			var areaCd 		= $(chart).find('areaCd').text();
			var nm 				= $(chart).find('nm').text();
			var regionArea  = $(chart).find('regionArea').text();
			var col0 			= $(chart).find('col0').text();
			var col1 			= $(chart).find('col1').text();
			var col2 			= $(chart).find('col2').text();
			var col3 			= $(chart).find('col3').text();
			var col4				= $(chart).find('col4').text();
			var col5 			= $(chart).find('col5').text();
			var col6 			= $(chart).find('col6').text();
			var col7				= $(chart).find('col7').text();
			var col8 			= $(chart).find('col8').text();
			var col9 			= $(chart).find('col9').text();
			var tot 				= $(chart).find('tot').text();
			
			var areaCd_td = $('<td></td>').text(areaCd);
			var nm_td 	  = $('<td></td>').text(nm);		
			var regionArea_td  = $('<td></td>').text(regionArea);
			var col0_td 		= $('<td></td>').text(col0);
			var col1_td 		= $('<td></td>').text(col1);
			var col2_td 		= $('<td></td>').text(col2);
			var col3_td 		= $('<td></td>').text(col3);
			var col4_td		= $('<td></td>').text(col4);
			var col5_td 		= $('<td></td>').text(col5);
			var col6_td 		= $('<td></td>').text(col6);
			var col7_td		= $('<td></td>').text(col7);
			var col8_td 		= $('<td></td>').text(col8);
			var col9_td 		= $('<td></td>').text(col9);
			var tot_td 		= $('<td></td>').text(tot);
		});// each fn close
		}
		$('thead').append(t);
	}// showResult fn close

}





/* 

function objectToXml(xhr) {
    var xml = '';
    var chart1 = '<chart>';
    var chart2 = '</chart>';
    
    for (var prop in xhr) {
    	
        if (!xhr.hasOwnProperty(prop)) {
            continue;
        }
        if (xhr[prop] == undefined)
            continue;
        xml += "<" + prop + ">";
        if (typeof xhr[prop] == "object")
            xml += objectToXml(new Object(xhr[prop]));
        else
            xml += xhr[prop];
        xml += "</" + prop + ">";
        
    } 
    console.log(chart1 + xml + chart2);
    return xml;
}
		  
		   */
		  
		  
		  /* 
$(function () {
//$(document).ready(function () {
	$("#submit").click(function(){
		
		var data = $('#form').serialize();
		console.log("data"+data);
		$('tbody').closest('#tr').remove(); 
		var jsonData = JSON.stringify(data);
		console.log("jsonData"+jsonData);
		
		$.ajax({
			type: 'get',
		    url : 'chartsToJSP', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
		  	//contentType: 'application/x-www-form-urlencoded',
		    //data :data, 
			success: showResultJSON
			
 		 });  //ajax close
	});	 // click close 	
}); // fn close    
 */

/* 
function moveToJSP() {
	 	var data = $('#form').serialize();
		console.log("data : "+data);
		var jsonData = JSON.stringify(data);
		console.log("jsonData : "+jsonData);
		
		$.ajax({
			type: 'get',
		    url : 'chartsToJSP', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success : console.log('SUCCESS')
		});
} 
  */
 	






function showResultJSON(xhr) {
	alert('DDD');
	console.log(xhr);
	
	if($(xhr).find("status").text() == 'success'){
		$(xhr).find("chart").each(function (idx, chart) {
			$('<tr>').attr("id","tr1")
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
	}// if문닫음 */
	
}// showResultJSON fn종료




function userOp(){
    //등록 버튼 클릭a
    console.log("클릭?");
    $('#btnSubmit').on('click',function(){
       console.log("데이터?");
       var argareacd = $('select[name="argareacd"]').val();
       var arggr = $('input:radio[name="arggr"]:checked').val();
       var argdir = $('input:radio[name="argdir"]:checked').val();
       var argcd10 = $('input:text[name="argcd10"]').val();
       var argcd20 = $('input:text[name="argcd20"]').val();
       var argcd30 = $('input:text[name="argcd30"]').val();
       var argcd40 = $('input:text[name="argcd40"]').val();
       var argcd50 = $('input:text[name="argcd50"]').val();
       var argcd60 = $('input:text[name="argcd60"]').val();
       var argcd70 = $('input:text[name="argcd70"]').val();
       var argcd80 = $('input:text[name="argcd80"]').val();
       var argcnt = $('input:text[name="argcnt"]').val();   
       
    
       $.ajax({ 
          
          
           url: "listOp",  
           type: 'post',  
           dataType: 'json', 
           data:JSON.stringify({ argareacd: argareacd, arggr :arggr ,argdir: argdir, argcd10: argcd10, argcd20: argcd20, argcd30: argcd30, argcd40: argcd40, argcd50: argcd50, argcd60: argcd60,argcd70: argcd70, argcd80: argcd80, argcnt : argcnt }),
           contentType: 'application/json',
           mimeType: 'application/json', 
           error:function(xhr, status, message) 
           { 
               alert(" status: "+status+" er:"+message);
           } ,
           success:function(xhr, xhr2) {
             console.log("작성하기");
              console.log(xhr.data);
              console.log(xhr2.data);
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

             });//each
          }
        });  
    });//등록 버튼 클릭
 }







