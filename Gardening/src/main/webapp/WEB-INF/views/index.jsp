<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gardening</title>
<link  rel="stylesheet"  href="resources/css/index.css">
<link  rel="stylesheet"  href="resources/css/member.css">
<link  rel="stylesheet"  href="resources/css/bottom.css">
<link  rel="stylesheet"  href="resources/css/board.css">

<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	$("#joinID").keyup(function (e) {
	//	if (e.keyCode == 32) {  // space바로 test
			var m_id2 = $("#joinID").val();
			$.ajax({
				url : "member.check",
				data : {m_id : m_id2}, 
				success : function (xml) {
					if($(xml).find("member").length == 1){
						$("#joinID").css("background","#FADBD8");
					}else {
						$("#joinID").css("background","#E8F8F5");
						
					}
				}
			});
	//	}
	});
});
</script>
</head>
<body  leftmargin="0">
	<div  id="r"> ${r } </div>
	<table id="siteTitle">
		<tr>
			<td align="center">
				<a   id="title"   href="home.go">Gardening</a>
			</td>
		</tr>
		<tr class="siteBar">
			<td align="center"><jsp:include page="${menuPage}"></jsp:include></td>
		</tr>
	</table>

	<table  id="siteContent">
		<tr  id="content">
			<td align="center"><jsp:include  page="${contentPage}"></jsp:include></td>
		</tr>
	</table>
	<div  id="null"></div>
	<table  id="siteBottom">
		<tr>	
			<td align="center" ><jsp:include  page="${bottomPage }"></jsp:include></td>
		</tr>
	</table>
</body>
</html>