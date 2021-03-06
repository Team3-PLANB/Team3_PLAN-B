package com.planb_jeju.dto;


public class RoutePostscriptLike {	
	private int route_postscript_like_rownum;
	private int route_postscript_rownum;
	private String username;
	
	public RoutePostscriptLike(){}

	public RoutePostscriptLike(int route_postscript_like_rownum, int route_postscript_rownum, String username) {
		super();
		this.route_postscript_like_rownum = route_postscript_like_rownum;
		this.route_postscript_rownum = route_postscript_rownum;
		this.username = username;
	}

	public int getRoute_postscript_like_rownum() {
		return route_postscript_like_rownum;
	}

	public void setRoute_postscript_like_rownum(int route_postscript_like_rownum) {
		this.route_postscript_like_rownum = route_postscript_like_rownum;
	}

	public int getRoute_postscript_rownum() {
		return route_postscript_rownum;
	}

	public void setRoute_postscript_rownum(int route_postscript_rownum) {
		this.route_postscript_rownum = route_postscript_rownum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "RoutePostscriptLike [route_postscript_like_rownum=" + route_postscript_like_rownum
				+ ", route_postscript_rownum=" + route_postscript_rownum + ", username=" + username + "]";
	}
		
}
