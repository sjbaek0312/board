<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 수정</title>
<script src="<%=request.getContextPath() %>/resources/js/checkFunctions.js"></script>
</head>

<body>
<div class="head">
	<br>
	&emsp;정보 수정
	<br><br>
</div>

<br><br>
<div class="body">
	<form id="modifyform" method="post" onsubmit="return validateModifyform()">
		<table style="width: 550px; margin: auto; text-align: center;">
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" id="userPw" name="userPw" style="width: 200px" value="${login.userPw }"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
			</tr>
			<tr>
				<td><input type="password" id="userPwconfirm" name="userPwconfirm" style="width: 200px" value="${login.userPw }"></td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" id="userName" name="userName" style="width: 200px" value="${login.userName }"></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="text" id="email" name="email" style="width: 200px" value="${login.email }"></td>
			</tr>
			<tr>
				<td><button class="bodybutton" type="submit">수정</button>
				<button class="bodybutton" type="button" onclick="location.href='/post/readAll'">취소</button>
				<button class="bodybutton" type="button" onClick="location.href='/user/withdrawconfirm'">회원 즉시 탈퇴</button>
				<button class="bodybutton" type="button" onClick="location.href='/user/withdrawconfirm30'">회원 일반 탈퇴</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>