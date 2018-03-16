<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
</head>

<body>
게시물 수정하기
<br><br><br><br>
<form id="form1" method="post" enctype="multipart/form-data">
	<input type="hidden" name="postId" value="${postVO.postId }">
	작성자<br><input type="text" name="userId" style="width: 600px; background-color: #D5D5D5" readonly="readonly" value="${postVO.userId }">
	<br>
	제목<br><input type="text" name="title" style="width: 600px" value="${postVO.title }">
	<br>
	내용<br><textarea name="postContent" rows="15" style="width: 600px">${postVO.postContent }</textarea>
	<br>
	<c:set var="fileName" value="${postVO.filename }" />
	<c:set var="filenameLength" value="${fn:length(fileName) }" />
	 파일 (용량제한 : 10MB)<input type="file" name="file">
	 	<c:if test="${fileName != null }">
	 		(현재 파일 : ${fn:substring(fileName, 37, filenameLength) })
		</c:if>
	<br>
	<input type="submit" value="수정" onclick="post_update();">
	<script>
		function post_update()
		{
			alert("게시물이 수정되었습니다.");
		}
	</script>
	<input type="button" value="취소" onclick="location.href='/post/listAll'">
</form>

</body>
</html>