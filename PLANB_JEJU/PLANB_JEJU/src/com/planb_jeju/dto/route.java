package com.planb_jeju.dto;

public class route {
	private int route_code;
	private String username;
	private String routename;
	private String partner_code;
	
	
	public route(){}


	public route(int route_code, String username, String routename, String partner_code) {
		super();
		this.route_code = route_code;
		this.username = username;
		this.routename = routename;
		this.partner_code = partner_code;
	}


	public int getRoute_code() {
		return route_code;
	}


	public void setRoute_code(int route_code) {
		this.route_code = route_code;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getRoutename() {
		return routename;
	}


	public void setRoutename(String routename) {
		this.routename = routename;
	}


	public String getPartner_code() {
		return partner_code;
	}


	public void setPartner_code(String partner_code) {
		this.partner_code = partner_code;
	}


	@Override
	public String toString() {
		return "route [route_code=" + route_code + ", username=" + username + ", routename=" + routename
				+ ", partner_code=" + partner_code + "]";
	}

	
	
	
	
	
}
