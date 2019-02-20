<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="detailList.search"  >
<table >
	<tr>
			<td><span class="spanDetail">DATE </span></td>
			<td><select name="m_y"  class="detailSelect"  >
				<c:forEach var="y" begin="${curYear - 5 }" end="${curYear }">
						<option selected>${y }</option>
					</c:forEach>
			</select><span  class="spanDetail">년</span>&nbsp;&nbsp;&nbsp; 
			<select name="m_m"  class="detailSelect" >
					<c:forEach var="m" begin="1" end="12">
						<option selected>${m }</option>
					</c:forEach>
			</select><span  class="spanDetail">월</span>&nbsp;&nbsp;&nbsp; 
	<!-- 		<select name="m_d" type="hidden" >
					<c:forEach var="d" begin="1" end="31">
						<option>${d }</option>
					</c:forEach>  
			</select>일
 	-->
		</td>
		<td>
		<input name="Ca_Value"  class="detailInput">
	<button id="detailbtn"   class="detailbtn">검색</button>
	</td> 
	</tr>
</table>
	</form>   
	
<p><p><p> 

<div  class="detailListContainer">
	<table width="700" cellpadding="0" cellspacing="0">  
		<tr class="detailTR">
			<td align="center"><span class="spanDetail_col">날짜</span></td>
			<td align="center"><span class="spanDetail_col">메모</span></td>
			<td align="right"><span class="spanDetail_col">금액</span></td>
			<td align="right"><span class="spanDetail_col">결제</span></td>
			<td align="right"><span class="spanDetail_col">내용</span></td>
		</tr>  
		<c:forEach items="${BookCas}" var="dDAO">
			<tr>
				<td align="center"><span class="spanDetail_col2"><fmt:formatDate value="${dDAO.data_Date}"/></span></td>
				<td align="center"><span class="spanDetail_col2">${dDAO.data_Memo }</span></td>
				<td align="right"><span class="spanDetail_col2">${dDAO.data_Amount }</span></td>
				<td align="right"><span class="spanDetail_col2">${dDAO.pay_Value }</span></td>
				<td align="right"><span class="spanDetail_col2">${dDAO.ca_Value }</span></td>
			</tr>
		</c:forEach>  
	</table>

	<c:forEach var="p" begin="1" end="${pageCount}">
	&nbsp;<a href="detaileList.page.change?p=${p}">${p}</a>
	</c:forEach>

</div>	
	<div id="totalList">
		<c:choose>
			<c:when test="${nowPage < 6 }">
				&lt;&lt;
				
				<c:forEach var="page1" begin="${startPage}" end="${nowPage-1}">
					<a href="detailList?nowPage=${page1}">${page1 }</a>
				</c:forEach>
			</c:when>

			<c:when test="${endPage < 11 }">
			
				<a href="detailList?nowPage=1">&lt;&lt;</a>

				<c:forEach var="page2" begin="1" end="${nowPage-1}">
					<a href="detailList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>

			<c:when test="${endPage- nowPage <6  }">
			
				<a href="detailList?nowPage=1">&lt;&lt;</a>

				<c:forEach var="page2" begin="${endPage - 9}" end="${nowPage-1}">
					<a href="detailList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			
			<c:otherwise>
				<a href="detailList?nowPage=1">&lt;&lt;</a>
			
				<c:forEach var="page1" begin="${nowPage-4}" end="${nowPage-1}">
					<a href="detailList?nowPage=${page1}">${page1 }</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<span class="todoNowPage">${nowPage }</span>

		<c:choose>
			<c:when test="${endPage<=10 }">
				<c:forEach var="page2" begin="${nowPage+1}" end="${endPage}">
					<a href="detailList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			<c:when test="${nowPage< 6 }">
				<c:forEach var="page2" begin="${nowPage+1}" end="${10}">
					<a href="detailList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			<c:when test="${endPage- nowPage <6 }">
				<c:forEach var="page2" begin="${nowPage+1}" end="${endPage}">
					<a href="detailList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="page2" begin="${nowPage+1}" end="${nowPage+5}">
					<a href="detailList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${endPage-nowPage < 6 }">
				&gt;&gt;
			</c:when> 
			
			<c:otherwise> 
				<a href="detailList?nowPage=${endPage }">&gt;&gt;</a>
			</c:otherwise>
		</c:choose> 
		
	</div>

</body>
</html>