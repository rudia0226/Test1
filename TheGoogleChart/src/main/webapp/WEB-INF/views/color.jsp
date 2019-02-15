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
	<img alt="스앵님" src="resources/img/skyBtn.jpg"  width="350">
	<br><h4>불러오기 버튼 클릭시 기존 값 소환!</h4> 
	 </div>
	<input  type="reset"  id="resetBtn"  value="리셋하기"  name="resetbtn"  >
	<input  type="submit"  id="colorBtn" value="한번에바꾸기"><br> 
</form>
<input  type="button"  id="selectColorListBtn" value="불러오기" > <br> 
<input  type="button"  id="closeBtn" value="창닫기" onclick="doPopupclose();" >
</body>
</html>