<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<form id="joinform" method="post" onsubmit="return user_join()">
	<table style="width: 550px; margin: auto; text-align: center;">
		<tr>
			<td>user_id</td>
		</tr>
		<tr>
			<td>(4자 ~ 20자의 영문, 숫자 또는 영문과 숫자 조합, _사용 가능)</td>
		</tr>
		<tr>
			<td><input type="text" id="userId" name="userId" style="width: 200px"></td>
		</tr>
		<tr>
			<td>user_pw (20자 이내)</td>
		</tr>
		<tr>
			<td><input type="password" id="userPw" name="userPw" style="width: 200px"></td>
		</tr>
		<tr>
			<td>user_name (20자 이내)</td>
		</tr>
		<tr>
			<td><input type="text" id="userName" name="userName" style="width: 200px"></td>
		</tr>
		<tr>
			<td>email</td>
		</tr>
		<tr>
			<td><input type="text" id="email" name="email" style="width: 200px"></td>
		</tr>
		<tr>
			<td>user_flag</td>
		</tr>
		<tr>
			<td><input type="text" id="userFlag" name="userFlag" style="width: 200px"></td>
		</tr>
		<tr>
			<td><button class="bodybutton" type="submit">회원 가입</button>
			<button class="bodybutton" type="button" onclick="location.href='/admin/users'">취소</button></td>
		</tr>
	</table>
	<script type="text/javascript">
		function user_join()
		{
			var reg_userId = /^[0-9a-zA-Z_]{4,20}$/;
			var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var userId = document.getElementById("userId").value;
			var userPw = document.getElementById("userPw").value;
			var userName = document.getElementById("userName").value;
			var email = document.getElementById("email").value;
			var userFlag = document.getElementById("userFlag").value;
			
			// id check
			if (userId.length < 1)
			{
				alert('아이디를 입력하세요.');
				return false;
			}
			else if (userId.length < 4)
			{
				alert('4자 이상의 아이디를 입력하세요.');
				return false;
			}
			if (! reg_userId.test(userId))
			{
				alert('조건에 맞는 아이디를 입력하세요.');
				return false;
			}		
			// pw check
			if (userPw.length < 1)
			{
				alert('비밀번호를 입력하세요.');
				return false;
			}
			// name check
			if (userName.length < 1)
			{
				alert("이름을 입력하세요.");
				return false;
			}
			// email check
			if (email.length < 1)
			{
				alert('이메일을 입력하세요.');
				return false;
			}
			if (! reg_email.test(email))
			{
				alert('이메일 형식이 올바르지 않습니다.');
				return false;
			}
			if (userFlag < 1)
			{
				alert('userFlag를 입력하세요.');
				return false;
			}
			if (userFlag != 'Y' && userFlag != 'N')
			{
				alert('userFlag는 Y 또는 N 값만 가능합니다.');
				return false;
			}
			
			alert("회원이 추가되었습니다.");
			return true;
		}
	</script>
</form>
</div>
<br>
</body>
</html>