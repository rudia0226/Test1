<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link  href="resources/css/color.css" rel="stylesheet"  type="text/css" /> 
<script  src="resources/js/color.js"  ></script>
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