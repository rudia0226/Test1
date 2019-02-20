<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사물인터넷기반 하이브리드 웹앱 개발자 양성 과정 카페</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/member.css">
<link rel="stylesheet" href="resources/css/sns.css">
<link rel="stylesheet" href="resources/css/community.css">
<link rel="stylesheet" href="resources/css/dataroom.css">
<link rel="stylesheet" href="resources/css/vote.css">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/summonWeather.js"></script>
<script type="text/javascript" src="resources/js/summonMenu.js"></script>
<script type="text/javascript" src="resources/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function(){
		connectWeatherSummonEvent();
		connectMenuSummonEvent();
		connectAddressFindEvent();
		connectIdCheckEvent();
	});
</script>
</head>
<body>
	<table id="weather">
		<tr>
			<td rowspan="2" style="width: 42px;" align="center"><img
				id="wtImg" src=""></td>
			<td id="wt"></td>
		</tr>
		<tr>
			<td id="temp"></td>
		</tr>
	</table>
	<table id="siteTitleArea">
		<tr>
			<td align="center" id="siteMenuArea">
				<table id="siteMenuArea2">
					<tr>
						<td><a href="dataroom.go" class="siteMenu">자료실</a> <c:if
								test="${sessionScope.loginMember != null }">
								<a href="vote.go" class="siteMenu">투표</a>
								<a href="community.go" class="siteMenu">커뮤니티</a>
							</c:if></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table id="siteTitleArea2">
					<tr>
						<td id="siteTitleTd"><a id="siteTitle" href="home.go">사물인터넷기반
								하이브리드 웹앱 개발자 양성 과정 카페 <span
								style="color: #A5D6A7; font-size: 13pt;">v2.0</span>
						</a>
							<div id="siteURL">http://172.16.1.100:88</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div id="siteLoginArea">
		<jsp:include page="${loginPage }"></jsp:include>
	</div>
	<table id="siteContentArea">
		<tr>
			<td align="center">
				<table id="siteContentArea2">
					<tr>
						<td align="center"><jsp:include
								page="${sessionScope.contentPage }"></jsp:include></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table id="msgArea">
		<tr>
			<td>
				<div style="overflow: auto; height: 650px;">
					<c:forEach var="m" items="${msgs }">
						<table class="msg">
							<tr>
								<td class="msgFrom">${m.im_from }</td>
								<td class="msgFrom" align="right"
									onclick="deleteMsg(${m.im_no});" style="cursor: pointer;">X</td>
							</tr>
							<tr>
								<td class="msgDate" align="right" colspan="2"><fmt:formatDate
										value="${m.im_date }" type="both" dateStyle="short"
										timeStyle="short" /></td>
							</tr>
							<tr>
								<td colspan="2" onclick="resendMsg('${m.im_from }')"
									style="cursor: pointer;"><br>${m.im_txt }</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>
