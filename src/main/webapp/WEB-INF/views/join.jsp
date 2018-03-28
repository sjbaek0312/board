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
	<script type="text/javascript">
		function user_join()
		{
			var reg_userId = /^[0-9a-zA-Z_]{4,20}$/;
			var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var userId = document.getElementById("userId").value;
			var userPw = document.getElementById("userPw").value;
			var userPwconfirm = document.getElementById("userPwconfirm").value;
			var userName = document.getElementById("userName").value;
			var email = document.getElementById("email").value;
			
			// id check
			if (userId.length < 1)
			{
				alert('아이디를 입력하세요.');l
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
			// pwconfirm check
			if (userPw != userPwconfirm)
			{
				alert("비밀번호 값과 비밀번호 확인 값이 다릅니다.")
				return false;
			}
			
			alert("회원 가입을 축하합니다!");
			return true;
		}
	</script>
</form>
</div>
<br>
</body>
</html>