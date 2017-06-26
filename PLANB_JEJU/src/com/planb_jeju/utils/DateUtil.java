package com.planb_jeju.utils;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtil {

    /**
     * 오늘 날짜 구하기
     *
     * @param format 날짜형식
     * @return
     */
    public static String getToday(String format) {
        SimpleDateFormat formatter = new SimpleDateFormat(format, Locale.KOREA);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    /**
     * 어제 날짜 구하기
     *
     * @param format
     * @return
     */
    public static String getYesterday(String format) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);

        Date date = cal.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(format, Locale.KOREA);

        return formatter.format(date);
    }

    /**
     * 오늘 날짜 구하기
     *
     * @return
     */
    public static String getToday() {
        return getToday("yyyy-MM-dd");
    }

    /**
     * 내일 날짜 구하기
     *
     * @param format
     * @return
     */
    public static String getTommrow(String format) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 1);

        Date date = cal.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(format, Locale.KOREA);

        return formatter.format(date);
    }

    /**
     * 결제시 받은 expries date 값을 한국시간으로 변경
     *
     * @param dateLong
     * @return
     */
    public static String getDate(Long dateLong) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(dateLong);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.KOREA);
        String result = formatter.format(cal.getTime());

        return result;
    }

    /**
     * 현재 시간
     *
     * @return hour 24시간
     */
    public static String getNowHour() {
        SimpleDateFormat formatter = new SimpleDateFormat("HH", Locale.KOREA);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    /**
     * 현재 시각
     *
     * @return
     */
    public static String getNow() {
        return getNow("yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 현재 시각
     *
     * @param format
     * @return
     */
    public static String getNow(String format) {
        SimpleDateFormat formatter = new SimpleDateFormat(format, Locale.KOREA);
        Date currentTime = new Date();
        return formatter.format(currentTime);
    }

    /**
     * 생년월일 YYYYMMDD 형식으로 변경
     *
     * @param mmddyyyy
     * @return yyyymmdd
     */
    public static String convertBirth(String mmddyyyy) {
        String[] birthday = mmddyyyy.split("/");
        return birthday[2] + birthday[0] + birthday[1];
    }

    public static int convertHour(String time) {
        int hour = 0;

        if (time.equals("TIME00")) hour = 20;
        else if (time.equals("TIME06")) hour = 6;
        else if (time.equals("TIME07")) hour = 7;
        else if (time.equals("TIME08")) hour = 8;
        else if (time.equals("TIME09")) hour = 9;
        else if (time.equals("TIME10")) hour = 10;
        else if (time.equals("TIME11")) hour = 11;
        else if (time.equals("TIME12")) hour = 12;
        else if (time.equals("TIME13")) hour = 13;
        else if (time.equals("TIME14")) hour = 14;
        else if (time.equals("TIME15")) hour = 15;
        else if (time.equals("TIME16")) hour = 16;
        else if (time.equals("TIME17")) hour = 17;
        else if (time.equals("TIME18")) hour = 18;
        else if (time.equals("TIME19")) hour = 19;
        else if (time.equals("TIME20")) hour = 20;
        else if (time.equals("TIME21")) hour = 21;
        else if (time.equals("TIME22")) hour = 22;
        else if (time.equals("TIME23")) hour = 23;
        else throw new AssertionError("Not Found time");

        return hour;
    }

    public static String convertTime(int time) {
        String hour = "";

        if (time == 6) hour = "TIME06";
        else if (time == 7) hour = "TIME07";
        else if (time == 8) hour = "TIME08";
        else if (time == 9) hour = "TIME09";
        else if (time == 10) hour = "TIME10";
        else if (time == 11) hour = "TIME11";
        else if (time == 12) hour = "TIME12";
        else if (time == 13) hour = "TIME13";
        else if (time == 14) hour = "TIME14";
        else if (time == 15) hour = "TIME15";
        else if (time == 16) hour = "TIME16";
        else if (time == 17) hour = "TIME17";
        else if (time == 18) hour = "TIME18";
        else if (time == 19) hour = "TIME19";
        else if (time == 20) hour = "TIME20";
        else if (time == 21) hour = "TIME21";
        else if (time == 22) hour = "TIME22";
        else if (time == 23) hour = "TIME23";

        return hour;
    }

    public static boolean compareDate(long expires_date_ms) {

        boolean usedFlag = false;
        long today_date_ms = System.currentTimeMillis();
        long diff = expires_date_ms - today_date_ms;
        if (diff > 0) {
            usedFlag = true;
        }
        return usedFlag;
    }

    /**
     * 통신후 새 만료일이 기존 만료일보다 클경우
     *
     * @param expires_date_ms
     * @param befor_expires_date
     * @return
     */
    public static boolean compareEndDate(long expires_date_ms, String befor_expires_date) {
        boolean usedFlag = false;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
        Date startday = simpleDateFormat.parse(befor_expires_date, new ParsePosition(0));
        long befor_expires_date_time = startday.getTime();

        long mills = expires_date_ms - befor_expires_date_time;
        if (mills > 0) {
            usedFlag = true;
        }
        return usedFlag;
    }

    public static boolean compareDateSlack(int expires_date) {

        boolean usedFlag = false;
        int today_date = Integer.parseInt(getNow("yyyyMMdd"));
        int diff = expires_date - today_date;
        if (diff >= 0) {
            usedFlag = true;
        }
        return usedFlag;
    }

    /**
     * @return
     */
    public static String payEndDate(int month) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, month);
        cal.add(Calendar.DATE, -1);

        Date date = cal.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.KOREA);


        return formatter.format(date);
    }

    /**
     * 현재 시각 (-초)
     *
     * @param format
     * @param second
     * @return
     */
    public static String getTodaySecSlow(String format, int second) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.SECOND, second);

        Date date = cal.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat(format, Locale.KOREA);

        return formatter.format(date);
    }

}
