package com.planb_jeju.dto;

import java.util.Date;

public class Route {
	private int route_code;
	private String username;
	private String routename;
	private String partner_code;
	private Date sday;
	private Date eday;
	
	
	public Route(){}


	public Route(int route_code, String username, String routename, String partner_code, Date sday, Date eday) {
		super();
		this.route_code = route_code;
		this.username = username;
		this.routename = routename;
		this.partner_code = partner_code;
		this.sday = sday;
		this.eday = eday;
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


	public Date getSday() {
		return sday;
	}


	public void setSday(Date sday) {
		this.sday = sday;
	}


	public Date getEday() {
		return eday;
	}


	public void setEday(Date eday) {
		this.eday = eday;
	}


	@Override
	public String toString() {
		return "Route [route_code=" + route_code + ", username=" + username + ", routename=" + routename
				+ ", partner_code=" + partner_code + ", sday=" + sday + ", eday=" + eday + "]";
	}


	
	
	
}
