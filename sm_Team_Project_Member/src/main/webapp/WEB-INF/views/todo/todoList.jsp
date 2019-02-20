<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 	$(function(){
		$("#todoBtn").click(function(){
			$(".todoInput").toggle();
		});
		
	/* 	$("#addTodo").click(function(){
			$.ajax({
				type: "post",
				url: "todoWrite",
				data: {"nowPage": '${nowPage }' , "Todo_Title": $(".Todo_Title").val()},
				success: function(data){
					 $("#todoOuter").html(data);
					alert("글 입력");
				}
			});		
		}); */
		
	}); 
</script>

</head>
<body>

<div id="todoOuter" align="center">

	<table class="todoTable">
		<tr>
			<!-- <td>No</td> -->
			<td  class="todoText">Memo</td>
			<td></td>
		</tr>
		
		<c:forEach var ="todo" items="${todoList }">
			<tr>
				<%-- <td>${todo.getTodo_Id() }</td> --%>
				<td  class="todotitleTD1">${todo.getTodo_Title() }</td>
				<td class="todotitleTD2"><button onclick="location.href='todoDelete?Todo_Id=${todo.getTodo_Id()}&nowPage=${nowPage }'" 
										class="boardBtn3">DONE</button></td>
			</tr> 
		</c:forEach>
	</table> 

	<div class="todoPage">
	
		<c:choose>
			<c:when test="${nowPage < 6 }">
				&lt;&lt;
				
				<c:forEach var="page1" begin="${startPage}" end="${nowPage-1}">
					<a href="todoList?nowPage=${page1}">${page1 }</a>
				</c:forEach>
			</c:when>

			<c:when test="${endPage < 11 }"> 
			
				<a href="todoList?nowPage=1">&lt;&lt;</a>

				<c:forEach var="page2" begin="1" end="${nowPage-1}">
					<a href="todoList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>

			<c:when test="${endPage- nowPage <6  }">
			
				<a href="todoList?nowPage=1">&lt;&lt;</a>

				<c:forEach var="page2" begin="${endPage - 9}" end="${nowPage-1}">
					<a href="todoList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			
			<c:otherwise>
				<a href="todoList?nowPage=1">&lt;&lt;</a>
			
				<c:forEach var="page1" begin="${nowPage-4}" end="${nowPage-1}">
					<a href="todoList?nowPage=${page1}">${page1 }</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<span class="todoNowPage">${nowPage }</span>

		<c:choose>
			<c:when test="${endPage<=10 }">
				<c:forEach var="page2" begin="${nowPage+1}" end="${endPage}">
					<a href="todoList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			<c:when test="${nowPage< 6 }">
				<c:forEach var="page2" begin="${nowPage+1}" end="${10}">
					<a href="todoList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			<c:when test="${endPage- nowPage <6 }">
				<c:forEach var="page2" begin="${nowPage+1}" end="${endPage}">
					<a href="todoList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="page2" begin="${nowPage+1}" end="${nowPage+5}">
					<a href="todoList?nowPage=${page2}">${page2 }</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${endPage-nowPage < 6 }">
				&gt;&gt;
			</c:when>
			
			<c:otherwise>
				<a href="todoList?nowPage=${endPage }">&gt;&gt;</a>
			</c:otherwise>
		</c:choose>
		
	</div>
	
	<div>
	<form action="todoWrite" method="post">
		<input type="hidden" value="${nowPage }" name="nowPage">
		<p>
		<input type="button" id="todoBtn" class="boardBtn4" value="메모추가">
		<div class="todoInput">
				<input type="text" name="Todo_Title" class="Todo_Title" size="30" maxlength="30">
				<button id="addTodo" class="boardBtn4">추가</button>
		</div>
	</form>
	</div>

</div>

</body>
</html>