package com.planb_jeju.dto;


public class SitePostscriptTag {

	private int site_postscript_tag_rownum;
	private int site_postscript_rownum;
	private String tag;
	
	public SitePostscriptTag(){}

	public SitePostscriptTag(int site_postscript_tag_rownum, int site_postscript_rownum, String tag) {
		super();
		this.site_postscript_tag_rownum = site_postscript_tag_rownum;
		this.site_postscript_rownum = site_postscript_rownum;
		this.tag = tag;
	}

	public int getSite_postscript_tag_rownum() {
		return site_postscript_tag_rownum;
	}

	public void setSite_postscript_tag_rownum(int site_postscript_tag_rownum) {
		this.site_postscript_tag_rownum = site_postscript_tag_rownum;
	}

	public int getSite_postscript_rownum() {
		return site_postscript_rownum;
	}

	public void setSite_postscript_rownum(int site_postscript_rownum) {
		this.site_postscript_rownum = site_postscript_rownum;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "SitePostscriptTag [site_postscript_tag_rownum=" + site_postscript_tag_rownum
				+ ", site_postscript_rownum=" + site_postscript_rownum + ", tag=" + tag + "]";
	}	

}
