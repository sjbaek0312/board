<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
회원 가입하기
<br><br><br><br>
</head>

<body>
<form id="form1" method="post">
	아이디<br><input type="text" name="userId" style="width: 200px">
	<br>
	비밀번호<br><input type="password" name="userPw" style="width: 200px">
	<br>
	비밀번호 확인<br><input type="password" name="userPwConfirm" style="width: 200px">
	<br>
	이름<br><input type="text" name="userName" style="width: 200px">
	<br>
	이메일<br><input type="text" name="email" style="width: 200px">
	<br><br>
	<!-- 파일<input type="file" name="file" placeholder="${postVO.file }"> -->
	<input type="submit" value="등록" onclick="user_join();">
	<script>
		function user_join()
		{
			alert("회원 가입을 축하합니다!");
		}
	</script>
	<input type="button" value="취소" onclick="location.href='/'">
</form>

<br>
</body>
</html>