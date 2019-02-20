<%@page import="com.sm.household.Member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#boardContents').on('keyup',function(){
		  var maxlen = $(this).attr('maxlength');
		  
		  fnChkByte();
	});
});
</script>
</head>
<body>

<% Member loginMember = (Member)session.getAttribute("loginMember"); %>
<!-- when절: 글쓰기/ otherwise: 글 수정 -->
<div class="BoardDiv">
	
	<c:choose>
		<c:when test="${board.getBoard_Id() eq null}">
			<form action="boardWrite" method="post">
				<input type="hidden" name="User_Email" value="<%=loginMember.getUser_Email()%>">
				<label  class="boardWriteViewLabel">New Memo</label><p> 
				<label class="boardWriteViewLabel2">Title: </label> <input type="text" name="Board_Title" maxlength="30"  class="boardWriteViewInput"><p>	
				<textarea name="Board_Content" id="boardContents" cols="35" rows="8" 
					maxlength="180"></textarea>
				
				<div id="boardContentsMsg">0/180 Byte</div><p>
				
				<button class="boardBtn2">입력</button>
				<input type="button" class="boardBtn2" onclick="location.href='boardList'" value="취소">
			</form> 
		</c:when> 

		<c:otherwise>
			<form action="boardEdit" method="post">
				<input type="hidden" name="User_Email" value="<%=loginMember.getUser_Email() %>">
				<input type="hidden" name="Board_Id" value="${board.getBoard_Id() }">
				<h3>수정</h3>
				<label class="boardWriteViewLabel2">Title: </label>  <input type="text" name="Board_Title" value="${board.getBoard_Title() }" maxlength="30"   class="boardWriteViewInput"><p>	
				<textarea name="Board_Content"  id="boardContents"  cols="35" rows="8"  
					maxlength="180">${board.getBoard_Content() }</textarea>
				 
				<div id="boardContentsMsg">0/180 Bytes</div><p>
				<button class="boardBtn2">입력</button> 
				<input  type="button"   class="boardBtn2"   onclick="location.href='boardList'" value="취소">
			</form>
		</c:otherwise> 
	</c:choose> 
	 
</div>

</body>
</html>