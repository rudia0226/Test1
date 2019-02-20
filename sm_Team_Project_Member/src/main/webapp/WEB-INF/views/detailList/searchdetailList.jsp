<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/detail.js"></script>
<title>Insert title here</title>

</head>
<body>

<div  class="detailListContainer">
	
<table width="500" cellpadding="0" cellspacing="0" >
		<tr  class="detailTR">
			<td align="center"><span class="spanDetail_col">삭제</span></td>
			<td align="center"><span class="spanDetail_col">날짜</span></td>
			<td align="center"><span class="spanDetail_col">메모</span></td>
			<td align="right"><span class="spanDetail_col">금액</span></td>
			<td align="right"><span class="spanDetail_col">결제</span></td>
			<td align="right"><span class="spanDetail_col">내용</span></td>
		</tr>
		   
		 
		<c:set var = "total" value = "0" />
		
		<c:forEach items="${BookCas}" var="dDAO">
			<tr>
				<td align="center"><span class="spanDetail_col2"><input class="detailSearchBtnDel"  type="button" onclick="delDetail(${dDAO.ca_Key});"
					value="삭제"></span></td>
				<td align="center"><span class="spanDetail_col2"><fmt:formatDate value="${dDAO.data_Date}" /></span></td>
				<td align="center"><span class="spanDetail_col2">${dDAO.data_Memo }</span></td>
				<td align="right"><span class="spanDetail_col2">${dDAO.data_Amount }</span></td>
				<td align="right"><span class="spanDetail_col2">${dDAO.pay_Value }</span></td>
				<td align="right"><span class="spanDetail_col2">${dDAO.ca_Value }</span></td>
	 	 
			</tr> 
			<c:set var = "total" value="${total + dDAO.data_Amount }"/>
		</c:forEach>
		<tr> 
		<td align="center"  colspan="6"> &nbsp; </td>
		</tr>
		<tr> 
		<td align="center"  colspan="6"><span class="spanDetail_col3"> 총 합: <c:out value="${total }"/></span> </td>
		</tr>
		<tr> 
		<td align="center"  colspan="6"> &nbsp; </td>
		</tr> 
	</table>
 
	<table>
		<tr>
			<td><c:forEach var="p" begin="1" end="${pageCount}">
				&nbsp;<a href="detaileList.page.change?p=${p}">${p}</a>
				</c:forEach>
			</td>
			<td><form action="detailList"><button class="backDetailBtn">돌아가기</button></form></td>
		</tr> 
	</table>
	
	<p><p>
	
</div>
</body>
</html>