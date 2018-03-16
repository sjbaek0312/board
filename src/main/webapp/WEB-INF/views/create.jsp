<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 등록</title>
</head>

<body>
게시물 등록하기
<br><br><br><br>
<form id="form1" method="post" action="create" enctype="multipart/form-data">
	제목<input type="text" name="title" style="width: 600px">
	<br>
	내용<textarea name="postContent" rows="15" style="width: 600px"></textarea>
	<br>
	 파일 (용량제한 : 10MB)<input type="file" name="file">
	<br>
	<input type="submit" value="등록">
	<input type="button" value="취소" onclick="location.href='listAll'">
</form>

<br>

</body>
</html>