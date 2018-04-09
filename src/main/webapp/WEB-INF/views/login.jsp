<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
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
<form method="post" onsubmit="loginFailed();">
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
<script type="text/javascript">
function loginFailed()
{
	alert();
//	alert("로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
	location.href="/user/login";
}
</script>
</body>
</html>