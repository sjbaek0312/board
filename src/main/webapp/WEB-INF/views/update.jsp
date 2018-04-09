<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 수정</title>
</head>

<body>
<div class="head">
	<br>
	&emsp;게시물 수정
	<br><br>
</div>

<br><br>
<div class="body">
	<form id="updateform" method="post" enctype="multipart/form-data">
		<table style="width: 550px; margin: auto; text-align: center;">
		<c:set var="fileName" value="${postVO.filename }" />
		<c:set var="filenameLength" value="${fn:length(fileName) }" />
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td><input type="text" name="title" style="width: 600px" value="${postVO.title }"></td>
			</tr>
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td><textarea name="postContent" rows="15" style="width: 600px">${postVO.postContent }</textarea></td>
			</tr>
			<tr>
				<td>파일 (용량 제한 : 100MB)</td>
			</tr>
			<tr>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td><c:if test="${fileName != null }">
			 		(현재 파일 : ${fn:substring(fileName, 37, filenameLength) })
				</c:if></td>
			</tr>
			<tr>
				<td>
				<button class="bodybutton" type="submit" onClick="updateForm();">수정</button>
				<button class="bodybutton" type="button" onclick="location.href='/post/readAll'">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<script>
	function updateForm()
	{
		var title = document.getElementById("title").value;
		var postContent = document.getElementById("postContent").value;
				
		if (title.length < 1)
		{
			alert('제목을 입력하세요.');
			return false;
		}
		if (postContent.length < 1)
		{
			alert("내용을 입력하세요.");
			return false;
		}
				
		alert("게시물이 수정되었습니다.");
	}
</script>
</body>
</html>