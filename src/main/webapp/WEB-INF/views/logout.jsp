<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function userLogout()
	{
		alert("로그아웃 되었습니다.");
		location.href = "/user/login";
	}
</script>
</head>
<body onload="userLogout()">

</body>
</html>