<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<label  class="h1Login">로그인</label>
	<div id="r">${r }</div>
		<table>
		<tr>
			<td>
				<form action="member.loginDo"  method="post">
					<table>
						<tr>
							<td>
								<label id="labelLogin">ID&nbsp;&nbsp;</label> 
								<input class="inputLogin" 	 name="User_Email" placeholder="ID 입력 "  value="${cookie.lastLoginId.value }" > 
							<td>
						</tr>
						<tr>
							<td>
								<label id="labelLogin">PW</label>
								<input class="inputLogin" type="password" name="User_Pw" 	placeholder="PW 입력">
							</td>
						</tr>
						<tr><td></td></tr>
						<tr><td></td></tr>
						<tr>
							<td align="center">
								<button class="btnLogin">로그인</button>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td >
			<table>
				<tr>
					<td align="center">
				<button class="btnLogin"  onclick="location.href='member.returnGo'">돌아가기</button>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</body>
</html>