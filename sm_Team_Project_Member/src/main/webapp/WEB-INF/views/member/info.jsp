<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1  class="joinH">회원정보</h1> 
<div class="ContainerInfo">
<table >
	<tr>
		<td class="infoTD1">Email</td>
		<td class="infoTD2">${UserInfo.user_Email }</td>
	</tr>
	<tr>
		<td class="infoTD1">User_Name</td>
		<td class="infoTD2">${UserInfo.user_Name }</td>
	</tr>
	<tr>
		<td class="infoTD1">User_Birth</td>
		<td class="infoTD2">${UserInfo.user_Birth }</td>
	</tr>
	<tr>
		<td class="infoTD1">User_Sex</td>
		<td class="infoTD2">
	<%-- 	${UserInfo.user_Sex == 'f' } --%>
		<c:if test="${UserInfo.user_Sex == 'f' }">
			여자
		</c:if>
		<c:if test="${UserInfo.user_Sex == 'm' }"> 
			남자
		</c:if>
		</td>
	</tr>
	<tr>
		<td class="infoTD1">Goal_Amount</td>
		<td class="infoTD2">${UserInfo.goal_Amount }</td>
	</tr>
	<tr>
		<td colspan="2"><button class="infoBTN" onclick="location.href='member.updateGo'">정보수정</button></td>
	</tr>
	<tr>
		<td colspan="2"><button class="infoBTN" onclick="location.href='calendar'">돌아가기</button></td>
	</tr>
</table>
</div> 
</body>
</html>