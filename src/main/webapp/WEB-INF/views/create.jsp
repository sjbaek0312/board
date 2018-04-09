<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 등록</title>
</head>

<body>
<div class="head">
	<br>
	&emsp;게시물 등록하기
	<br><br>
</div>

<br><br>
<div class="body">
	<form id="form1" method="post" action="create" enctype="multipart/form-data">
	<table style="width: 550px; margin: auto; text-align: center;">
		<tr>
			<td>제목</td>
		</tr>
		<tr>
			<td><input type="text" name="title" style="width: 600px"></td>
		</tr>
		<tr>
			<td>내용</td>
		</tr>
		<tr>
			<td><textarea name="postContent" rows="15" style="width: 600px"></textarea></td>
		</tr>
		<tr>
			<td>파일 (용량 제한 : 100MB)</td>
		</tr>
		<tr>
			<td><input type="file" name="file"></td>
		</tr>
		<tr>
			<td><button class="bodybutton" type="submit">등록</button>
			<button class="bodybutton" type="button" onclick="location.href='/post/readAll'">취소</button></td>
		</tr>
	</table>
	</form>
</div>
<br>

</body>
</html>