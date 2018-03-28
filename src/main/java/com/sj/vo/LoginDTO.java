package com.sj.vo;

public class LoginDTO {

	private String userId;
	private String userPw;
	private boolean userSession;
	
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
	public boolean isUserSession() {
		return userSession;
	}
	public void setUserSession(boolean userSession) {
		this.userSession = userSession;
	}
}
