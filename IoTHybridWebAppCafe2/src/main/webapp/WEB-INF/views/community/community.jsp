<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table id="memberArea">
		<tr>
			<td>
				<c:forEach var="m" items="${members }">
					<table class="memberTable" onclick="sendMsg('${m.im_id}')">
						<tr>
							<td rowspan="4" class="memberImgTd" align="center"><img
								class="memberImg" src="resources/etc/${m.im_img }"></td>
							<td class="memberIDTd">${m.im_id }</td>
						</tr>
						<tr>
							<td align="right" valign="bottom" style="height:50px;">${m.im_name }&nbsp;</td>
						</tr>
					</table>
				</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>