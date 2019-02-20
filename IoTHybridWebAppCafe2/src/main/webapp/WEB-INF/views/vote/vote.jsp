<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<br><br>
	<form action="vote.reg" name="voteRegForm"
		onsubmit="return voteRegCheck();">
		<table id="voteRegTbl">
			<tr>
				<td colspan="2" id="voteRegInputTd">
				<input id="voteRegInput"
					name="iv_title" maxlength="100" placeholder="����" autocomplete="off"></td>
			</tr>
			<tr>
				<td id="voteRegTATd" align="center"><textarea name="iv_items"
						id="voteRegTA" placeholder="�׸�(���ͷ� ����)" maxlength="500"></textarea></td>
				<td><input id="voteRegBtn" type="submit" value="���"></td>
			</tr>
		</table>
	</form>
	<form action="vote.do">
		<table id="voteArea">
			<tr>
				<td align="center" id="voteTitle" colspan="2">${v.iv_title }</td>
			</tr>
			<tr>
				<td class="voteTd1">�����</td>
				<td class="voteTd2">${v.iv_owner }</td>
			</tr>
			<tr>
				<td class="voteTd1">�� ��ǥ��</td>
				<td class="voteTd2">${v.iv_count }</td>
			</tr>
			<tr>
				<td colspan="2" class="voteTd3" align="center">
					<table id="voteArea2">
						<tr>
							<td class="va1" align="center">����</td>
							<td class="va2" align="center">����</td>
							<td class="va3" align="center">��ǥ��</td>
							<td class="va4" align="center">%</td>
						</tr>
						<c:forEach var="vi" items="${vis}">
							<tr>
								<td align="center"><input name="ivv_ivi_no" type="radio"
									value="${vi.ivi_no }"></td>
								<td>${vi.ivi_item }</td>
								<td align="center">${vi.ivi_count }</td>
								<td align="center"><fmt:formatNumber
										value="${vi.ivi_percent }" type="percent" /></td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="voteBtn"
					type="submit" value="��ǥ"></td>
			</tr>
		</table>
	</form>

</body>
</html>