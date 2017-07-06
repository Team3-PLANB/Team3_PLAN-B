package com.planb_jeju.dto;

public class Personal {
	private String personal_code;
	private String personal;
	
	public Personal(){}

	public Personal(String personal_code, String personal) {
		super();
		this.personal_code = personal_code;
		this.personal = personal;
	}

	public String getPersonal_code() {
		return personal_code;
	}

	public void setPersonal_code(String personal_code) {
		this.personal_code = personal_code;
	}

	public String getPersonal() {
		return personal;
	}

	public void setPersonal(String personal) {
		this.personal = personal;
	}

	@Override
	public String toString() {
		return "personal [personal_code=" + personal_code + ", personal=" + personal + "]";
	}


	
	
	
	
}
