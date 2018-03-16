<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<body>
로그인
<br><br><br><br>
</head>

<body>
<form method="post" action="/user/loginpost">
	아이디<br><input type="text" name="userId" style="width: 200px">
	<br>
	비밀번호<br><input type="password" name="userPw" style="width: 200px">
	<br><br>
	<input type="submit" value="로그인">
	<input type="button" value="취소" onclick="location.href='/'">
</form>
</body>
</html>