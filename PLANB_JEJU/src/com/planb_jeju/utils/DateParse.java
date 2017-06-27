package com.planb_jeju.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/*
* @FileName : StringParse.java
* @Class : StringParse
* @Project : PLANB_JEJU
* @Date : 2017.06.16
* @LastEditDate : 2017.06.16
* @Author : 강나영
* @Desc : Date Array 만들기
*/

public class DateParse {	
	
	public static List<String> DateToList(Date sdate, Date edate){
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String originSDate = transFormat.format(sdate);
		String originEDate = transFormat.format(edate);
		
		System.out.println("1 :"+originSDate+"/"+originEDate);
		
		String[] sdateList = originSDate.split("-");
		String[] edateList = originEDate.split("-");
	
		Date  startdate = new Date(117, Integer.parseInt(sdateList[1])-1, Integer.parseInt(sdateList[2]));
		Date  enddate = new Date(117, Integer.parseInt(edateList[1])-1, Integer.parseInt(edateList[2]));
		
		// 배열에 마지막 날짜 까지 포함 해 주기 위해 enddate day +1 
		enddate = new Date(enddate.getTime() + (1000 * 60 * 60 * 24));
		
		List<String> dates = new ArrayList<String>();
	    Calendar calendar = new GregorianCalendar();
	    calendar.setTime(startdate);

	    while (calendar.getTime().before(enddate))
	    {
	        String result = transFormat.format(calendar.getTime());
	        dates.add(result);
	        calendar.add(Calendar.DATE, 1);
	    }
	    
	    System.out.println(dates.toString());
	    
	   
	    return dates;	
		
	}
	
	// yyyy-MM-dd 형식으로 들어온 Date 정보 변환
	public static String DateToStringFormat(Date date){
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formatedDate = transFormat.format(date);
		return formatedDate;
	}
}