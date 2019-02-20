<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.loginMember != null }">
		<form action="sns.write" name="snsWriteForm" onsubmit="return snsWriteCheck();">
			<table id="snsWriteTbl">
				<tr>
					<td id="snsWriteTATd" align="center"><textarea name="is_txt"
							autofocus="autofocus" id="snsWriteTA" placeholder="말"
							maxlength="150"></textarea></td>
					<td><input id="snsWriteBtn" type="submit" value="쓰기">
					</td>
				</tr>		
			</table>
		</form>
	</c:if>
	<table id="snsArea">
		<tr>
			<td align="center"></td>
			<td align="center">
				<c:forEach var="sm" items="${snsMsgs }">
					<table class="snsMsg${sm.is_color }">
						<tr>
							<td rowspan="5" class="snsImgTd" valign="top" align="center">
								<img class="snsImg" src="resources/etc/${sm.im_img }">
							</td>
							<td class="snsOwner${sm.is_color }">${sm.is_owner }</td>
						</tr>
						<tr>
							<td align="right" style="font-weight:900;">
								<fmt:formatDate value="${sm.is_date }" type="both" dateStyle="long" timeStyle="short"/>
							&nbsp;&nbsp;</td> 
						</tr>
						<tr>
							<td class="snsTxt">${sm.is_txt }</td>
						</tr>
						<tr>
							<td class="snsCmtArea">
								<c:forEach var="r" items="${sm.is_repls }">
									<div class="snsCmt">
										<span class="snsOwner${sm.is_color }" style="font-size: 10pt; font-weight: 900;">${r.isr_owner }</span> 
										- ${r.isr_txt } 
										(<fmt:formatDate value="${r.isr_date }" type="both" dateStyle="short" timeStyle="short"/>)
										<c:if test="${r.isr_owner == sessionScope.loginMember.im_id }">
											<button onclick="deleteRepl(${r.isr_no});" class="snsCmtBtn">삭제</button>
										</c:if>
										<br>
									</div>
								</c:forEach>
								<c:if test="${sessionScope.loginMember != null }">
									<div class="snsCmt">
										<form onsubmit="return writeReplCheck(this);" action="sns.repl.write"> 
											<span class="snsOwner${sm.is_color }" style="font-size: 10pt; font-weight: 900;">${sessionScope.loginMember.im_id }</span>&nbsp;
											<input autocomplete="no" type="hidden" name="isr_is_no" value="${sm.is_no }">
											<input class="writeReplInput" name="isr_txt" maxlength="100" placeholder="리플 내용">
											<input class="writeReplBtn" type="submit" value="쓰기">
										</form>
									</div>
								</c:if>
							</td>
						</tr>
						<tr>
							<td align="right">
								<c:if test="${sm.is_owner == sessionScope.loginMember.im_id }">
									<button onclick="updateSNS(${sm.is_no});" class="snsBtn${sm.is_color }">수정</button>
									<button onclick="deleteSNS(${sm.is_no});" class="snsBtn${sm.is_color }">삭제</button>
								</c:if>
								&nbsp;
							</td>
						</tr>
					</table> 
				</c:forEach>
			</td>
			<td align="center"></td>
		</tr>
	</table>


</body>
</html>