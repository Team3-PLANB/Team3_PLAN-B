package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class RoutePostscriptTag {
	private int route_postscript_tag_rownum;
	private int route_postscript_rownum;
	private String tag;
	
	public RoutePostscriptTag(){}

	public RoutePostscriptTag(int route_postscript_tag_rownum, int route_postscript_rownum, String tag) {
		super();
		this.route_postscript_tag_rownum = route_postscript_tag_rownum;
		this.route_postscript_rownum = route_postscript_rownum;
		this.tag = tag;
	}

	public int getRoute_postscript_tag_rownum() {
		return route_postscript_tag_rownum;
	}

	public void setRoute_postscript_tag_rownum(int route_postscript_tag_rownum) {
		this.route_postscript_tag_rownum = route_postscript_tag_rownum;
	}

	public int getRoute_postscript_rownum() {
		return route_postscript_rownum;
	}

	public void setRoute_postscript_rownum(int route_postscript_rownum) {
		this.route_postscript_rownum = route_postscript_rownum;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "route_postscript_tag [route_postscript_tag_rownum=" + route_postscript_tag_rownum
				+ ", route_postscript_rownum=" + route_postscript_rownum + ", tag=" + tag + "]";
	}

	
}
