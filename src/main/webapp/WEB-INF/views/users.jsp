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
			<td><button class="bodybutton" type="button" onClick="location.href='/admin/joinadmin'">회원 추가</button></td>
		</tr>
		<tr>
			<th>user_id</th>
			<th>user_pw</th>
			<th>user_name</th>
			<th>email</th>
			<th>user_regdate</th>
			<th>user_flag</th>
		</tr>
		<c:forEach items="${users }" var="users">
			<tr>
				<td>${users.userId }</td>
				<td>${users.userPw }</td>
				<td>${users.userName }</td>
				<td>${users.email }</td>
				<td><fmt:formatDate value="${users.userRegdate }" pattern="yyyy-MM-dd HH:mm"/></td><td>${users.userFlag }</td>
			</tr>
			<tr>
				<td>
				<button class="smallbutton" type="button" onClick="location.href='/admin/modifyadmin?userId=${users.userId }'">수정</button>
				<button class="smallbutton" type="button" onClick="location.href='/admin/withdraw?userId=${users.userId }'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>