<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 삭제</title>
</head>
<script type="text/javascript">
	function post_delete()
	{
		alert("게시물이 삭제되었습니다.");
		location.href="/post/readAll";
	}
</script>
<body onload="post_delete()">

</body>
</html>