package com.sj.domain;

import java.util.Date;

public class PostVO {

	private int postId;
	private String userId;
	private Date postRegdate;
	private Date postUpdatedate;
	private int postHeart;
	private int postReplycount;
	private String title;
	private String postContent;
	private int viewcount;
	private String filename;
	
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
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
