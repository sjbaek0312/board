<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 수정</title>
</head>
<body>
정보 수정하기
<br><br><br><br>
</head>

<body>
<form id="form1" method="post">
	아이디<br><input type="text" name="userId" style="width: 200px; background-color: #D5D5D5" readonly="readonly" value="${login.userId }">
	<br>
	비밀번호<br><input type="password" name="userPw" style="width: 200px" value="${login.userPw }">
	<br>
	비밀번호 확인<br><input type="password" name="userPwConfirm" style="width: 200px" value="${login.userPw }">
	<br>
	이름<br><input type="text" name="userName" style="width: 200px" value="${login.userName }">
	<br>
	이메일<br><input type="text" name="email" style="width: 200px" value="${login.email }">
	<br><br>
	<input type="submit" value="수정" onclick="user_modify();">
	<script>
		function user_modify()
		{
			alert("정보가 수정되었습니다.");
		}
	</script>
	<input type="button" value="취소" onclick="location.href='/post/listAll'">
	<input type="button" value="회원 탈퇴" onclick="location.href='/user/withdrawrepeat'">
</form>

</body>
</html>