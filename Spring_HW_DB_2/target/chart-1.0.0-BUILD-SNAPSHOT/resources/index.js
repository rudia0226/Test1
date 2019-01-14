
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
		

$(document).ready(function () {
	$("#submit").click(function(){
		var data = $('#form').serialize();
		alert(data);
		
		$.ajax({
			type: 'get',
		    url : 'chartsToMVM', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success: showResultJSON
 		 });  //ajax close
	});	 // click close
}); // fn close


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


function showResultJSON(xhr) {
	alert('DDD');
	/*console.log(xhr);
	if($(xhr).find("status").text() == 'done'){
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
	}// if문닫음
*/}// showResultJSON fn종료


/*

VOXML 에서 status 지웠음 안되면 다시복구..

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

*/



/*

$(document).ready(function () {
	$("#submit").click(function(){
		var data = $('#form').serialize();
		console.log("data"+data);
		
		var jsonData = JSON.stringify(data);
		console.log("jsonData"+jsonData);
		
		$.ajax({
			type: 'get',
		    url : 'chartsToMVM', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
		  	//contentType: 'application/x-www-form-urlencoded',
		    //data :data,
			//success: showResultJSON
			success: function(xhr) {
				console.log(xhr);
			}
 		 });  //ajax close
	});	 // click close
}); // fn close   





var argAreaCd = $('select[name="argAreaCd"]').val();
var arg_gr = $('input:radio[name="arg_gr"]:checked').val();
var arg_dir = $('input:radio[name="arg_dir"]:checked').val();
var arg_cd10 = $('input:text[name="arg_cd10"]').val();
var arg_cd20 = $('input:text[name="arg_cd20"]').val();
var arg_cd30 = $('input:text[name="arg_cd30"]').val();
var arg_cd40 = $('input:text[name="arg_cd40"]').val();
var arg_cd50 = $('input:text[name="arg_cd50"]').val();
var arg_cd60 = $('input:text[name="arg_cd60"]').val();
var arg_cd70 = $('input:text[name="arg_cd70"]').val();
var arg_cd80 = $('input:text[name="arg_cd80"]').val();
var arg_cnt = $('input:text[name="arg_cnt"]').val();   


$.ajax({ 
    url: "listOp",  
    type: 'POST',  
    dataType: 'text', 
    data: JSON.stringify({ argAreaCd: argAreaCd, ARG_GR:arg_gr
    								,arg_dir: arg_dir, arg_cd10: arg_cd10
    								, arg_cd20: arg_cd20, arg_cd30: arg_cd30
    								, arg_cd40: arg_cd40, arg_cd50: arg_cd50
    								, arg_cd60: arg_cd60,arg_cd70: arg_cd70
    								, arg_cd80: arg_cd80, arg_cnt : arg_cnt }),
    contentType: 'application/json', 



*/





function showResult(xhr) {
	console.log("전체출력 : " + xhr);
	
	$('#chartList1').remove();
	var tbody = $('<table></table>').attr('border','1').attr('id','chartList1');
	var t = $('<tbody></tbody>');
	
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
			
			var tr = $('<tr></tr>').append(areaCd_td, nm_td, regionArea_td, col0_td, col1_td
													, col0_td, col1_td, col2_td, col3_td, col4_td, col5_td
													, col6_td, col7_td, col8_td, col9_td, tot_td			
												);
			$(t).append(tr);
		});// each fn close
	}
	$('table').append(t);
}// showResult fn close







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
		    url : 'chartsToMVM', 
		  	contentType: 'application/json; chartset=utf-8',
		    data : JSON.stringify(data),
		    dataType : 'json',
		    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
		  	//contentType: 'application/x-www-form-urlencoded',
		    //data :data, 
			success: showResultJSON
			
			/* success: function (xhr) {
				 console.log('success SELECT');
				 console.log(xhr);
				 $('#tr1').remove();
				var tr = '<tr>';
				$(xhr).find("chart").each(function (i, chart) {
					tr += '<td>' 
							+ chart[i].areaCd + '</td></td>' + chart[i].nm + '</td></td>' 
							+ chart[i].regionArea + '</td></td>' + chart[i].col0 + '</td></td>' 
							+ chart[i].col1 + '</td></td>' + chart[i].col2 + '</td></td>' 
							+ chart[i].col3 + '</td></td>' + chart[i].col4 + '</td></td>' 
							+ chart[i].col5 + '</td></td>' + chart[i].col6 + '</td></td>' 
							+ chart[i].col7 + '</td></td>' + chart[i].col8 + '</td></td>' 
							+ chart[i].col9 + '</td></td>' + chart[i].tot + '</td></td>'+ '</td>';
					tr += '</tr>' 
				}); //each문 close
				$('#containerTable').append(tr);
			}// success fn close
				 */
			
 		 });  //ajax close
	});	 // click close 	
}); // fn close    












