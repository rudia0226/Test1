<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div  class="boardArea2">
<button onclick="location.href='boardWrite'" class="boardBtn" >메모입력</button>
<p>
<div  class="boardArea1">

	<c:forEach var ="board" items="${boardList }">
		<div class="boardArea">
			
			<span class="boardListTitle">${board.getBoard_Title() }</span>
			<hr color="#ECF0F1"  width="90%"  size="1px" >
			 
			<span class="boardUserName">${board.getUser_Email() } </span><br/>
			<div class="boardContentsList" >${board.getBoard_Content() }</div> 
			<br/> 
			<form action="boardEditView" method="post">
				<input type="hidden" name="Board_Id" value="${board.getBoard_Id()}">
				<input type="hidden" name="Board_Title" value="${board.getBoard_Title()}">
				<input type="hidden" name="User_Email" value="${board.getUser_Email()}">
				<input type="hidden" name="Board_Content"   value="${board.getBoard_Content()}">
<%-- 				<input type="hidden" name="Book_No" value="${board.getBook_No()}">
 --%>				
				<div class="boardBottom">
					<button class="boardBtn1">Edit</button>
					<input type= "button" onclick="location.href='boardDeleteView?Board_Id=${board.getBoard_Id()}'" value="Delete" class="boardBtn1">
				</div>

			</form>

		</div>
		
	</c:forEach>
	
</div>
</div>
</body>
</html>