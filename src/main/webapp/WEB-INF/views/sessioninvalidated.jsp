<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류</title>
<script type="text/javascript">
	function sessionInvalidated()
	{
		alert("세션이 만료되었습니다. 다시 로그인 해주세요.");
		location.href="/user/login";
	}
</script>
</head>
<body onload="sessionInvalidated()">

</body>
</html>