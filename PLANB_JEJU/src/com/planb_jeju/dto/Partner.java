package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class Partner {
	private String partner_code;
	private String partner;
	
	public Partner(){}

	public Partner(String partner_code, String partner) {
		super();
		this.partner_code = partner_code;
		this.partner = partner;
	}

	public String getPartner_code() {
		return partner_code;
	}

	public void setPartner_code(String partner_code) {
		this.partner_code = partner_code;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	@Override
	public String toString() {
		return "partner [partner_code=" + partner_code + ", partner=" + partner + "]";
	}

	
	
	
}
