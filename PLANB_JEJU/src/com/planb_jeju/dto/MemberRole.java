package com.planb_jeju.dto;

/*
* @FileName : LoginJoinController.java
* @Class : LoginJoinController
* @Project : PLANB_JEJU
* @Date : 2017.06.07
* @LastEditDate : 2017.06.16
* @Author : 정다혜, 홍단비 
* @Desc : 회원가입  / 로그인   컨트롤러
*/

public class MemberRole {
	private String username; //이메일
	private String password; //비밀번호
	private String nickname; //닉네임
	private String roleCode; //권한

	public MemberRole(){}

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

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

	@Override
	public String toString() {
		return "member [username=" + username + ", password=" + password + ", nickname=" + nickname + ", roleCode=" + roleCode + "]";
	}
	
	
	
	
	
}
