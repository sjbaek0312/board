<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 수정</title>

</head>

<body>
<div class="head">
<br>
&emsp;정보 수정
<br><br>
</div>

<br><br>
<div class="body">
	<form id="form1" method="post">
		<table style="width: 550px; margin: auto; text-align: center;">
			<tr>
				<td>아이디</td>
			</tr>
			<tr>
				<td><input type="text" name="userId" style="width: 200px; background-color: #D5D5D5;" readonly="readonly" value="${userVO.userId }"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="userPw" style="width: 200px" value="${userVO.userPw }"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
			</tr>
			<tr>
				<td><input type="password" name="userPwconfirm" style="width: 200px" value="${userVO.userPw }"></td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" name="userName" style="width: 200px" value="${userVO.userName }"></td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><input type="text" name="email" style="width: 200px" value="${userVO.email }"></td>
			</tr>
			<tr>
				<td><button class="bodybutton" type="submit" onClick="user_modify();">수정</button>
				<button class="bodybutton" type="button" onclick="location.href='/'">취소</button>
				<button class="bodybutton" type="button" onClick="location.href='/user/withdrawconfirm'">회원 탈퇴</button></td>
			</tr>
		</table>
		<script>
			function user_modify()
			{
				alert("정보가 수정되었습니다.");
			}
		</script>
	</form>
</div>
</body>
</html>