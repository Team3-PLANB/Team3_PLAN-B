package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;
import java.util.List;

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
	
	// 히스토리
//	private int route_code;
//	private String username;
//	private int route_order;
//	private Date route_date;
	private int update_rownum;
	private String update_reason;
//	private String site;
//	private String lon;
//	private String lat;
//	private String category;
//	private Time stime;
//	private Time etime;
	
	//화면 단에서 java(서버 controller)로 경로 순서대로 여러개 넘길 때 json 타입으로 전달, 받을 수 있는 list필요***
	private List<RouteDetail> routeDetailList;
	
			
	public RouteDetail(){}


	public RouteDetail(int route_code, String username, int route_order, Date route_date, String site, String lon,
			String lat, String category, Time stime, Time etime, int update_rownum, String update_reason,
			List<RouteDetail> routeDetailList) {
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
		this.update_rownum = update_rownum;
		this.update_reason = update_reason;
		this.routeDetailList = routeDetailList;
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


	public int getUpdate_rownum() {
		return update_rownum;
	}


	public void setUpdate_rownum(int update_rownum) {
		this.update_rownum = update_rownum;
	}


	public String getUpdate_reason() {
		return update_reason;
	}


	public void setUpdate_reason(String update_reason) {
		this.update_reason = update_reason;
	}


	public List<RouteDetail> getRouteDetailList() {
		return routeDetailList;
	}


	public void setRouteDetailList(List<RouteDetail> routeDetailList) {
		this.routeDetailList = routeDetailList;
	}


	@Override
	public String toString() {
		return "RouteDetail [route_code=" + route_code + ", username=" + username + ", route_order=" + route_order
				+ ", route_date=" + route_date + ", site=" + site + ", lon=" + lon + ", lat=" + lat + ", category="
				+ category + ", stime=" + stime + ", etime=" + etime + ", update_rownum=" + update_rownum
				+ ", update_reason=" + update_reason + ", routeDetailList=" + routeDetailList + "]";
	}
	
	
}
