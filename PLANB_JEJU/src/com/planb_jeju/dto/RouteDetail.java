package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class RouteDetail {
	private int route_code;
	private String username;
	private int route_order;
	private Date route_date;
	private String site;
	private String lon;
	private String lat;
	private String category;
	private Time stime;
	private Time etime;
			
	public RouteDetail(){}

	public RouteDetail(int route_code, String username, int route_order, Date route_date, String site, String lon,
			String lat, String category, Time stime, Time etime) {
		super();
		this.route_code = route_code;
		this.username = username;
		this.route_order = route_order;
		this.route_date = route_date;
		this.site = site;
		this.lon = lon;
		this.lat = lat;
		this.category = category;
		this.stime = stime;
		this.etime = etime;
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

	public int getRoute_order() {
		return route_order;
	}

	public void setRoute_order(int route_order) {
		this.route_order = route_order;
	}

	public Date getRoute_date() {
		return route_date;
	}

	public void setRoute_date(Date route_date) {
		this.route_date = route_date;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Time getStime() {
		return stime;
	}

	public void setStime(Time stime) {
		this.stime = stime;
	}

	public Time getEtime() {
		return etime;
	}

	public void setEtime(Time etime) {
		this.etime = etime;
	}

	@Override
	public String toString() {
		return "route_detail [route_code=" + route_code + ", username=" + username + ", route_order=" + route_order
				+ ", route_date=" + route_date + ", site=" + site + ", lon=" + lon + ", lat=" + lat + ", category="
				+ category + ", stime=" + stime + ", etime=" + etime + "]";
	}
	
	
	
	
	
}
