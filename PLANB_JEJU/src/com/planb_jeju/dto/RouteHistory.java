package com.planb_jeju.dto;

public class RouteHistory {
	private int route_order;
	private int route_code;
	private String routename;
	private String username;
	private String route_date;
	private int update_rownum;
	private String site;
	private String update_reason;
	
	private String comment;

	public RouteHistory() {}

	public RouteHistory(int route_order, int route_code, String routename, String username, String route_date,
			int update_rownum, String site, String update_reason, String comment) {
		super();
		this.route_order = route_order;
		this.route_code = route_code;
		this.routename = routename;
		this.username = username;
		this.route_date = route_date;
		this.update_rownum = update_rownum;
		this.site = site;
		this.update_reason = update_reason;
		this.comment = comment;
	}

	public int getRoute_order() {
		return route_order;
	}

	public void setRoute_order(int route_order) {
		this.route_order = route_order;
	}

	public int getRoute_code() {
		return route_code;
	}

	public void setRoute_code(int route_code) {
		this.route_code = route_code;
	}
	
	public String getRoutename() {
		return routename;
	}

	public void setRoutename(String routename) {
		this.routename = routename;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRoute_date() {
		return route_date;
	}

	public void setRoute_date(String route_date) {
		this.route_date = route_date;
	}

	public int getUpdate_rownum() {
		return update_rownum;
	}

	public void setUpdate_rownum(int update_rownum) {
		this.update_rownum = update_rownum;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getUpdate_reason() {
		return update_reason;
	}

	public void setUpdate_reason(String update_reason) {
		this.update_reason = update_reason;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
