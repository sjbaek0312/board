<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="false" %>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>admin</title>
</head>
<body>
<div class="head">
<br>
&emsp;관리자 모드&emsp;&emsp;
<button class="headbutton" type="button" onClick="location.href='/'">뒤로</button>
<br><br>
</div>

<br><br>
<div class="body">
	<table style="width: 550px; margin: auto; text-align: center;">
		<tr>
		<td>
		<button class="headbutton" type=button onclick="location.href='/admin/posts'">게시물 관리</button>
		<button class="headbutton" type=button onclick="location.href='/admin/users'">회원 관리</button>
	</table>
</div>

</body>
</html>
