<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin</title>
<style>
	table, th, td{
		border: none;
		text-align: center;
	}
	table{
		width: 900px;
	}
</style>
</head>

<body>
<div class="head">
	<br>
	&emsp;관리자 모드&emsp;&emsp;
	<button class="headbutton" type="button" onClick="location.href='/admin/main'">뒤로</button>
	<br><br>
</div>

<br><br><br>
<div class="body">
	<table>
		<tr>
			<th>post_id</th>
			<th>post_regdate</th>
			<th>post_updatedate</th>
			<th>title</th>
			<th>post_content</th>
		</tr>
		<tr>
			<th>user_id</th>
			<th>filename</th>
			<th>post_heart</th>
			<th>post_replycount</th>
			<th>post_flag</th>
		</tr>
		<c:forEach items="${posts }" var="posts">
			<tr>
				<td>${posts.postId }</td>
				<td><fmt:formatDate value="${posts.postRegdate }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td><fmt:formatDate value="${posts.postUpdatedate }" pattern="yyyy-MM-dd HH:mm"/></td>
				<td>${posts.title }</td>
				<td>${posts.postContent }</td>
			</tr>
			<tr>
				<td>${posts.userId }</td>
				<td>${posts.filename }</td>
				<td>${posts.postHeart }</td>
				<td>${posts.postReplycount }</td>
				<td>${posts.postFlag }</td>
			</tr>
			<tr>
				<td>
				<button class="smallbutton" type="button" onClick="location.href='/admin/updateadmin?postId=${posts.postId }'">수정</button>
				<button class="smallbutton" type="button" onClick="location.href='/admin/delete?postId=${posts.postId }&userId=${posts.userId }'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>