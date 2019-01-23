<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<label  id="noticeTitle">
 Hello, [ ${sessionScope.loginMember.m_id } ]  <!-- 세션에 있는 값을 꺼낼 땐 sessionScope를 이용 -->
</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a id="labelTitle"  href="">About Us</a>  &nbsp;&nbsp;&nbsp;
<a id="labelTitle"  href="">Gardens</a> &nbsp;&nbsp;&nbsp;
<a id="labelTitle"  href="board.go.trees">Trees</a> &nbsp;&nbsp;&nbsp;
<a id="labelTitle" href="">Flowers</a> &nbsp;&nbsp;&nbsp;
<a id="labelTitle"  href="board.go.sns">SNS</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<button  onclick="logout();"   class="btnLogin">LogOut</button>
<button  class="btnLogin">MyPage</button>
</body>
</html>