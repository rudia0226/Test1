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
	<marquee style="width: 150px;" behavior="alternate">
		<marquee style="height: 60px;" direction="up" behavior="alternate">
			<h2>ȸ����������</h2>
		</marquee>
	</marquee>
	<br><br><br>
	<form action="member.update.do"
		method="post" enctype="multipart/form-data" 
	name="updateForm" onsubmit="return updateCheck();">
		<table id="joinTbl">
			<tr>
				<td class="joinTblTd1">id</td>
				<td><input readonly="readonly" value="${sessionScope.loginMember.im_id }" name="im_id" maxlength="10" class="joinInput" autocomplete="off"></td>
			</tr> 
			<tr>
				<td class="joinTblTd1">pw</td>
				<td><input value="${sessionScope.loginMember.im_pw }" name="im_pw" type="password" maxlength="10" class="joinInput" placeholder="���� ��ҹ���, ���� ����"></td>
			</tr>
			<tr>
				<td class="joinTblTd1">pwȮ��</td>
				<td><input value="${sessionScope.loginMember.im_pw }" name="im_pwChk" type="password" maxlength="10" class="joinInput"></td>
			</tr>
			<tr>
				<td class="joinTblTd1">�̸�</td>
				<td><input value="${sessionScope.loginMember.im_name }" name="im_name" maxlength="10" class="joinInput" autocomplete="off"></td>
			</tr>
			<tr>
				<td class="joinTblTd1">�ּ�</td>
				<td>
					<input readonly="readonly" id="a1" value="${sessionScope.loginMember.im_addr1 }" name="im_addr1" maxlength="5" class="joinAddrInput" autocomplete="off" placeholder="�����ȣ"><span id="addrSearchBtn">�����ȣ�˻�</span><br>
					<input readonly="readonly" id="a2" value="${sessionScope.loginMember.im_addr2 }" name="im_addr2" maxlength="100" class="joinInput" autocomplete="off" placeholder="�ּ�"><br>
					<input value="${sessionScope.loginMember.im_addr3 }" name="im_addr3" maxlength="100" class="joinInput" autocomplete="off" placeholder="���ּ�">
				</td> 
			</tr>
			<tr>
				<td class="joinTblTd1">����</td>
				<td>
					<img class="loginOKImg" src="resources/etc/${sessionScope.loginMember.im_img }">&nbsp;&nbsp;
					<input name="im_img" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input id="joinBtn" type="submit" value="����">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>