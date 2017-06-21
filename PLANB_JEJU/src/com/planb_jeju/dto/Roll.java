package com.planb_jeju.dto;

public class Roll {
	private String username;
	private String role_code;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}
	@Override
	public String toString() {
		return "Roll [username=" + username + ", role_code=" + role_code + "]";
	}

}
