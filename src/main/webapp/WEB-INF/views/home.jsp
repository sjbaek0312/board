<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

 The time on the server is ${serverTime}.
<br><br>
<input type=button value="login" onclick="location.href='user/login'">
<input type=button value="join" onclick="location.href='user/join'">


</body>
</html>
