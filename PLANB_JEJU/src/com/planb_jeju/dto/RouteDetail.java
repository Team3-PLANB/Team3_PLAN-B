package com.planb_jeju.dto;

import java.util.List;

public class RouteDetail {
	private String routename;
	
	private int route_code;
	private String username;
	private int route_order;
	private String route_date;
	private String site;
	private String lon;
	private String lat;
	private String category;
	private String category_name;
	private String stime;
	private String etime;
	
	private int update_rownum;
	private String update_reason;
	
	//화면 단에서 java(서버 controller)로 경로 순서대로 여러개 넘길 때 json 타입으로 전달, 받을 수 있는 list필요***
	private List<RouteDetail> routeDetailList;
	
			
	public RouteDetail(){}


	public RouteDetail(String routename, int route_code, String username, int route_order, String route_date,
			String site, String lon, String lat, String category, String category_name, String stime, String etime,
			int update_rownum, String update_reason, List<RouteDetail> routeDetailList) {
		super();
		this.routename = routename;
		this.route_code = route_code;
		this.username = username;
		this.route_order = route_order;
		this.route_date = route_date;
		this.site = site;
		this.lon = lon;
		this.lat = lat;
		this.category = category;
		this.category_name = category_name;
		this.stime = stime;
		this.etime = etime;
		this.update_rownum = update_rownum;
		this.update_reason = update_reason;
		this.routeDetailList = routeDetailList;
	}


	public String getRoutename() {
		return routename;
	}


	public void setRoutename(String routename) {
		this.routename = routename;
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


	public String getRoute_date() {
		return route_date;
	}


	public void setRoute_date(String route_date) {
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


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public String getStime() {
		return stime;
	}


	public void setStime(String stime) {
		this.stime = stime;
	}


	public String getEtime() {
		return etime;
	}


	public void setEtime(String etime) {
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
		return "RouteDetail [routename=" + routename + ", route_code=" + route_code + ", username=" + username
				+ ", route_order=" + route_order + ", route_date=" + route_date + ", site=" + site + ", lon=" + lon
				+ ", lat=" + lat + ", category=" + category + ", category_name=" + category_name + ", stime=" + stime
				+ ", etime=" + etime + ", update_rownum=" + update_rownum + ", update_reason=" + update_reason
				+ ", routeDetailList=" + routeDetailList + "]";
	}	
}
