<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<%
	String ctx = request.getContextPath();
	pageContext.setAttribute("ctx", ctx);
%>
<html>

<head>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	var pageNum = 1;
	$(document).ready(function(){
		$(window).scroll(function(){
			if ($(window).scrollTop() == $(document).height() - $(window).height()){
				console.log('스크롤 인식, pageNum: ' + pageNum);
				$.getJSON('/post/listAll1/', {'pageNum': pageNum}, function(data){
					if (data !=""){
						var str ="";
						$.each(data, function(entryIndex, entry){
							console.log(entry.postId);
							var postRegdate = new Date(entry.postRegdate);
							var postUpdatedate = new Date(entry.postUpdatedate);
							str += "<br>";
							str += "<table width='550px'>";
							str += "<tr>";
							str += "<td valign='top'>";
							str += "<input type='hidden' id='userId' value='" + entry.userId + "'/>";
							str += entry.userId + "&emsp;&emsp;";
							str += "등록 " + postRegdate.getFullYear() + "-" + zerofill((postRegdate.getMonth() + 1)) + "-" + zerofill(postRegdate.getDate()) + " " + zerofill(postRegdate.getHours()) + ":" + zerofill(postRegdate.getMinutes());
							str += " · 수정 " + postUpdatedate.getFullYear() + "-" + zerofill((postUpdatedate.getMonth() + 1)) + "-" + zerofill(postUpdatedate.getDate()) + " " + zerofill(postUpdatedate.getHours()) + ":" + zerofill(postUpdatedate.getMinutes());
							str += "<br><br>";
							str += entry.title;
							str += "<br><br><br>";
							str += entry.postContent;
							str += "<br><br>";
							if (entry.filename != null){
								str += "첨부파일 : <a href='/post/download?postId=" + entry.postId + "'>" + entry.filename.substring(37) + "</a>";
							}
							str += "<br><br>";
							str += "<button class='bodybutton' type='button' onclick=\"location.href='update?postId=" + entry.postId + "'\">글 수정</button>";
							str += "<button class='bodybutton' type='button' onclick=\"location.href='delete?postId=" + entry.postId + "'\">글 삭제</button>";
							str += "<br>";
							str += "<div id='replyCreateDiv'>";
							str += "<input type='text' id='replyContent" + entry.postId + "' style='width: 500px'>";
							str += "<button class='bodybutton' onclick='replyCreate(" + entry.postId + ");'>댓글 달기</button>";
							str += "</div>";
							str += "<div id='replies" + entry.postId + "'>";
							str += "<script>getList2(" + entry.postId + ");<\/script>";
							str += "</div>";
							str += "<div align='center'>";
							str += "<button class='bodybutton' type='button' onclick='getListAll(" + entry.postId + ");'>댓글 펼치기...</button>";
							str += "<button class='bodybutton' type='button' onclick='getList2(" + entry.postId + ");'>댓글 접기...</button>";
							str += "</div>";
							str += "<div id='foldFlag" + entry.postId + "' align='center'></div>";
							str += "</td>";
							str += "</tr>";
							str += "</table>";
							str += "<br>";
						});
						console.log(str);
						$('#addpost').append(str);		
					}
				});
				pageNum++;
			}
		});
	});
	
	// add 0 if dateformat is smaller than 10 (ex: if 4, then 04)
	function zerofill(n){
		if (n < 10) {
			n = "0" + n;
		}
		return n;
	}
	
	// get rereply
	function getListRereply(replyId, postId){
		console.log(postId);
		$.getJSON('/reply/rereply/', {'replyId': replyId}, function(data){
			var str = "<ol>";
			str += "<div id='rereplyCreateDiv'>";
			str += "<input type='text' id='rereplyContent" + replyId + "' style='width: 400px'>";
			str += "<button class='smallbutton' onclick='rereplyCreate(" + replyId + ", " + postId + ");'>댓글 달기</button>";
			str += "</div>";
			var cnt = 0;
			$.each(data, function(entryIndex, entry){
					var date = new Date(entry.replyUpdatedate);
					str += "<li data-replyId=" + entry.replyId + " class='rereplyli'>" + entry.userId + "&emsp;&emsp;마지막 수정  ";
					str += date.getFullYear() + "-" + zerofill((date.getMonth() + 1)) + "-" + zerofill(date.getDate()) + " " + zerofill(date.getHours()) + ":" + zerofill(date.getMinutes()) + "<br>";
					str += entry.replyContent;
					str += "<button class='smallbutton' onclick='rereplyUpdate(" + entry.replyId + ", " + entry.postId + ", " + entry.parentReplyId + ");'>수정</button>";
					str += "<button class='smallbutton' onclick='replyDelete(" + entry.replyId + ", " + entry.postId + ");'>삭제</button></li>";
					cnt++;
			});
			str += "</ol>";
			$('#rereplies' + replyId).html(str);
			$('#rerepliesBtn' + replyId).html("대댓글(" + cnt + ")");
		});
	}

	// get reply 2
	function getList2(postId){
		$.getJSON('/reply/', {'postId': postId}, function(data){
			var str = "";
			var cnt = 1;
			$.each(data, function(entryIndex, entry){
				if (cnt == 3){
					return false;
				}
				var date = new Date(entry.replyUpdatedate);
				str += "<br><li data-replyId=" + entry.replyId + " class='replyli'>" + entry.userId + "&emsp;&emsp;마지막 수정  ";
				str += date.getFullYear() + "-" + zerofill((date.getMonth() + 1)) + "-" + zerofill(date.getDate()) + " " + zerofill(date.getHours()) + ":" + zerofill(date.getMinutes()) + "<br>";
				str += entry.replyContent;
				str += "<input type='hidden' id='parentReplyId" + entry.replyId + "' value='0'>";
				str += "<button class='smallbutton' id='rerepliesBtn" + entry.replyId + "' onclick='getListRereply(" + entry.replyId + ", " + postId + ")'>대댓글</button>";
				str += "<button class='smallbutton' onclick='replyUpdate(" + entry.replyId + ", " + postId + ");'>수정</button>";	
				str += "<button class='smallbutton' onclick='replyDelete(" + entry.replyId + ", " + postId + ");'>삭제</button></li>";
				str += "<div id='rereplies" + entry.replyId + "'></div>";
				cnt++;			
			});
			$('#replies' + postId).html(str);
			$("#foldFlag" + postId).html("댓글 접힘");
		});
	}
	
	// get reply all
	function getListAll(postId){
		$.getJSON('/reply/', {'postId': postId}, function(data){
			var str = "";
			$.each(data, function(entryIndex, entry){
				var date = new Date(entry.replyUpdatedate);
				str += "<br><li data-replyId=" + entry.replyId + " class='replyli'>" + entry.userId + "&emsp;&emsp;마지막 수정  ";
				str += date.getFullYear() + "-" + zerofill((date.getMonth() + 1)) + "-" + zerofill(date.getDate()) + " " + zerofill(date.getHours()) + ":" + zerofill(date.getMinutes()) + "<br>";
				str += entry.replyContent;
				str += "<input type='hidden' id='flag" + entry.replyId + "' value='0'>";
				str += "<button class='smallbutton' id='rerepliesBtn" + entry.replyId + "' onclick='getListRereply(" + entry.replyId + ")'>대댓글</button>";
				str += "<button class='smallbutton' onclick='replyUpdate(" + entry.replyId + ", " + postId + ");'>수정</button>";
				str += "<button class='smallbutton' onclick='replyDelete(" + entry.replyId + ", " + postId + ");'>삭제</button></li>";
				str += "<div id='rereplies" + entry.replyId + "'></div>";
			});
			$('#replies' + postId).html(str);
			$('#foldFlag' + postId).html("댓글 펼쳐짐");
		});
	}

	// reply create
	function replyCreate(postId){
		var replyContent = $('#replyContent' + postId).val();
		if (replyContent == ""){
			alert("댓글 내용을 입력해주세요.");
			return false;
		}
		$.ajax({
			type: 'post', 
	 		url: '/reply/', 
	 		headers: {
	 			"Content-Type": "application/json"
	 		}, 
	 		dataType: 'text', 
	 		data: JSON.stringify({
				'postId': postId, 
				'replyContent': replyContent, 
				'parentReplyId': 0
	 		}), 
	 		success: function(){
	 			alert('댓글이 등록되었습니다.');
	 			console.log($('#foldFlag' + postId).text());
	 			if ($('#foldFlag' + postId).text() == '댓글 접힘'){
	 				getList2(postId);
	 			} 					
	 			else{
	 				getListAll(postId);
	 			}
	 		}
		});
	}
	
	// rereply create
	function rereplyCreate(parentReplyId, postId){
		var replyContent = $('#rereplyContent' + parentReplyId).val();
		if (replyContent == ""){
			alert("댓글 내용을 입력해주세요.");
			return false;
		}
		$.ajax({
			type: 'post', 
	 		url: '/reply/', 
	 		headers: {
	 			"Content-Type": "application/json"
	 		}, 
	 		dataType: 'text', 
	 		data: JSON.stringify({
				'postId': postId, 
				'replyContent': replyContent, 
				'parentReplyId': parentReplyId
	 		}), 
	 		success: function(){
	 			alert('댓글이 등록되었습니다.');
	 			getListRereply(parentReplyId, postId);
	 		}
		});
	}

	// reply update
	function replyUpdate(replyId, postId){
		var replyContent = $('#replyContent' + postId).val();
		if (replyContent == ""){
			alert("댓글 내용을 입력해주세요.");
			return false;
		}
		$.ajax({
			type: 'put', 
 			url: '/reply/' + replyId, 
 			headers: {
 				"Content-Type": "application/json"
 			}, 
 			dataType: 'text', 
 			data: JSON.stringify({
				'replyContent': replyContent
 			}),
 			success: function(){
 				alert('댓글이 수정되었습니다.');
 				if ($('#foldFlag' + postId).text() == '댓글 접힘'){
 					getList2(postId);
 				} 					
 				else{
 					getListAll(postId);
 				}
 			}
		});
	}
	
	// rereply update
	function rereplyUpdate(replyId, postId, parentReplyId){
		var replyContent = $('#rereplyContent' + parentReplyId).val();
		if (replyContent == ""){
			alert("댓글 내용을 입력해주세요.");
			return false;
		}
		$.ajax({
			type: 'put', 
 			url: '/reply/' + replyId, 
 			headers: {
 				"Content-Type": "application/json"
 			}, 
 			dataType: 'text', 
 			data: JSON.stringify({
				'replyContent': replyContent
 			}),
 			success: function(){
 				alert('댓글이 수정되었습니다.');
	 			getListRereply(parentReplyId, postId);
 			}
		});
	}
	
	// reply(rereply) delete
	function replyDelete(replyId, postId){
		$.ajax({
			type: 'delete', 
			url: '/reply/' + replyId, 
			headers: {
				"Content-Type": "application/json"
			}, 
			dataType: 'text', 
			success: function(){
				alert('댓글이 삭제되었습니다.');
 				if ($('#foldFlag' + postId).text() == '댓글 접힘'){
 					getList2(postId);
 				} 					
 				else{
 					getListAll(postId);
 				}
			}
		});
	}
</script>
</head>

<body>
<div class="head" id="myinfo">
<br>
	&emsp;${login.userId }님&emsp;&emsp;
	<button class="headbutton" type="button" onClick="location.href='/post/create'">글쓰기</button>
	<button class="headbutton" type="button" onClick="location.href='/user/modify'">내 정보 수정</button>
	<button class="headbutton" type="button" onClick="location.href='/user/logout'">로그아웃</button>
<br><br>
</div>

<div class="body" id="posts">
	<c:forEach items="${listAll }" var="postVO">
		<br>
		<table width="550px">
			<tr>
			<td valign="top">
			<input type="hidden" id="userId" value="${login.userId }"/>
			<input type="hidden" id="postId" value="${postVO.postId }"/>
			${postVO.userId }&emsp;&emsp;
			 등록 <fmt:formatDate value="${postVO.postRegdate }" pattern="yyyy-MM-dd HH:mm"/>
			 · 수정 <fmt:formatDate value="${postVO.postUpdatedate }" pattern="yyyy-MM-dd HH:mm"/>
			<br><br>
			${postVO.title }
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
					<button class="bodybutton" onclick="replyCreate(${postVO.postId });">댓글 달기</button>
				</div>
				<div id="replies${postVO.postId }">
					<script>getList2('${postVO.postId}');</script>
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
</body>
</html>