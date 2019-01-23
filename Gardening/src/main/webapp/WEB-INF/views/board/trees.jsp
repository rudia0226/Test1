<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/trees</title>

<style type="text/css">
	img {
	max-width: 150px;
}
</style>
</head>
<body>
 <%-- <img alt="" src="resources/img/${fff}">  --%>
<h1>Tree</h1>
<div  id="treeContainer">
<form action="board.reg"  method="post"  enctype="multipart/form-data">
	<label  id="treeLabel">EName  </label><input  name="n"  id="treeInput"><p>
	<label  id="treeLabel">SName  </label><textarea name="p"  class="mRegInput" id="treeInput"  style="resize:none;"></textarea><!-- <input  name="p"  id="treeInput"> --><p>
	<label  id="treeLabel">Picture  </label><label  id="treeInputBtn">Add File<input name="photo"  type="file"  id="treeInputPhoto"></label><p>
	<button id="treeBtn" >등록</button>
</form>
<p><hr><p>
</div>
<div  id="treeContainer">
<%-- 
<c:forEach  var="b"  items="${boards }">
	<img src="resources/img/${b.p_img} ">
	${b.s_name} - ${b.e_name} <p>
</c:forEach>
 --%> 
 <form action="board.search">
 	<input  name="s_name"   id="treeInput">
 	<button id ="treeBtn">제목 검색</button>
 </form>
<p><hr><p>
 
<c:forEach var="b"  items="${boards }">
	<table>
		<tr  align="center"  class="treesTableTRTitle" >
			<td>${b.s_name}</td>
		</tr>
		<tr   class="treesTableTRContent"	align="center">
			<td><img src="resources/img/${b.p_img} "  class="treesImg"></td>
		</tr>
		<tr   class="treesTableTRContent"  align="center">
			<td>${b.e_name}</td>
		</tr>
	</table>
</c:forEach>

<p><hr><p>

<c:forEach  var="p"  begin="1"  end="${pageCount }">
	&nbsp;<a  href="board.page.change?page=${p }">${p }</a>&nbsp;
</c:forEach>

</div>
<p><p>
</body>
</html>