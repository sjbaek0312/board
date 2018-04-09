<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류</title>
<script type="text/javascript">
	function validationFailed()
	{
		alert("자신의 글이 아닙니다.");
		location.href="/post/readAll";
	}
</script>
</head>
<body onload="validationFailed()">

</body>
</html>