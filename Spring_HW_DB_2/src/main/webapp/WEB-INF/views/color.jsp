<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

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
	
	
</script>
</head>
<body> 
<form id="form2">
	<input type="hidden"  name="hidden1" value="0">	
	 <input type="hidden"  name="cdId"  value="TOP_COLOR">
	 	최대값 색상<input name="cmt" class="ip1"  id="input_click_init"  value="RED"><br>
	 <input type="hidden"  name="cdId"  value="LAST_COLOR">
	 	최소값 색상<input name="cmt" class="ip2" id="input_click_init"  value="BLUE"><br>
	 <input type="hidden"  name="cdId"  value="D_BK_COLOR">
	 	데이터 색상<input name="cmt" class="ip3"  id="input_click_init"  value="#FFFAFA"><br>
	 <input type="hidden"  name="cdId"  value="M_BK_COLOR">
	 	중간합계 색상<input name="cmt" class="ip4"  id="input_click_init"  value="#c8c8ff"><br>
	 <input type="hidden"  name="cdId"  value="T_BK_COLOR">
	 	총계 색상<input name="cmt" class="ip5"  id="input_click_init"  value="#B0E6E6"><br>
	 <input type="hidden"  name="hidden2"  value="0">
</form>
<input  type="button"  id="colorBtn" value="확인">
<button onclick="doPopupclose();">창닫기</button>
</body>
</html>