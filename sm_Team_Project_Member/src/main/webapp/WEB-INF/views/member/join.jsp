<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>
<style type="text/css">
	.has-error {
		background-color: red;
	}
	.has-success {
		background-color: blue;
	}
</style>
</head>
<body>
	<h1  class="joinH">회원가입</h1> 
	<form action="member.joinDo"  onsubmit="return  joinCheck();"  method="post"  name="joinForm">
<table  id="joinTbl">
	<tr>
		<td class="joinTblTd1">Email</td>
		<td><input  id="joinID"  name="User_Email"  maxlength="30"  autofocus="autofocus"  class="joinInputId"  ></td>
		<td><input  type="button"  class="checkBtn"  value="중복확인" id="idCheck" ></td>
	</tr>
	<tr>
		<td  class="joinTblTd1">Pw</td>
		<td><input id="joinPW"  name="User_Pw"  type="password"  maxlength="4"  class="joinInput"  placeholder="숫자 4자리"></td>
	</tr>
	<tr>
		<td  class="joinTblTd1">PwChk</td>
		<td><input  name="User_PwChk"  type="password"  maxlength="4"  class="joinInput"  placeholder="숫자 4자리"></td>
	</tr>
	<tr>
		<td class="joinTblTd1">Name</td>
		<td><input name="User_Name"   maxlength="10" class="joinInput" ></td>
	</tr>
	<tr>
		<td class="joinTblTd1">Birth</td>
		<td><input name="User_Birth"   maxlength="6" class="joinInput" placeholder="주민번호 앞 6자리를 입력" ></td>
	</tr>
	<tr>
		<td class="joinTblTd1">Goal</td>
		<td>
			<input  name="Goal_Amount"  maxlength="10"  class="joinInput" placeholder="목표금액을 입력(단위: 원)"  > 
		</td>
	</tr>
	<tr>
		<td class="joinTblTd1">Sex</td>
		<td>
			<select  name="User_Sex"  class="joinSelect">
				<option  value=""  selected="selected">선택</option>
				<option   value="m">남자</option>
				<option   value="f">여자</option>
			</select>
		</td>
	</tr>
	<tr >
		<td  colspan="3"  align="center">
			<input   id="joinBtn"  type="submit"   value="회원가입">
		</td>
	</tr>
</table>
	</form> 
<table>
	<tr  align="center">
		<td>
			<button  onclick="location.href='member.returnGo'"  class="joinBtn2">돌아가기</button>
		</td>
	</tr>
</table>
</body>
</html>