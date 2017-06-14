package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class route_personal {
	private String username;
	private String personal_code;
	private int route_code;
	
	public route_personal(){}

	public route_personal(String username, String personal_code, int route_code) {
		super();
		this.username = username;
		this.personal_code = personal_code;
		this.route_code = route_code;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPersonal_code() {
		return personal_code;
	}

	public void setPersonal_code(String personal_code) {
		this.personal_code = personal_code;
	}

	public int getRoute_code() {
		return route_code;
	}

	public void setRoute_code(int route_code) {
		this.route_code = route_code;
	}

	@Override
	public String toString() {
		return "route_personal [username=" + username + ", personal_code=" + personal_code + ", route_code="
				+ route_code + "]";
	}

	
	
	
	
}
