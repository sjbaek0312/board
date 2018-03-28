<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<script type="text/javascript">
	function withdraw_confirm_30()
	{
		var bool = confirm("회원 탈퇴 시 회원 정보, 작성한 글과 댓글이 30일 후에 제거됩니다. 계속하시겠습니까?");
		if (bool)
		{
			location.href="/user/withdraw30";
		}
		else
		{
			location.href="/user/modify";
		}
	}
</script>
<body onload="withdraw_confirm_30()">
</body>
</html>