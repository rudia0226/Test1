
	console.log($('.ip1').val());
	
	$(document).ready(function () {
		$("#colorBtn").click(function(){
			console.log($('.ip5').val());
			
			var dataArray = new Array();
			
			var dataInfo = new Object();
			dataInfo.cmt = $('.ip1').val();
			dataInfo.cdId = "TOP_COLOR";
			dataArray.push(dataInfo);
			
			var dataInfo = new Object();
			dataInfo.cmt = $('.ip2').val();
			dataInfo.cdId = "LAST_COLOR";
			dataArray.push(dataInfo);
			
			var dataInfo = new Object();
			dataInfo.cmt = $('.ip3').val();
			dataInfo.cdId = "D_BK_COLOR";
			dataArray.push(dataInfo);
			
			var dataInfo = new Object();
			dataInfo.cmt = $('.ip4').val();
			dataInfo.cdId = "M_BK_COLOR";
			dataArray.push(dataInfo);
			
			var dataInfo = new Object();
			dataInfo.cmt = $('.ip5').val();
			dataInfo.cdId = "T_BK_COLOR";
			dataArray.push(dataInfo);
			
			var data = new Object();
			data.datas = dataArray;
			
			console.log('data : ' + data); 
			console.log('dataArray : ' + dataArray); 
			console.log('JSON.stringify(data) : ' + JSON.stringify(data));
			console.log('JSON.stringify(dataArray) : ' + JSON.stringify(dataArray));
			
			$.ajax({
				type: 'post',
			    url : 'doColorChange', 
			  	contentType: 'application/json; chartset=utf-8',
			    data : JSON.stringify(data),   
			   // data : JSON.stringify(dataArray),   
			    dataType : 'json',
			    async   : false,   //asyncronous to syncronous
			    error:function(xhr,status,msg){
						alert("상태값 :" + status + " Http에러메시지 :"+msg);
					},
				success:  function () {
					alert(xhr);	
				}  //colorChange  //fn 이용 
	 		 });  //ajax close
			
		}); //colorBtn close  
		
		
		 // 클릭 시 value값 초기화
		$('#input_click_init').focus(function () {
			$(this).val('');
		}).blur(function () {
			if($(this).val() == '' ) {$(this).val('white');}
		}); // focus close 
		
		
	});// fn close  
	
	function doPopupclose() {
	   window.close();
	} // close doPopupclose