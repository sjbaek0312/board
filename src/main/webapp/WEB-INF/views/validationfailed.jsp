<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류</title>
</head>
<script type="text/javascript">
	function validation_failed()
	{
		alert("자신의 글이 아닙니다.");
		location.href="/post/readAll";
	}
</script>
<body onload="validation_failed()">

</body>
</html>