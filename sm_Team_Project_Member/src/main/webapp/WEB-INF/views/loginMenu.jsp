<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<link  rel="stylesheet"  href="resources/css/menu.css">
</head>
<body>

<div id="menu_panel">
<c:choose>
	<c:when test="${loginMember != null}"> 
	
	<header role="banner">
  <nav class="nav" role="navigation">
    <ul class="nav__list">
    
        <li><a href="calendar">CALENDAR&nbsp;&nbsp;<img src="resources/icon/menuicon(4).png"></a></li>
        <li><a href="detailList">DETAILS & SEARCH&nbsp;&nbsp;<img src="resources/icon/menuicon(5).png"></a></li>
        <li><a href="chart.go">CHART&nbsp;&nbsp;<img src="resources/icon/menuicon(3).png"></a></li>
        <li><a href="todoList">TO DO LIST&nbsp;&nbsp;<img src="resources/icon/menuicon(2).png"></a></li>
        <li><a href="boardList">MEMO&nbsp;&nbsp;<img src="resources/icon/menuicon(1).png"></a></li>
      
      <li>
        <input id="group-1" type="checkbox" hidden />
        <label for="group-1">SETTING&nbsp;&nbsp;<img src="resources/icon/menuicon(6).png">&nbsp;&nbsp;&nbsp;</label>
        <ul class="group-list">
          <li>
            <li><a href="caedit.go">CATEGORY &emsp;&emsp;</a></li>
            <li><a href="member.infoView">INFORMATION &emsp;&emsp;</a></li>
          </li>
        </ul> 
      </li>
      
     
    </ul>
    
  </nav>
  <footer>
    <ul class="soc-media">
      <li><a href="logout"  target="_blank">LOGOUT</a></li>
    </ul> 
  </footer> 
</header>
	
	
	
<!-- 	
	<button class="panelbtn" onclick="location.href='boardList'">메모 보기</button>
	<button class="panelbtn" onclick="location.href='todoList'">To do List</button>
	<button class="panelbtn" onclick="location.href='chart.go'">Chart</button>
	<button class="panelbtn" onclick="location.href='calendar'">Calendar</button>
	<button class="panelbtn" onclick="location.href='detailList'">상세보기 설정</button>
	<button class="panelbtn" onclick="location.href='member.infoView'">정보보기</button>
	<button class="panelbtn" onclick="location.href='caedit.go'">설정</button>
	<button class="panelbtn" onclick="location.href='logout'">로그아웃</button>  -->
	
	</c:when>

</c:choose> 
</div>
</body>
</html>
