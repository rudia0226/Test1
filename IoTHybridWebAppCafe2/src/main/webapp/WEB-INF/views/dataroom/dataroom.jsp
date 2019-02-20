<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.loginMember != null }">
		<form action="dataroom.upload"
			method="post" enctype="multipart/form-data"
		 name="drRegForm" onsubmit="return drRegCheck();">
			<table id="drRegTbl">
					<tr>
						<td align="center"><input class="drRegInput" name="id_title" placeholder="제목" maxlength="25" autocomplete="off"></td>
					</tr>
					<tr>
						<td align="center"><input name="id_file" type="file"></td>
					</tr>
					<tr>
						<td align="center">
							<input id="drRegBtn" type="submit" value="업로드">
						</td>
					</tr>
			</table>
		</form>
	</c:if>
	<table id="drArea">
		<tr>
			<td align="center">
				<c:forEach var="d" items="${datas }">
					<table class="drItem">
						<tr>
							<c:choose>
								<c:when test="${sessionScope.loginMember.im_id == d.id_owner }">
									<td align="center" colspan="2" class="drTitle" onclick="deleteData(${d.id_id}, '${d.id_file }');">${d.id_title }</td>
								</c:when>
								<c:otherwise>
									<td align="center" colspan="2" class="drTitle">${d.id_title }</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>				
							<td rowspan="2" class="drImgTd" align="center">
								<a href="resources/etc/${d.id_file }">
									<img src="resources/etc/d.png">
								</a>
							</td>
							<td>${d.id_owner }</td>
						</tr>
						<tr>
							<td align="right">
								<fmt:formatDate value="${d.id_date }" pattern="yyyy-MM-dd"/>&nbsp;
							</td>
						</tr>
					</table>
				</c:forEach>
			</td>
		</tr>
	</table>
	
</body>
</html>