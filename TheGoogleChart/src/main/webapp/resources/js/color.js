	$(document).ready(function () {
	
		$('#resetBtn').hide();
		$('#colorBtn').hide();
		
		$('#selectColorListBtn').click(function () {
			$('#resetBtn').show();
			$('#colorBtn').show();
			$.ajax({
				type: 'get',
			    url : 'selectListColorChart',  
			  	contentType: 'application/json; chartset=utf-8',
			    dataType : 'json',
			    error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
			success: selectColorChart
				
			}); // ajax close
		}); // click fn close 
		
	});// fn close  
	
	function selectColorChart(xhr) {
		$('#form').empty();   
		$.each(xhr.colorChart, function (idx, item) {
			$('<div>') 
		       .append($('<label>').html(item.cdNm).css('font-weight','bolder') )
		       .append($('<input>').attr('value',  (item.cmt) ).attr('type','text').attr('name','cmt').attr('id','input'))
		       .append($('<input>').attr('value',  (item.cdId) ).attr('type','hidden').attr('name','cdId'))
		       .appendTo('#form');
		}); // each close
	} // selectColorChart fn close 
	
	function doPopupclose() {
	   window.close();
	} // close doPopupclose