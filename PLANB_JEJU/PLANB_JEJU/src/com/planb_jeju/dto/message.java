package com.planb_jeju.dto;

import java.sql.Time;
import java.util.Date;

public class message {
	private int message_rownum;
	private int first_message_rownum;
	private Time sendtime;
	private int read_status;
	private String comment;
	private String sendperson;
	private String reiceiveperson;
	
	public message(){}

	public message(int message_rownum, int first_message_rownum, Time sendtime, int read_status, String comment,
			String sendperson, String reiceiveperson) {
		super();
		this.message_rownum = message_rownum;
		this.first_message_rownum = first_message_rownum;
		this.sendtime = sendtime;
		this.read_status = read_status;
		this.comment = comment;
		this.sendperson = sendperson;
		this.reiceiveperson = reiceiveperson;
	}

	public int getMessage_rownum() {
		return message_rownum;
	}

	public void setMessage_rownum(int message_rownum) {
		this.message_rownum = message_rownum;
	}

	public int getFirst_message_rownum() {
		return first_message_rownum;
	}

	public void setFirst_message_rownum(int first_message_rownum) {
		this.first_message_rownum = first_message_rownum;
	}

	public Time getSendtime() {
		return sendtime;
	}

	public void setSendtime(Time sendtime) {
		this.sendtime = sendtime;
	}

	public int getRead_status() {
		return read_status;
	}

	public void setRead_status(int read_status) {
		this.read_status = read_status;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getSendperson() {
		return sendperson;
	}

	public void setSendperson(String sendperson) {
		this.sendperson = sendperson;
	}

	public String getReiceiveperson() {
		return reiceiveperson;
	}

	public void setReiceiveperson(String reiceiveperson) {
		this.reiceiveperson = reiceiveperson;
	}

	@Override
	public String toString() {
		return "message [message_rownum=" + message_rownum + ", first_message_rownum=" + first_message_rownum
				+ ", sendtime=" + sendtime + ", read_status=" + read_status + ", comment=" + comment + ", sendperson="
				+ sendperson + ", reiceiveperson=" + reiceiveperson + "]";
	}
	
}
