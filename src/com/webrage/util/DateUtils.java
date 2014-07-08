/*
 * DateUtils.java
 *
 * Created on 2007-10-13, 13:23:41
 *
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webrage.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtils {

	/**
	 * 取得某年某月有多少天
	 *
	 * @param year
	 * @param mon
	 * @return
	 */
	public static int getDaysInMonth(int year, int mon) {
		java.util.GregorianCalendar date = new java.util.GregorianCalendar(year, mon - 1, 1);
		return date.getActualMaximum(Calendar.DATE);
	}

	/**
	 * 取得试用提示标记
	 *
	 * @param curDate
	 *			当前时间
	 * @param tipDateStr
	 *			开始提示时间：2007-07-01
	 * @param endDateStr
	 *			结束使用时间：2007-08-01
	 * @return 0正常使用 -1结束使用 num试用日期还剩多少天
	 */
	public static int getUseTipFlag(Date curDate, String tipDateStr, String endDateStr) {
		String[] tipStr = tipDateStr.split("-");
		String[] endStr = endDateStr.split("-");
		GregorianCalendar tipDate = new GregorianCalendar(Integer.parseInt(tipStr[0]), Integer.parseInt(tipStr[1]) - 1, Integer.parseInt(tipStr[2]));
		GregorianCalendar endDate = new GregorianCalendar(Integer.parseInt(endStr[0]), Integer.parseInt(endStr[1]) - 1, Integer.parseInt(endStr[2]));
		if (tipDate.getTimeInMillis() <= curDate.getTime() && curDate.getTime() <= endDate.getTimeInMillis()) {
			return getDaysInYear(endDate.getTime()) - getDaysInYear(curDate);
		} else if (curDate.getTime() > endDate.getTimeInMillis()) {
			return -1;
		}
		return 0;
	}

	/**
	 * 取得当前日期是一年中的哪一天
	 *
	 * @param date
	 * @return
	 */
	public static int getDaysInYear(Date date) {
		Calendar cal = Calendar.getInstance();
		GregorianCalendar gcal = new GregorianCalendar();
		gcal.setGregorianChange(date);
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 将date日期参数里面的时间以 str 时间替换后返回一个新的date
	 *
	 * @param str
	 *			"hh:mm:ss"
	 * @return
	 */
	public static Date getDateByTimeString(Date date, String str) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String[] timeStr = str.split(":");
		GregorianCalendar newDate;
		try {
			newDate = new GregorianCalendar(year, month, day, Integer.parseInt(timeStr[0]), Integer.parseInt(timeStr[1]), Integer.parseInt(timeStr[2]));
		} catch (Exception ex) {
			return null;
		}

		return newDate.getTime();
	}

	/**
	 * 根据字符串返回日期
	 *
	 * @param str
	 *			"yyyy/MM/dd hh:mm:ss"
	 * @param dateFormat
	 *			日期格式（/ -）如：yyyy-MM-dd yy/MM/dd
	 * @return
	 * @throws ParseException
	 */
	public static Calendar getCalendarByString(String str, String dateFormat) throws ParseException {
		/*String[] strs = str.split(" ");
		String str1 = strs[0];
		String str2 = strs[1];
		String[] str1s = str1.split(delimit);
		String[] str2s = str2.split(":");
		GregorianCalendar newDate;
		//SimpleDateFormat;
		try {
		if ( str2s.length > 0 )
		newDate = new GregorianCalendar(Integer.parseInt(str1s[0]), Integer
		.parseInt(str1s[1]) - 1, Integer.parseInt(str1s[2]),
		Integer.parseInt(str2s[0]), Integer.parseInt(str2s[1]),
		Integer.parseInt(str2s[2]));
		else
		newDate = new GregorianCalendar(Integer.parseInt(str1s[0]), Integer
		.parseInt(str1s[1]) - 1, Integer.parseInt(str1s[2]));
		} catch (Exception ex) {
		return null;
		}*/
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);
		Date date = simpleDateFormat.parse(str);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar;
	}

	/**
	 * 时间增长 返回一个新的时间对象
	 *
	 * @param calendar
	 *			时间
	 * @param field
	 *			增加的时间�分
	 * @param count
	 *			增加的值
	 * @return 增加后的时间值
	 */
	public static Calendar incCalendar(Calendar calendar, int field, int count) {
		Calendar newCalendar = (Calendar) calendar.clone();
		newCalendar.add(field, count);
		//System.out.println("incCalendar"+newCalendar.getTime().toLocaleString());
		return newCalendar;
	}

	/**
	 * 根据字符串返回日期
	 *
	 * @param str
	 *			"yyyy/MM/dd hh:mm:ss"
	 * @return
	 */
	public static Date getDateByString(String str) {
		String[] strs = str.split(" ");
		String str1 = strs[0];
		String str2 = strs[1];
		String[] str1s = str1.split("/");
		String[] str2s = str2.split(":");
		GregorianCalendar newDate;
		try {
			newDate = new GregorianCalendar(Integer.parseInt(str1s[0]), Integer.parseInt(str1s[1]) - 1, Integer.parseInt(str1s[2]), Integer.parseInt(str2s[0]), Integer.parseInt(str2s[1]), Integer.parseInt(str2s[2]));
		} catch (Exception ex) {
			return null;
		}

		return newDate.getTime();
	}

	/**
	 * 根据字符串返回日期
	 *
	 * @param str
	 *			"yyyy/MM/dd hh:mm:ss"
	 * @param delimit
	 *			日期分隔符（/ -）如：yyyy-MM-dd yy/MM/dd
	 * @return
	 */
	public static Date getDateByString(String str, String delimit) {
		String[] strs = str.split(" ");
		String str1 = strs[0];
		String str2 = strs[1];
		String[] str1s = str1.split(delimit);
		String[] str2s = str2.split(":");
		GregorianCalendar newDate;
		try {
			newDate = new GregorianCalendar(Integer.parseInt(str1s[0]), Integer.parseInt(str1s[1]) - 1, Integer.parseInt(str1s[2]), Integer.parseInt(str2s[0]), Integer.parseInt(str2s[1]), Integer.parseInt(str2s[2]));
		} catch (Exception ex) {
			return null;
		}

		return newDate.getTime();
	}

	/**
	 * 根据日期返回日期里的时间（以毫秒返回）
	 *
	 * @param str
	 *			"yyyy/MM/dd hh:mm:ss"
	 * @return
	 */
	public static long getTimeInMillisByDate(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int h = cal.get(Calendar.HOUR_OF_DAY);
		int m = cal.get(Calendar.MINUTE);
		int s = cal.get(Calendar.SECOND);
		int ms = cal.get(Calendar.MILLISECOND);
		return (h * 60 * 60 * 1000) + (m * 60 * 1000) + (s * 1000) + ms;
	}

	/**
	 * 按指定格式把日期转成字符串
	 *
	 * @param d
	 *			日期
	 * @param delimit
	 *			日期分隔符（/ -）如：yyyy-MM-dd yy/MM/dd
	 * @return
	 */
	public static String getTimeStringFromDate(Date d, String delimit) {
		String result = null;
		if (d == null) {
			return "";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy" + delimit + "MM" + delimit + "dd");
		SimpleDateFormat df2 = new SimpleDateFormat("HH:mm:ss");
		result = df.format(d) + " " + df2.format(d);
		return result;
	}

	/**
	 * 按指定格式把日期转成字符串
	 *
	 * @param d	日期
	 * @param yyyy-MM-dd  yy/MM/dd
	 * @return
	 */
	public static String formatDate(Date d, String formatStr) {
		String result = null;
		if (d == null) {
			return "";
		}
		if (formatStr == null) {
			return ":";
		}
		SimpleDateFormat df = new SimpleDateFormat(formatStr);
		result = df.format(d);
		//System.out.println("formatDate"+result);
		return result;
	}

	/**
	 * 带日期的时间比较
	 * @param date
	 * @param hour
	 * @param minute
	 * @param second
	 * @return 0表示相等,小于0表示date小于这个时间,大于0表示date大于这个时间
	 */
	public static int compareTime(Date date, int hour, int minute, int second) {
		Calendar curTime = Calendar.getInstance();
		curTime.setTime(date);
		Calendar compareTime = Calendar.getInstance();
		compareTime.setTime(date);
		compareTime.set(Calendar.HOUR_OF_DAY, hour);
		compareTime.set(Calendar.MINUTE, minute);
		compareTime.set(Calendar.SECOND, second);
		return curTime.compareTo(compareTime);
	}

	/**
	 * 把日期转成字符串
	 *
	 * @param d
	 *			日期
	 * @return
	 */
	public static String getTimeStringFromDate(Date d) {
		String result = null;
		if (d == null) {
			return "";
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df2 = new SimpleDateFormat("HH:mm:ss");
		result = df.format(d) + " " + df2.format(d);
		return result;
	}
	/**
	 * 取得输入日期前(-)/后(+)n个月的相对应的一天
	 * @param n int +/-
	 * @return
	 */
	public static Date getMonthBeforeCurrentDay(Date date, int n) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, n);
		date = calendar.getTime();
		return date;

	}
	/**  
	 * 得到输入日期当月的第一天
	 * @return
	 */  
	public static Date getMonthFirstDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}   
	  
	/**
	 * 得到输入日期当月的最后一天
	 *   
	 * @return
	 */  
	public static Date getMonthLastDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}
	/**
	 * 获取当年第一天
	 * @return
	 */
	public static Date getYearFirstDay(Date date){  
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_YEAR, 1);
		return calendar.getTime();  
	 }
	/**
	 * 获取当年最后一天
	 * @return
	 */
	public static Date getYearLastDay(Date date){
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String year = df.format(date);
			date = sdf.parse(year+"-12-31");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	 }
	/**
	 * 转换秒数至小时,天
	 * @param Seconds
	 * @return
	 */
	public static String convertTime(int num) {
		int minutes = num/60;
		int seconds = num-minutes*60; // 减去转成分钟的秒数
		int hours = minutes/60;
		minutes = minutes-hours*60; // 减去转成小时的分钟数
		int days = hours/24;
		hours = hours-days*24; // 减去转成天的小时数
		String dhms = (days == 0 ? "" : days+"天")+
					(hours == 0 ? "" : hours+"小时")+
					(minutes == 0 ? "" : minutes+"分钟")+
					(seconds == 0 ? "" : seconds+"秒");
		return dhms;
	}
	/**
	 * 计算时间差
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static long getInterval(Date date1, Date date2) {
		long diff = date1.getTime() - date2.getTime();
		long days = Math.abs(diff) / (1000 * 60 * 60 * 24);
		return days;
	}
}