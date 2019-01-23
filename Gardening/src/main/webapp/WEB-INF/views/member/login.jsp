<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<form action="member.login"  method="post">
					<label id="labelLogin">ID</label> 
					<input class="inputLogin" 	 name="m_id" placeholder="ID 입력 "  value="${cookie.lastLoginId.value }" > 
					<label id="labelLogin">PW</label>
					<input class="inputLogin" type="password" name="m_pw" 	placeholder="PW 입력">
					<button class="btnLogin">로그인</button>
				</form>
			</td>
			<td>
				<button class="btnLogin"  onclick="goJoin();">회원가입</button>
			</td>
		</tr>
	</table>
</body>
</html>