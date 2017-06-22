package com.planb_jeju.dto;

public class Role {
	private String username;
	private String ROLE_NAME;
	private String password;
	
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

	public String getROLE_NAME() {
		return ROLE_NAME;
	}
	public void setROLE_NAME(String ROLE_NAME) {
		this.ROLE_NAME = ROLE_NAME;
	}
	@Override
	public String toString() {
		return "Roll [username=" + username + ", ROLE_NAME=" + ROLE_NAME + "]";
	}

}
