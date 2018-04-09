<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script src="<%=request.getContextPath() %>/resources/js/checkFunctions.js"></script>
</head>

<body>
<div class="head">
	<br>
	&emsp;회원 가입
	<br><br>
</div>

<br><br>
<div class="body">
<form id="joinform" method="post" onsubmit="return validateJoinform()">
	<table style="width: 550px; margin: auto; text-align: center;">
		<tr>
			<td>아이디</td>
		</tr>
		<tr>
			<td>(4자 ~ 20자의 영문, 숫자 또는 영문과 숫자 조합, _사용 가능)</td>
		</tr>
		<tr>
			<td><input type="text" id="userId" name="userId" style="width: 200px"></td>
		</tr>
		<tr>
			<td>비밀번호 (20자 이내)</td>
		</tr>
		<tr>
			<td><input type="password" id="userPw" name="userPw" style="width: 200px"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
		</tr>
		<tr>
			<td><input type="password" id="userPwconfirm" name="userPwconfirm" style="width: 200px"></td>
		</tr>
		<tr>
			<td>이름 (20자 이내)</td>
		</tr>
		<tr>
			<td><input type="text" id="userName" name="userName" style="width: 200px"></td>
		</tr>
		<tr>
			<td>이메일</td>
		</tr>
		<tr>
			<td><input type="text" id="email" name="email" style="width: 200px"></td>
		</tr>
		<tr>
			<td><button class="bodybutton" type="submit">회원 가입</button>
			<button class="bodybutton" type="button" onclick="location.href='/'">취소</button></td>
		</tr>
	</table>
</form>
</div>
<br>
</body>
</html>