/**
 * 
 */

// add 0 if dateformat is smaller than 10 (ex: if 4, then 04)
function zerofill(n){
	if (n < 10) {
		n = "0" + n;
	}
	return n;
}

// get postReplycount
function getPostReplycount(postId){
	$.getJSON('/post/postReplycount/', {'postId': postId}, function(data){
		$('#postReplycount' + postId).html(data);
	});
}

//get replyReplycount
function getReplyReplycount(replyId){
	$.getJSON('/reply/replyReplycount/', {'replyId': replyId}, function(data){
		$('#replyReplycount' + replyId).html('대댓글(' + data + ')');
	});
}

// get postHeart
function getPostHeart(postId){
	$.getJSON('/post/postHeart/', {'postId': postId}, function(data){
		$('#postHeart' + postId).html(data);
	});
}

// get rereply
function getListRereply(replyId, postId){
	var cnt = 0;
	$.getJSON('/reply/rereply/', {'replyId': replyId}, function(data){
		var str = "<ul>";
		str += "<div id='rereplyCreateDiv'>";
		str += "<input type='text' id='rereplyContent" + replyId + "' style='width: 400px'>";
		str += "<button class='smallbutton' onclick='rereplyCreate(" + replyId + ", " + postId + ");'>댓글 달기</button>";
		str += "</div>";
		$.each(data, function(entryIndex, entry){
				var date = new Date(entry.replyUpdatedate);
				str += "<li data-replyId=" + entry.replyId + " class='rereplyli'>" + entry.userId + "&emsp;&emsp;마지막 수정  ";
				str += date.getFullYear() + "-" + zerofill((date.getMonth() + 1)) + "-" + zerofill(date.getDate()) + " " + zerofill(date.getHours()) + ":" + zerofill(date.getMinutes()) + "<br>";
				str += entry.replyContent;
				str += "<button class='smallbutton' onclick='rereplyUpdate(" + entry.replyId + ", " + entry.postId + ", " + entry.parentReplyId + ");'>수정</button>";
				str += "<button class='smallbutton' onclick='rereplyDelete(" + entry.replyId + ", " + entry.postId + ", " + entry.parentReplyId + ");'>삭제</button></li>";
				cnt++;
		});
		str += "</ul>";
		$('#rereplies' + replyId).html(str);
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
			str += "<button class='smallbutton' id='replyReplycount" + entry.replyId + "' onclick='getListRereply(" + entry.replyId + ", " + postId + ")'>대댓글</button>";
			str += "<button class='smallbutton' onclick='replyUpdate(" + entry.replyId + ", " + postId + ");'>수정</button>";	
			str += "<button class='smallbutton' onclick='replyDelete(" + entry.replyId + ", " + postId + ");'>삭제</button>";
			str += "<div id='rereplies" + entry.replyId + "'></div></li>";
			str += "<script>getReplyReplycount(" + entry.replyId + ");<\/script>"
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
			str += "<button class='smallbutton' id='replyReplycount" + entry.replyId + "' onclick='getListRereply(" + entry.replyId + ", " + postId + ")'>대댓글</button>";
			str += "<button class='smallbutton' onclick='replyUpdate(" + entry.replyId + ", " + postId + ");'>수정</button>";
			str += "<button class='smallbutton' onclick='replyDelete(" + entry.replyId + ", " + postId + ");'>삭제</button>";
			str += "<div id='rereplies" + entry.replyId + "'></div></li>";
			str += "<script>getReplyReplycount(" + entry.replyId + ");<\/script>"
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
 			getPostReplycount(postId);
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
 			getPostReplycount(postId);
 			getReplyReplycount(parentReplyId);
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
 			getPostReplycount(postId);
			if ($('#foldFlag' + postId).text() == '댓글 접힘'){
				getList2(postId);
 			} 					
 			else{
 				getListAll(postId);
 			}
 		}, 
		error: function(){
			alert('자신의 댓글이 아닙니다.');
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
		}, 
		error: function(){
			alert('자신의 댓글이 아닙니다.');
		}
	});
}
	
// reply delete
function replyDelete(replyId, postId){
	$.ajax({
		type: 'delete', 
		url: '/reply/' + postId + '/' + 0 + '/' + replyId, 
		headers: {
			"Content-Type": "application/json"
		}, 
		dataType: 'text', 
		success: function(){
			alert('댓글이 삭제되었습니다.');
 			getPostReplycount(postId);
			if ($('#foldFlag' + postId).text() == '댓글 접힘'){
				getList2(postId);
			} 					
			else{
				getListAll(postId);
			}
		}, 
		error: function(){
			alert('자신의 댓글이 아닙니다.');
		}
	});
}
	
// rereply delete
function rereplyDelete(replyId, postId, parentReplyId){
	$.ajax({
		type: 'delete', 
		url: '/reply/' + postId + '/' + parentReplyId + '/' + replyId, 
		headers: {
			"Content-Type": "application/json"
		}, 
		dataType: 'text', 
		success: function(){
			alert('댓글이 삭제되었습니다.');
	 		getPostReplycount(postId);
	 		getReplyReplycount(parentReplyId);
 			if ($('#foldFlag' + postId).text() == '댓글 접힘'){
 				getList2(postId);
 			} 					
 			else{
 				getListAll(postId);
 			}
		}, 
		error: function(){
			alert('자신의 댓글이 아닙니다.');
		}
	});
}