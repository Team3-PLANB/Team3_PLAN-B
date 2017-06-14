package com.planb_jeju.dto;

public class member {
	private String username;
	private String password;
	private String nickname;
	
	public member(){}

	public member(String username, String password, String nickname) {
		super();
		this.username = username;
		this.password = password;
		this.nickname = nickname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "member [username=" + username + ", password=" + password + ", nickname=" + nickname + "]";
	}
	
	
	
	
	
}
