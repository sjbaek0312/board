package com.sj.vo;

import java.util.Date;

public class ReplyVO {

	private int replyId;
	private Date replyRegdate;
	private Date replyUpdatedate;
	private String replyContent;
	private int postId;
	private String userId;
	private int parentReplyId;
	private int replyReplycount;
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
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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
	public int getParentReplyId() {
		return parentReplyId;
	}
	public void setParentReplyId(int parentReplyId) {
		this.parentReplyId = parentReplyId;
	}
	public int getReplyReplycount() {
		return replyReplycount;
	}
	public void setReplyReplycount(int replyReplycount) {
		this.replyReplycount = replyReplycount;
	}
	public char getReplyFlag() {
		return replyFlag;
	}
	public void setReplyFlag(char replyFlag) {
		this.replyFlag = replyFlag;
	}
}
