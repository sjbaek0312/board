package com.sj.vo;

import java.util.Date;

public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String email;
	private Date userRegdate;
	private char userFlag;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}
	public char getUserFlag() {
		return userFlag;
	}
	public void setUserFlag(char userFlag) {
		this.userFlag = userFlag;
	}
}
