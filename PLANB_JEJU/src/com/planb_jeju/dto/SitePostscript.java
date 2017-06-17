package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class SitePostscript {
	private int site_postscript_rownum;
	private String site;
	private String category;
	private String health;
	private String inoutside;
	private String cost;
	private String comment;
	private Time writetime;
	private int hitnum;
	private int likenum;
	private String username;
	private int route_code;
	
	// 태그
	private int site_postscript_tag_rownum;
//	private int site_postscript_rownum;
	private String tag;
	
	// 찜콩
	private int site_postscript_like_rownum;
//	private int site_postscript_rownum;
//	private String username;
	
	
	public SitePostscript(){}	

	public SitePostscript(int site_postscript_rownum, String site, String category, String health, String inoutside,
			String cost, String comment, Time writetime, int hitnum, int likenum, String username, int route_code,
			int site_postscript_tag_rownum, String tag, int site_postscript_like_rownum) {
		super();
		this.site_postscript_rownum = site_postscript_rownum;
		this.site = site;
		this.category = category;
		this.health = health;
		this.inoutside = inoutside;
		this.cost = cost;
		this.comment = comment;
		this.writetime = writetime;
		this.hitnum = hitnum;
		this.likenum = likenum;
		this.username = username;
		this.route_code = route_code;
		this.site_postscript_tag_rownum = site_postscript_tag_rownum;
		this.tag = tag;
		this.site_postscript_like_rownum = site_postscript_like_rownum;
	}

	public int getSite_postscript_rownum() {
		return site_postscript_rownum;
	}

	public void setSite_postscript_rownum(int site_postscript_rownum) {
		this.site_postscript_rownum = site_postscript_rownum;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getInoutside() {
		return inoutside;
	}

	public void setInoutside(String inoutside) {
		this.inoutside = inoutside;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
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

	public int getSite_postscript_tag_rownum() {
		return site_postscript_tag_rownum;
	}

	public void setSite_postscript_tag_rownum(int site_postscript_tag_rownum) {
		this.site_postscript_tag_rownum = site_postscript_tag_rownum;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getSite_postscript_like_rownum() {
		return site_postscript_like_rownum;
	}

	public void setSite_postscript_like_rownum(int site_postscript_like_rownum) {
		this.site_postscript_like_rownum = site_postscript_like_rownum;
	}

	@Override
	public String toString() {
		return "SitePostscript [site_postscript_rownum=" + site_postscript_rownum + ", site=" + site + ", category="
				+ category + ", health=" + health + ", inoutside=" + inoutside + ", cost=" + cost + ", comment="
				+ comment + ", writetime=" + writetime + ", hitnum=" + hitnum + ", likenum=" + likenum + ", username="
				+ username + ", route_code=" + route_code + ", site_postscript_tag_rownum=" + site_postscript_tag_rownum
				+ ", tag=" + tag + ", site_postscript_like_rownum=" + site_postscript_like_rownum + "]";
	}	
	
}
