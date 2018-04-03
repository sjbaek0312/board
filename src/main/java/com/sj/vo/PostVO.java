package com.sj.vo;

import java.util.Date;

public class PostVO {

	private int postId;
	private String userId;
	private Date postRegdate;
	private Date postUpdatedate;
	private String title;
	private String postContent;
	private String filename;
	private int postHeart;
	private int postReplycount;
	private char postFlag;
	
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
	public Date getPostRegdate() {
		return postRegdate;
	}
	public void setPostRegdate(Date postRegdate) {
		this.postRegdate = postRegdate;
	}
	public Date getPostUpdatedate() {
		return postUpdatedate;
	}
	public void setPostUpdatedate(Date postUpdatedate) {
		this.postUpdatedate = postUpdatedate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getPostHeart() {
		return postHeart;
	}
	public void setPostHeart(int postHeart) {
		this.postHeart = postHeart;
	}
	public int getPostReplycount() {
		return postReplycount;
	}
	public void setPostReplycount(int postReplycount) {
		this.postReplycount = postReplycount;
	}
	public char getPostFlag() {
		return postFlag;
	}
	public void setPostFlag(char postFlag) {
		this.postFlag = postFlag;
	}
}
