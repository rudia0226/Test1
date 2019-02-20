<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

${Board_Id }

<div>
삭제하시겠습니까? <button onclick="location.href='boardDelete?Board_Id=${Board_Id }'" class="boardBtn">확인</button>
<button onclick="location.href='boardList'" class="boardBtn">취소</button>

</div>


</body>
</html>