<%@page import="com.sm.household.Member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div  class="container">
<form action="member.update.do"   onsubmit="return  updateCheck();"  method="post"  name="updateForm">
<table>
	<tr>
		<td  class="updateLabel">
			이메일
		</td>
		<td  class="updateLabel"> 
		${loginMember.user_Email}
		</td>
	</tr>
	<tr>
		<td class="updateLabel">
			이름
		</td>
		<td>
			<input  class="updateInput"  name="User_Name"   maxlength="10">
		</td>
	</tr>
	<tr>
		<td class="updateLabel">
			비밀번호
		</td>
		<td>
			<input  class="updateInput"   name="User_Pw"     type="password"   placeholder="숫자 4자리">
		</td>
	</tr>
	<tr>
		<td class="updateLabel">
			비밀번호확인
		</td>
		<td>
			<input  class="updateInput"  name="User_PwChk"    type="password"   placeholder="숫자 4자리">
		</td>
	</tr>
	<tr>
		<td class="updateLabel">
			생년월일
		</td>
		<td>
			<input  class="updateInput" name="User_Birth"   maxlength="6" placeholder="주민번호 앞 6자리를 입력"  >
		</td>
	</tr>
	<tr>
		<td  colspan="2"  align="center">
			<input type="submit"  id="updateBtn"  class="updateBTN"  value="확인"> 
		</td>
	</tr>
</table> 
</form>
</div>
</body> 
</html>