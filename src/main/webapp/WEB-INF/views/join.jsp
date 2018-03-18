<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 가입</title>
</head>

<body>
<div class="head">
<br>
&emsp;회원 가입
<br><br>
</div>

<br><br>
<div class="body">
<form id="form1" method="post">
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
			<td>비밀번호 확인</td>
		</tr>
		<tr>
			<td><input type="password" name="userPwconfirm" style="width: 200px"></td>
		</tr>
		<tr>
			<td>이름</td>
		</tr>
		<tr>
			<td><input type="text" name="userName" style="width: 200px"></td>
		</tr>
		<tr>
			<td>이메일</td>
		</tr>
		<tr>
			<td><input type="text" name="email" style="width: 200px"></td>
		</tr>
		<tr>
			<td><button class="bodybutton" type="submit" onClick="user_join();">회원 가입</button>
			<button class="bodybutton" type="button" onclick="location.href='/'">취소</button></td>
		</tr>
	</table>
	<script>
		function user_join()
		{
			alert("회원 가입을 축하합니다!");
		}
	</script>
</form>
</div>
<br>
</body>
</html>