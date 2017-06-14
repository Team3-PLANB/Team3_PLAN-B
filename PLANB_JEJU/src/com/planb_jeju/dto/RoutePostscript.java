package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class RoutePostscript {
	private int route_postscript_rownum;
	private String route_sumnail;
	private String comment;
	private Time writetime;
	private int hitnum;
	private int likenum;
	private String username;
	private int route_code;
	
	public RoutePostscript(){}

	public RoutePostscript(int route_postscript_rownum, String route_sumnail, String comment, Time writetime,
			int hitnum, int likenum, String username, int route_code) {
		super();
		this.route_postscript_rownum = route_postscript_rownum;
		this.route_sumnail = route_sumnail;
		this.comment = comment;
		this.writetime = writetime;
		this.hitnum = hitnum;
		this.likenum = likenum;
		this.username = username;
		this.route_code = route_code;
	}

	public int getRoute_postscript_rownum() {
		return route_postscript_rownum;
	}

	public void setRoute_postscript_rownum(int route_postscript_rownum) {
		this.route_postscript_rownum = route_postscript_rownum;
	}

	public String getRoute_sumnail() {
		return route_sumnail;
	}

	public void setRoute_sumnail(String route_sumnail) {
		this.route_sumnail = route_sumnail;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Time getWritetime() {
		return writetime;
	}

	public void setWritetime(Time writetime) {
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

	@Override
	public String toString() {
		return "route_postscript [route_postscript_rownum=" + route_postscript_rownum + ", route_sumnail="
				+ route_sumnail + ", comment=" + comment + ", writetime=" + writetime + ", hitnum=" + hitnum
				+ ", likenum=" + likenum + ", username=" + username + ", route_code=" + route_code + "]";
	}

	
	
}
