<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 실패</title>
<script type="text/javascript">
	function loginFailed()
	{
		alert("로그인 실패. 아이디 또는 비밀번호를 확인하세요.");
		location.href="/user/login";
	}
</script>
</head>
<body onload="loginFailed()">
</body>
</html>