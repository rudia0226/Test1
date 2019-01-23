<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="board.write.sns">
		<textarea name="cs_txt" class="snsTA"></textarea><p>
		<div  class="btnContainer">
		<button id="snsBtn" class="snsBtn">입력</button>
		</div>
		
		<hr  width="60%" color="#AEB6BF"  size="2"> 
 	</form>

	<c:forEach var="m" items="${msgs}">
		<div class="container">
			<table class="snsTable">
				<tr bordercolor="#6464ff">
					<td align="left">${m.cs_owner }(${m.m_name})</td>
				</tr>
				<tr>
					<td align="right">${m.cs_date }</td>
				</tr>
				<tr> 
					<td>${m.cs_txt }</td>
				</tr>
				<tr>
					<td> 
						<div class="divC"></div>
					</td>
				</tr>
				<tr>
					<td><br>
					<table  style="width: 100%;">
						<c:forEach  var="csr"  items="${m.csr }">
						<tr>
							<td >
							&nbsp;&nbsp;&nbsp;
						${csr.csr_owner }  : ${csr.csr_txt }
							</td>
							<td  align="right">
						<c:if test="${csr.csr_owner == sessionScope.loginMember.m_id }">
							<button  class="snsBtn3"  onclick="replUpdate(${csr.csr_no});" >수정</button>
							<button  class="snsBtn3"  onclick="delSNSRepl(${csr.csr_no});" >삭제</button>
						</c:if> 
							</td>
						</tr>
						</c:forEach> 
						</table>
							<br><br>
					<c:if test="${sessionScope.loginMember.m_id != null}">
							<form action="board.writeRPL.sns">    &nbsp; &nbsp;
								${ sessionScope.loginMember.m_id } : <input type="hidden"
									name="csr_cs_no" value="${m.cs_no }" readonly="readonly">
								<input class="snsInput" name="csr_txt">
								<button class="snsBtn2">댓글입력</button>
							</form> 
						</c:if></td>
				</tr>
				<c:if test="${m.cs_owner == sessionScope.loginMember.m_id }">
					<tr>
						<td align="right">
							<button class="snsBtn1">수정</button>
							<button class="snsBtn1"  onclick="delSNS(${m.cs_no});">삭제</button>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</c:forEach>
	<hr width="60%" color="#AEB6BF" size="1">
</body>
</html>
