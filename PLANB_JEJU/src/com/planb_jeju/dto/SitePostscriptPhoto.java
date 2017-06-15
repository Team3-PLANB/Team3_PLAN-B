package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class SitePostscriptPhoto {
	private int site_postscript_photo_rownum;
	private int site_postscript_rownum;
	private String photo_src;
	
	public SitePostscriptPhoto(){}

	public SitePostscriptPhoto(int site_postscript_photo_rownum, int site_postscript_rownum, String photo_src) {
		super();
		this.site_postscript_photo_rownum = site_postscript_photo_rownum;
		this.site_postscript_rownum = site_postscript_rownum;
		this.photo_src = photo_src;
	}

	public int getSite_postscript_photo_rownum() {
		return site_postscript_photo_rownum;
	}

	public void setSite_postscript_photo_rownum(int site_postscript_photo_rownum) {
		this.site_postscript_photo_rownum = site_postscript_photo_rownum;
	}

	public int getSite_postscript_rownum() {
		return site_postscript_rownum;
	}

	public void setSite_postscript_rownum(int site_postscript_rownum) {
		this.site_postscript_rownum = site_postscript_rownum;
	}

	public String getPhoto_src() {
		return photo_src;
	}

	public void setPhoto_src(String photo_src) {
		this.photo_src = photo_src;
	}

	@Override
	public String toString() {
		return "site_postscript_photo [site_postscript_photo_rownum=" + site_postscript_photo_rownum
				+ ", site_postscript_rownum=" + site_postscript_rownum + ", photo_src=" + photo_src + "]";
	}


		

	
}
