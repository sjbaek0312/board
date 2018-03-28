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
	<title>Home</title>
</head>
<body>
<div class="head">
<br>
&emsp;게시판
<br><br>
</div>

<br><br>
<div class="body">
	<table style="width: 550px; margin: auto; text-align: center;">
		<tr>
		<td>
		<button class="headbutton" type=button onclick="location.href='user/login'">로그인</button>
		<button class="headbutton" type=button onclick="location.href='user/join'">회원가입</button>
	</table>
</div>



</body>
</html>
