package com.sj.domain;

import java.util.Date;

public class ReplyVO {

	private int replyId;
	private Date replyRegdate;
	private Date replyUpdatedate;
	private int replyReplyCount;
	private String replyContent;
	private int depth;
	private int postId;
	private String userId;
	private int replyReplyId;
	private char replyFlag;
	
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public Date getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(Date replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public Date getReplyUpdatedate() {
		return replyUpdatedate;
	}
	public void setReplyUpdatedate(Date replyUpdatedate) {
		this.replyUpdatedate = replyUpdatedate;
	}
	public int getReplyReplyCount() {
		return replyReplyCount;
	}
	public void setReplyReplyCount(int replyReplyCount) {
		this.replyReplyCount = replyReplyCount;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReplyReplyId() {
		return replyReplyId;
	}
	public void setReplyReplyId(int replyReplyId) {
		this.replyReplyId = replyReplyId;
	}
	public char getReplyFlag() {
		return replyFlag;
	}
	public void setReplyFlag(char replyFlag) {
		this.replyFlag = replyFlag;
	}
}
