<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<br><br><br> 
	<marquee style="width: 110px;" behavior="alternate">
		<marquee style="height: 60px;" direction="up" behavior="alternate">
			<h2>ȸ������</h2>
		</marquee>
	</marquee>
	<br><br><br>
	<form action="join.do"
		method="post" enctype="multipart/form-data" 
	name="joinForm" onsubmit="return joinCheck();">
		<table id="joinTbl">
			<tr>
				<td class="joinTblTd1">id</td>
				<td><input id="joinID" name="im_id" maxlength="10" autofocus="autofocus" class="joinInputId" autocomplete="off">
				<span id="joinIDResult">ID �Է�</span></td>
			</tr>
			<tr>
				<td class="joinTblTd1">pw</td>
				<td><input name="im_pw" type="password" maxlength="10" class="joinInput" placeholder="���� ��ҹ���, ���� ����"></td>
			</tr>
			<tr>
				<td class="joinTblTd1">pwȮ��</td>
				<td><input name="im_pwChk" type="password" maxlength="10" class="joinInput"></td>
			</tr>
			<tr>
				<td class="joinTblTd1">�̸�</td>
				<td><input name="im_name" maxlength="10" class="joinInput" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="joinTblTd1">�ּ�</td>
				<td>
					<input readonly="readonly" id="a1" name="im_addr1" maxlength="5" class="joinAddrInput" autocomplete="off" placeholder="�����ȣ">
					<span id="addrSearchBtn">�����ȣ�˻�</span><br>
					<input readonly="readonly" id="a2" name="im_addr2" maxlength="100" class="joinInput" autocomplete="off" placeholder="�ּ�"><br>
					<input name="im_addr3" maxlength="100" class="joinInput" autocomplete="off" placeholder="���ּ�">
				</td> 
			</tr>
			<tr>
				<td class="joinTblTd1">����</td>
				<td><input name="im_img" type="file"></td>
			</tr>
			<tr>
				<td align="center">
					<input id="joinBtn" type="submit" value="����">
					<button   onclick="location.href='member.loginGo'">���ư���</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>



