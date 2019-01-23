<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Page</title>

</head>
<body> <!-- return true : 넘어감  false : 참일때만 넘어감 -->
<form name="joinForm"  method="post"  action="member.join" onsubmit="return joinCheck();">
	<table>
		<tr>
			<td colspan="2"  align="center"  id="jTitle"><h2>회원가입</h2></td>
		</tr>
		<tr>
			<td  class="jlabel">ID</td>
			<td class="tdInput"><input  id="joinID"  name="m_id"  type="text"  class="jInput"  maxlength="8"  placeholder="필수, 최소 8글자"></td>
		</tr>
		<tr>
			<td   class="jlabel">PW</td>
			<td class="tdInput"><input  name="m_pw"  type="password"  class="jInput"  placeholder="필수, 최소 4글자, 소문자/숫자조합"></td>
		</tr>
		<tr>
			<td   class="jlabel">PW확인</td>
			<td class="tdInput"><input  name="m_pwchk"   type="password"  class="jInput"   placeholder="필수, 최소 4글자, 소문자/숫자조합"></td>
		</tr>
		<tr>
			<td   class="jlabel">NAME</td>
			<td class="tdInput"><input    name="m_name"   type="text"  class="jInput" ></td>
		</tr>
		<tr>
			<td   class="jlabel">BIRTH</td>
			<td   class="tdInput">
				<select class="jInputBirth"  name="m_y" >
					<c:forEach  var="y"  begin="${curYear - 40 }"  end="${curYear }">  <!-- 현재 날짜 쓸 생각으로.. -->
						<option>${y }</option>
					</c:forEach>
				</select>년
				<select class="jInputBirth"   name="m_m" >
					<c:forEach  var="m"  begin="1"  end="12">
						<option>${m }</option>
					</c:forEach>
				</select>월 
				<select class="jInputBirth"   name="m_d" >
					<c:forEach  var="d"  begin="1"  end="31">
						<option>${d }</option>
					</c:forEach>
				</select>일
			</td>
		</tr>
		<tr>
			<td colspan="2"><br><br></td>
		</tr>
		<tr>
			<td colspan="2" align="center" >
			<input  type="image"   class="imgBtnJoin"  src="resources/img/btn.png"  onmouseover="this.src='resources/img/btn01.png'"  onmouseout="this.src='resources/img/btn.png'" >
			</td>
		</tr>
	</table>
</form>
</body>
</html>