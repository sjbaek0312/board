<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류</title>
</head>
<script type="text/javascript">
	function validation_failed()
	{
		alert("자신의 게시물이 아닙니다.");
		location.href="/post/listAll";
	}
</script>
<body onload="validation_failed()">

</body>
</html>