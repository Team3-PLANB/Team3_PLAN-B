package com.planb_jeju.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class dateEx {
	public static void main(String[] args){
		String dateStr = "Mon Jul 03 00:00:00 KST 2017";
	    DateFormat readFormat = new SimpleDateFormat( "EEE MMM dd yyyy hh:mm aaa");

	    DateFormat writeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
	    Date date = null;
	    try {
	       date = readFormat.parse( dateStr );
	    } catch ( ParseException e ) {
	        e.printStackTrace();
	    }

	    String formattedDate = "";
	    if( date != null ) {
	    formattedDate = writeFormat.format( date );
	    }

	    System.out.println(formattedDate);
		
		/*String s = "2014-05-01";
		String e = "2014-05-10";
		LocalDate start = LocalDate.parse(s);
		LocalDate end = LocalDate.parse(e);
		List<LocalDate> totalDates = new ArrayList<>();
		while (!start.isAfter(end)) {
		    totalDates.add(start);
		    start = start.plusDays(1);
		}
		
		System.out.println(totalDates.toString());*/
		
}
}
