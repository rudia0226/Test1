<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link  href="resources/css/color.css" rel="stylesheet"  type="text/css" /> 
<script type="text/javascript">
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
					alert("���°� :" + status + " Http�����޽��� :"+msg);
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
</script>
</head>
<body>   
<form id="form2"  action="doColorChange"  method="get" >
	<div id="form"  align="center"> 
	<img alt="���޴�" src="resources/img/skyBtn.jpg"  width="350">
	<br><h4>�ҷ����� ��ư Ŭ���� ���� �� ��ȯ!</h4> 
	 </div>
	<input  type="reset"  id="resetBtn"  value="�����ϱ�"  name="resetbtn"  >
	<input  type="submit"  id="colorBtn" value="�ѹ����ٲٱ�"><br> 
</form>
<input  type="button"  id="selectColorListBtn" value="�ҷ�����" > <br> 
<input  type="button"  id="closeBtn" value="â�ݱ�" onclick="doPopupclose();" >
</body>
</html>