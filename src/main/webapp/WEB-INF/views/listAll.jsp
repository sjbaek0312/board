<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>

<body>
<div class="info">
	${login.userId }님
</div>
<br>
<div class="button1">
	<button type="button" id="btnCreate" onClick="location.href='/post/create'">글쓰기</button>
	<button type="button" id="btnUserupdate" onClick="location.href='/user/modify'">내 정보 수정</button>
	<button type="button" id="btnUserlogout" onClick="location.href='/user/logout'">로그아웃</button>
</div>
<div class="posts">
<c:forEach items="${listAll }" var="postVO">
	<br>
	<table border="1" width="550px">
	<tr class="listing">
	<td class="scolling" valign="top">${postVO.userId }&emsp;&emsp;
	등록 <fmt:formatDate value="${postVO.postRegdate }" pattern="yyyy-MM-dd HH:mm"/>
	  ·  수정 <fmt:formatDate value="${postVO.postUpdatedate }" pattern="yyyy-MM-dd HH:mm"/>
	<br><br>
	${postVO.title }  (${postVO.postReplycount })
	<br>
	조회 : ${postVO.viewcount }
	<br><br><br>
	${postVO.postContent }
	<br><br>
	<c:set var="fileName" value="${postVO.filename }" />
	<c:set var="filenameLength" value="${fn:length(fileName) }" />
	<c:if test="${fileName != null }">
		첨부파일 : <a href="/post/download?postId=${postVO.postId }">${fn:substring(fileName, 37, filenameLength) }</a>
	</c:if>
	<br><br>
	<button type="button" id="btnReplycreate" >댓글 달기</button>
	<button type="button" id="btnModify" onClick="location.href='update?postId=${postVO.postId }'">글 수정</button>
	<button type="button" id="btnDelete" onClick="location.href='delete?postId=${postVO.postId }'">삭제</button>
	<br>
	<ul class="timeline">
		<li class="timelabel" id="repliesDiv">댓글</li>
	<c:forEach items="${listAllReply }" var="replyVO">
		<c:set var="replyPostId" value="${replyVO.postId }" />
		<c:set var="postPostId" value="${postVO.postId }" />
		<c:if test="${replyPostId == postPostId }">
		<br>
		${replyVO.userId }&emsp;&emsp;
		등록 <fmt:formatDate value="${replyVO.replyRegdate }" pattern="yyyy-MM-dd HH:mm"/>
		  ·  수정 <fmt:formatDate value="${replyVO.replyUpdatedate }" pattern="yyyy-MM-dd HH:mm"/>
		<br>
		${replyVO.replyContent }
		</c:if>
	</c:forEach>
	</ul>
	</td>
	
	</tr>
	</table>
	<br>
</c:forEach>
</div>


</body>
</html>