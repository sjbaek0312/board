/**
 * 
 */
var pageNum = 1;
$(document).ready(function(){
	$(window).scroll(function(){
		if ($(window).scrollTop() == $(document).height() - $(window).height()){
			console.log('스크롤 인식, pageNum: ' + pageNum);
			$.getJSON('/post/read5Posts/', {'pageNum': pageNum}, function(data){
				if (data !=""){
					var str ="";
					$.each(data, function(entryIndex, entry){
						var postRegdate = new Date(entry.postRegdate);
						var postUpdatedate = new Date(entry.postUpdatedate);
						str += "<br>";
						str += "<table width='550px'>";
						str += "<tr>";
						str += "<td valign='top'>";
						str += "<input type='hidden' id='userId' value='" + entry.userId + "'/>";
						str += "<strong> " + entry.userId + "</strong>&emsp;&emsp;";
						str += "등록 " + postRegdate.getFullYear() + "-" + zerofill((postRegdate.getMonth() + 1)) + "-" + zerofill(postRegdate.getDate()) + " " + zerofill(postRegdate.getHours()) + ":" + zerofill(postRegdate.getMinutes());
						str += " · 수정 " + postUpdatedate.getFullYear() + "-" + zerofill((postUpdatedate.getMonth() + 1)) + "-" + zerofill(postUpdatedate.getDate()) + " " + zerofill(postUpdatedate.getHours()) + ":" + zerofill(postUpdatedate.getMinutes());
						str += "<br><br>";
						str += "<strong>" + entry.title + " (댓글 </strong><strong id='postReplycount" + entry.postId + "'></strong><strong> · 좋아요 </strong><strong id='postHeart" + entry.postId + "'></strong><strong>)</strong>";
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
						str += "<button class='bodybutton' id='postHeart" + entry.postId + "' onclick=''>좋아요</button>";
						str += "<button class='bodybutton' onclick='replyCreate(" + entry.postId + ");'>댓글 달기</button>";
						str += "</div>";
						str += "<div id='replies" + entry.postId + "'>";
						str += "<script>getList2(" + entry.postId + "); getPostReplycount(" + entry.postId + "); getPostHeart(" + entry.postId + ");<\/script>";
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
					$('#addpost').append(str);		
				}
			});
			pageNum++;
		}
	});
});