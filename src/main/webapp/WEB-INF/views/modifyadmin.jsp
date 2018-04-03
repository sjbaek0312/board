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
<title>정보 수정</title>
</head>

<body>
<div class="head">
<br>
&emsp;정보 수정
<br><br>
</div>

<br><br>
<div class="body">
	<form id="modifyform" method="post" onsubmit="return user_modify()">
		<table style="width: 550px; margin: auto; text-align: center;">
			<tr>
				<td>user_pw</td>
			</tr>
			<tr>
				<td><input type="password" id="userPw" name="userPw" style="width: 200px" value="${userVO.userPw }"></td>
			</tr>
			<tr>
				<td>user_name</td>
			</tr>
			<tr>
				<td><input type="text" id="userName" name="userName" style="width: 200px" value="${userVO.userName }"></td>
			</tr>
			<tr>
				<td>email</td>
			</tr>
			<tr>
				<td><input type="text" id="email" name="email" style="width: 200px" value="${userVO.email }"></td>
			</tr>
			<tr>
				<td>user_flag</td>
			</tr>
			<tr>
				<td><input type="text" id="userFlag" name="userFlag" style="width: 200px" value="${userVO.userFlag }"></td>
			</tr>
			<tr>
				<td><button class="bodybutton" type="submit">수정</button>
				<button class="bodybutton" type="button" onclick="location.href='/admin/users'">취소</button></td>
			</tr>
		</table>
		<script type="text/javascript">
			function user_modify()
			{
				var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var userPw = document.getElementById("userPw").value;
				var userName = document.getElementById("userName").value;
				var email = document.getElementById("email").value;
				var userFlag = document.getElementById("userFlag").value;
				
				// validation check
				if (userPw.length < 1)
				{
					alert('비밀번호를 입력하세요.');
					return false;
				}
				if (userName.length < 1)
				{
					alert("이름을 입력하세요.");
					return false;
				}
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

				// modify success
				alert("정보가 수정되었습니다.");
				return true;
			}
		</script>
	</form>
</div>
</body>
</html>