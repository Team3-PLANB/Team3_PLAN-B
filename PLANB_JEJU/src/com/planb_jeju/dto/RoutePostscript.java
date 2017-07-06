package com.planb_jeju.dto;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

public class RoutePostscript {
	private int route_postscript_rownum;
	private String routename;
	private String route_thumbnail;
	private String comment;
	private Date writetime;
	private int hitnum;
	private int likenum;
	private String username;
	private int route_code;
	
	// 태그 리스트
	private List<RoutePostscriptTag> routePostscriptTag;
	
	// 로그인한 사용자의 찜콩 여부
	private String route_like;
	
	public RoutePostscript(){}

	public RoutePostscript(int route_postscript_rownum, String routename, String route_thumbnail, String comment,
			Date writetime, int hitnum, int likenum, String username, int route_code,
			List<RoutePostscriptTag> routePostscriptTag, String route_like) throws ParseException {
		super();
		this.route_postscript_rownum = route_postscript_rownum;
		this.routename = routename;
		this.route_thumbnail = route_thumbnail;
		this.comment = comment;
		this.writetime = writetime;
		this.hitnum = hitnum;
		this.likenum = likenum;
		this.username = username;
		this.route_code = route_code;
		this.routePostscriptTag = routePostscriptTag;
		this.route_like = route_like;
	}

	public int getRoute_postscript_rownum() {
		return route_postscript_rownum;
	}

	public void setRoute_postscript_rownum(int route_postscript_rownum) {
		this.route_postscript_rownum = route_postscript_rownum;
	}

	public String getRoutename() {
		return routename;
	}

	public void setRoutename(String routename) {
		this.routename = routename;
	}

	public String getRoute_thumbnail() {
		return route_thumbnail;
	}

	public void setRoute_thumbnail(String route_thumbnail) {
		this.route_thumbnail = route_thumbnail;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getWritetime() {
		return writetime;
	}

	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}

	public int getHitnum() {
		return hitnum;
	}

	public void setHitnum(int hitnum) {
		this.hitnum = hitnum;
	}

	public int getLikenum() {
		return likenum;
	}

	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getRoute_code() {
		return route_code;
	}

	public void setRoute_code(int route_code) {
		this.route_code = route_code;
	}

	public List<RoutePostscriptTag> getRoutePostscriptTag() {
		return routePostscriptTag;
	}

	public void setRoutePostscriptTag(List<RoutePostscriptTag> routePostscriptTag) {
		this.routePostscriptTag = routePostscriptTag;
	}

	public String getRoute_like() {
		return route_like;
	}

	public void setRoute_like(String route_like) {
		this.route_like = route_like;
	}

	@Override
	public String toString() {
		return "RoutePostscript [route_postscript_rownum=" + route_postscript_rownum + ", routename=" + routename
				+ ", route_thumbnail=" + route_thumbnail + ", comment=" + comment + ", writetime=" + writetime
				+ ", hitnum=" + hitnum + ", likenum=" + likenum + ", username=" + username + ", route_code="
				+ route_code + ", routePostscriptTag=" + routePostscriptTag + ", route_like=" + route_like + "]";
	}
}
