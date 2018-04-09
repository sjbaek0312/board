<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/functions.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/readMy.js"></script>
</head>

<body>
<div class="head" id="myinfo">
<br>
	&emsp;${login.userId }님&emsp;&emsp;
	<button class="headbutton" type="button" onClick="location.href='/post/create'">글쓰기</button>
	<button class="headbutton" type="button" onClick="location.href='/post/readAll'">전체 게시물 보기</button>
	<button class="headbutton" type="button" onClick="location.href='/user/modify'">내 정보 수정</button>
	<button class="headbutton" type="button" onClick="location.href='/user/logout'">로그아웃</button>
<br><br>
</div>

<div class="body" id="posts">
	<c:forEach items="${readMy }" var="postVO">
		<br>
		<table width="550px">
			<tr>
			<td valign="top">
			<input type="hidden" id="userId" value="${login.userId }"/>
			<input type="hidden" id="postId" value="${postVO.postId }"/>
			<strong> ${postVO.userId }</strong>&emsp;&emsp;
			 등록 <fmt:formatDate value="${postVO.postRegdate }" pattern="yyyy-MM-dd HH:mm"/>
			 · 수정 <fmt:formatDate value="${postVO.postUpdatedate }" pattern="yyyy-MM-dd HH:mm"/>
			<br><br>
			<strong>${postVO.title } (댓글 </strong><strong id='postReplycount${postVO.postId }'></strong><strong> · 좋아요 </strong><strong id='postHeart${postVO.postId }'></strong><strong>)</strong>
			<br><br><br>
			${postVO.postContent }
			<br><br>
			<c:set var="fileName" value="${postVO.filename }" />
			<c:set var="filenameLength" value="${fn:length(fileName) }" />
			<c:if test="${fileName != null }">
				첨부파일 : <a href="/post/download?postId=${postVO.postId }">${fn:substring(fileName, 37, filenameLength) }</a>
			</c:if>
			<br><br>
			<button class="bodybutton" type="button" onClick="location.href='update?postId=${postVO.postId }'">글 수정</button>
			<button class="bodybutton" type="button" onClick="location.href='delete?postId=${postVO.postId }'">글 삭제</button>
			<br>
				<div id="replyCreateDiv">
					<input type="text" id="replyContent${postVO.postId }" style="width: 500px">
					<button class="bodybutton" id="postHeart${postVO.postId }" onclick="">좋아요</button>
					<button class="bodybutton" onclick="replyCreate(${postVO.postId });">댓글 달기</button>
				</div>
				<div id="replies${postVO.postId }">

				</div>
				<div align="center">
					<button class="bodybutton" type="button" onclick="getListAll(${postVO.postId });">댓글 펼치기...</button>
					<button class="bodybutton" type="button" onclick="getList2(${postVO.postId });">댓글 접기...</button>
				</div>
				<div id="foldFlag${postVO.postId }" align="center">
				
				</div>
			</td>
			</tr>
		</table>
		<br>
	</c:forEach>
	<div id="addpost">
	</div>
</div>
<script>
	getList2(document.getElementById("postId").value); 
	getPostReplycount(document.getElementById("postId").value); 
	getPostHeart(document.getElementById("postId").value);
</script>
</body>
</html>