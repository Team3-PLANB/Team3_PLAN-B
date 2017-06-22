package com.planb_jeju.dto;


public class SitePostscriptLike {
	private int site_postscript_like_rownum;
	private int site_postscript_rownum;
	private String username;
	
	public SitePostscriptLike(){}

	public SitePostscriptLike(int site_postscript_like_rownum, int site_postscript_rownum, String username) {
		super();
		this.site_postscript_like_rownum = site_postscript_like_rownum;
		this.site_postscript_rownum = site_postscript_rownum;
		this.username = username;
	}

	public int getSite_postscript_like_rownum() {
		return site_postscript_like_rownum;
	}

	public void setSite_postscript_like_rownum(int site_postscript_like_rownum) {
		this.site_postscript_like_rownum = site_postscript_like_rownum;
	}

	public int getSite_postscript_rownum() {
		return site_postscript_rownum;
	}

	public void setSite_postscript_rownum(int site_postscript_rownum) {
		this.site_postscript_rownum = site_postscript_rownum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "SitePostscriptLike [site_postscript_like_rownum=" + site_postscript_like_rownum
				+ ", site_postscript_rownum=" + site_postscript_rownum + ", username=" + username + "]";
	}
}
