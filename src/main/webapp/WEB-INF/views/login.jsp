<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>로그인</title>
</head>

<body>
<div class="head">
<br>
&emsp;게시판
<br><br>
</div>

<br><br>
<div class="body">
<form method="post" action="/user/loginpost">
	<table style="width: 550px; margin: auto; text-align: center;">
		<tr>
		<td>아이디</td>
		</tr>
		<tr>
		<td><input type="text" name="userId" style="width: 200px"></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		</tr>
		<tr>
		<td><input type="password" name="userPw" style="width: 200px"></td>
		</tr>
		<tr>
		<td><button class="bodybutton" type="submit">로그인</button><button class="bodybutton" type="button" onclick="location.href='/'">취소</button></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>