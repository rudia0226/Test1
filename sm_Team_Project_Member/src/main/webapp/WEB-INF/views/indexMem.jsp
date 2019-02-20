<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Saving Mate</title>

<script type="text/javascript"  src="resources/js/jquery.js"></script>
<script type="text/javascript"  src="resources/js/check.js"></script>
<script type="text/javascript"  src="resources/js/validCheck.js"></script>
<script type="text/javascript"  src="resources/js/idCheck.js"></script>
<script type="text/javascript"  src="resources/js/board.js"></script>
<script type="text/javascript"  src="resources/js/detail.js"></script>
<script type="text/javascript"  src="resources/js/bookdata.js"></script>
<script type="text/javascript"  src="resources/js/category.js"></script>

<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'>
<link href="https://bootswatch.com/4/pulse/bootstrap.min.css" rel="stylesheet" >

<link  rel="stylesheet"  href="resources/css/index.css">
<link  rel="stylesheet"  href="resources/css/member.css" >
<link  rel="stylesheet"  href="resources/css/chart.css" >
<link  rel="stylesheet"  href="resources/css/calendar.css" > 
<link rel="stylesheet"  href="resources/css/board.css">
<link rel="stylesheet"  href="resources/css/detailList.css">
<link rel="stylesheet"  href="resources/css/bookdata.css">
<link rel="stylesheet"  href="resources/css/category.css">
</head> 
<body  leftmargin="0">
 
<table  id="memTitle">
	<tr align="center"  >
			<td class="memTitleText"  id="title" onclick="location.href='home.go'" style="cursor: pointer;"  valign="bottom"><img src="resources/img/TITLE.png"  height="60px"></td>
	</tr> 
</table> 
 
<p>

<table  id="memContent">
	<tr>
		<td id="menu"><jsp:include  page="${menuPage }"></jsp:include></td>
		<td align="center"><jsp:include  page="${contentPage }"></jsp:include></td>
	</tr> 
</table>

<p><p>

<table id="memBottom"> 
				<tr align="center"  valign="middle">
					<td>Get your own Plan with Saving Mate.</td>
				</tr>
</table> 

	
</body>
</html>