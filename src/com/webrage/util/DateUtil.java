package com.webrage.util;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.TimeZone;

/**
 * 日期工具栏
 * @author Administrator
 *
 */
public class DateUtil {

	private static Properties properties = null;
	
	static{
		properties = new Properties();
		try {
			properties.load(DateUtil.class.getResourceAsStream("DateUtil.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 格式化年月日
	 * @param d
	 * @return
	 */
	public static String format(Date d){
		return getFormatYMD().format(d);
	}
	
	public static Date parse(String source){
		try {
			return getFormatYMD().parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Date();
	}
	
	public static Date parse2(String source){
		try {
			return getFormatYMDHMS().parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return new Date();
	}
	
	/**
	 * 格式化年月日时分秒
	 * @param d
	 * @return
	 */
	public static String format2(Date d){
		return getFormatYMDHMS().format(d);
	}
	
	public static Date add(Date date,int field,int amount){
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(field, amount);
		return cal.getTime();
	}
	
	/**
	 * 跳转到本月结尾
	 * @param date
	 * @return
	 */
	public static Date end2Month(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.MONTH, 1);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		return cal.getTime();
	}
	
	/**
	 * 跳转到本周结尾
	 * @param date
	 * @return
	 */
	public static Date end2Week(Date date){
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 跳转到年末
	 * @param date
	 * @return
	 */
	public static Date end2Year(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.YEAR, 1);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		return cal.getTime();
	}
	
	
	/**
	 * 返回的是 上午 下午
	 * @return
	 */
	public static String[] getAmPmStrings() {
		DateFormatSymbols dfs = DateFormatSymbols.getInstance();
		return dfs.getAmPmStrings();
	}

	/**
	 * 获取日
	 * @param date
	 * @return
	 */
	public static int getDayOfMonth(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 获取星期几
	 * 
	 * @param date
	 * @return
	 */
	public static int getDayOfWeek(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_WEEK);
	}
	
	/**
	 * 获取当前日期是当年的第几天
	 * 
	 * @param date
	 * @return
	 */
	public static int getDayOfYear(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_YEAR);
	}
	
	/**
	 * 获取出入时间所在月份有多少天
	 *
	 * @param mon
	 * @return
	 */
	public static int getDaysInMonth(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.getActualMaximum(Calendar.DATE);
	}
	
	/**
	 * 获取最大出入月份有多少天
	 *
	 * @param mon
	 * @return
	 */
	public static int getDaysInMonth(int month) {
		Calendar cal = newCalendar();
		cal.set(Calendar.MONTH, month - 1);
		return cal.getActualMaximum(Calendar.DATE);
	}
	
	/**
	 * 获取当前时间是今年的多少天
	 *
	 * @param date
	 * @return
	 */
	public static int getDaysInYear(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_YEAR);
	}

	/**
	 * 获取两个时间的相差秒数
	 * 
	 * @param oldDate
	 * @param newDate
	 * @return
	 */
	public static long getDiffDay(Date oldDate, Date newDate) {
		long diff = 0;
		// if moved to a later date
		if (newDate.getTime() > oldDate.getTime()) {

			diff = newDate.getTime() - oldDate.getTime();
		} else {

			diff = (-1) * (oldDate.getTime() - newDate.getTime());
		}
		return diff;
	}
	
	
	/**
	 * 获得两个时间相差的分钟数
	 * @param startDate
	 * @param end
	 * @return minutes
	 */
	public static long getDiffMinutes(Date startDate, Date endDate) {
		return (Math.abs((endDate.getTime()-startDate.getTime()))/1000/60);
	}


	/**
	 * 返回的是 公元 公元前
	 * @return
	 */
	public static String[] getEras() {
		DateFormatSymbols dfs = DateFormatSymbols.getInstance();
		return dfs.getEras();
	}

	public static SimpleDateFormat getFormat(String key){
		return new SimpleDateFormat(getFormatString(key));
	}

	private static String getFormatString(String key) {
		return 	properties.getProperty(key,"yyyy-MM-dd");
	}
	
	public static SimpleDateFormat getFormatTime() {
		return new SimpleDateFormat(getFormatString("time"));
	}
	
	public static SimpleDateFormat getFormatY() {
		return new SimpleDateFormat(getFormatString("y"));
	}
	
	public static SimpleDateFormat getFormatYM() {
		return new SimpleDateFormat(getFormatString("ym"));
	}
	
	public static SimpleDateFormat getFormatYMD() {
		return new SimpleDateFormat(getFormatString("ymd"));
	}
	
	public static SimpleDateFormat getFormatYMDHM() {
		return new SimpleDateFormat(getFormatString("ymdhm"));
	}
	
	public static SimpleDateFormat getFormatYMDHMS() {
		return new SimpleDateFormat(getFormatString("ymdhms"));
	}

	/**
	 * 获取时
	 * 
	 * @param date
	 * @return
	 */
	public static int getHourOfDay(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 获取分
	 * 
	 * @param date
	 * @return
	 */
	public static int getMinuteOfHour(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.MINUTE);
	}

	/**
	 * 今天已经过了多少分钟
	 * @param date
	 * @return
	 */
	public static int getMinutesOfDay(Date date) {
		if (date == null)
			return 0;

		long diffMinutes = getDiffMinutes(move2Morning(date), date);

		return (int) diffMinutes;
	}

	
	/**
	 * 今天还有多少分钟
	 * @param date
	 * @return
	 */
	public static int getMinutesOfRestDay(Date date) {
		if (date == null)
			return 0;

		// count minutes to midnight
		int sum = 0;

		Calendar cal = new GregorianCalendar();
		cal.setTime(date);

		int minute = cal.get(Calendar.MINUTE);
		int hour = cal.get(Calendar.HOUR_OF_DAY);

		// add the minutes up to the next hour
		sum = 60 - minute;

		// for each hour, until midnight, add 60 minutes
		int fac = 23 - hour;
		sum = sum + fac * 60;

		return sum;
	}

	
	/**获取月
	 * @param date
	 * @return
	 */
	public static int getMonth(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	}

	/**
	 * 获取给定时间月的中文
	 * @param date
	 * @return
	 */
	public static String getMonthName(Date date) {
		DateFormat format = new SimpleDateFormat("MMMM", Locale.getDefault());
		format.setTimeZone(TimeZone.getDefault());
		return format.format(date);
	}

	/**
	 * 获取给定月的中文
	 * @param index
	 * @return
	 */
	public static String getMonthName(int index) {
		if (index >= 1 && index <= 12) {
			DateFormatSymbols dfs = DateFormatSymbols.getInstance();
			return dfs.getMonths()[index - 1];
		}
		return null;
	}
	
	/**
	 * 获取当前月
	 * @param index
	 * @return
	 */
	public static String getMonthShortName(int index) {
		if (index >= 1 && index <= 12) {
			DateFormatSymbols dfs = DateFormatSymbols.getInstance();
			if (Locale.getDefault().equals(Locale.SIMPLIFIED_CHINESE)) {
				String ms[] = { "1\u6708", "2\u6708", "3\u6708", "4\u6708",
						"5\u6708", "6\u6708", "7\u6708", "8\u6708", "9\u6708",
						"10\u6708", "11\u6708", "12\u6708" };
				dfs.setShortMonths(ms);
			}
			return dfs.getShortMonths()[index - 1];
		}
		return null;
	}

	/**
	 *获取一周的开始
	 * @param date
	 * @return
	 */
	public static Date getStartOfWeek(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 获取星期几
	 * @param date
	 * @return
	 */
	public static String getWeekName(Date date) {
		DateFormat format = new SimpleDateFormat("EEEEE", Locale.getDefault());
		format.setTimeZone(TimeZone.getDefault());
		return format.format(date);
	}

	/**
	 * 获取星期几
	 * @param index
	 * @return
	 */
	public static String getWeekName(int index) {
		if (index >= 1 && index <= 7) {
			DateFormatSymbols dfs = DateFormatSymbols.getInstance();
			return dfs.getWeekdays()[index];
		}
		return null;
	}
	
	/**
	 * 
	 * @return
	 */
	public static String[] getWeekNames() {
		String[] week = new String[7];

		Calendar cal = Calendar.getInstance();
		Map<String, Integer> map = cal.getDisplayNames(Calendar.DAY_OF_WEEK,
				Calendar.SHORT, Locale.getDefault());

		for (String key : map.keySet()) {
			Integer i = map.get(key);
			week[i - 1] = key;
		}
		return week;
	}

	/**
	 * 获取星期几
	 * @param index
	 * @return
	 */
	public static String getWeekShortName(int index) {
		if (index >= 1 && index <= 7) {
			DateFormatSymbols dfs = DateFormatSymbols.getInstance();
			if (Locale.getDefault().equals(Locale.SIMPLIFIED_CHINESE)) {
				String ws[] = { "", "\u65E5", "\u4E8C", "\u4E00", "\u4E09",
						"\u56DB", "\u4E94", "\u516D" };
				dfs.setShortWeekdays(ws);
			}
			return dfs.getShortWeekdays()[index];
		}
		return null;
	}
	
	/**
	 * 获取年
	 * @param date
	 * @return
	 */
	public static int getYear(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		return cal.get(Calendar.YEAR);

	}
	

	/**
	 * True 判断 date1 是否 date2前面
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean isBeforeDay(Date d1, Date d2) {
		int dy1 = getDayOfYear(d1);
		int dy2 = getDayOfYear(d2);

		int y1 = getYear(d1);
		int y2 = getYear(d2);

		if (y1 < y2)
			return true;
		if (y1 > y2)
			return false;

		return (dy1 < dy2);
	}
	
	
	/**
	 * 判断是否是同一天
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean isSameDay(Date d1, Date d2) {
		if (d1 == null || d2 == null)
			return false;

		GregorianCalendar cal1 = new GregorianCalendar();
		cal1.setTime(d1);
		GregorianCalendar cal2 = new GregorianCalendar();
		cal2.setTime(d2);
		if (cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR))
			if (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR))
				return true;
		return false;
	}
	
	/**
	 * 判断两个日期是否是所在年同一天
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean isSameDayOfYear(Date d1, Date d2) {
		GregorianCalendar cal1 = new GregorianCalendar();
		cal1.setTime(d1);
		GregorianCalendar cal2 = new GregorianCalendar();
		cal2.setTime(d2);
		if (cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR))
			return true;
		return false;
	}
	
	/**
	 *判断是否是同一月
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean isSameMonth(Date d1, Date d2) {
		if (d1 == null || d2 == null)
			return false;

		GregorianCalendar cal1 = new GregorianCalendar();
		cal1.setTime(d1);
		GregorianCalendar cal2 = new GregorianCalendar();
		cal2.setTime(d2);
		if (cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH))
			if (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR))
				return true;
		return false;
	}

	/**
	 * 判断是否在同一周
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean isSameWeek(Date d1, Date d2) {
		if (d1 == null || d2 == null)
			return false;

		GregorianCalendar cal1 = new GregorianCalendar();
		cal1.setTime(d1);
		GregorianCalendar cal2 = new GregorianCalendar();
		cal2.setTime(d2);
		if (cal1.get(Calendar.WEEK_OF_YEAR) == cal2.get(Calendar.WEEK_OF_YEAR))
			if (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR))
				return true;
		return false;
	}

	/**
	 * 判断是否在同一年
	 * 
	 * @param d1
	 * @param d2
	 * @return true if both are in the same year
	 */
	public static boolean isSameYear(Date d1, Date d2) {
		if (d1 == null || d2 == null)
			return false;

		GregorianCalendar cal1 = new GregorianCalendar();
		cal1.setTime(d1);
		GregorianCalendar cal2 = new GregorianCalendar();
		cal2.setTime(d2);

		return (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR));
	}
	
	/**
	 * 增加日期
	 * @param date
	 * @param offset
	 * @return
	 */
	public static Date move(Date date, int offset) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, offset);

		return cal.getTime();
	}

	/**
	 * 设置为当前时间的最大分
	 * @param date
	 * @return
	 */
	public static Date move2LastMinute(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 999);
		return cal.getTime();
	}

	/**
	 * 设置为当前时间的最大分
	 * @param date
	 * @return
	 */
	public static Date move2LastSecond(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 999);

		return cal.getTime();
	}
	
	/**
	 * 设置时间到当天末尾
	 * @param date
	 * @return
	 */
	public static Date move2Midnight(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);

		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 999);

		return cal.getTime();
	}
	
	/**
	 * 设置时间到当天开始
	 * @param date
	 * @return
	 */
	public static Date move2Morning(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);

		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		return cal.getTime();
	}

	public static Date moveByHour(Date date, int offset) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, offset * 60);

		return cal.getTime();
	}

	/**
	 * 增加分
	 * @param date
	 * @param offset
	 * @return
	 */
	public static Date moveByMinute(Date date, int offset) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, offset);

		return cal.getTime();
	}

	/**
	 * 增加月
	 * @param date
	 * @param offset
	 * @return
	 */
	public static Date moveByMonth(Date date, int offset) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(Calendar.MONTH, offset);

		return cal.getTime();
	}

	/**
	 * 增加周
	 * @param date
	 * @param offset
	 * @return
	 */
	public static Date moveByWeek(Date date, int offset) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, offset * 7);

		return cal.getTime();
	}

	/**
	 * 增加年
	 * 
	 * @param date
	 * @param offset
	 * @return
	 */
	public static Date moveByYear(Date date, int offset) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.add(Calendar.YEAR, offset);

		return cal.getTime();
	}

	public static Calendar newCalendar() {
		Calendar cal = Calendar.getInstance(Locale.getDefault());
		cal.setTimeZone(TimeZone.getDefault());
		return cal;
	}

	/**
	 * 跳转到当天开始
	 * @param date
	 * @return
	 */
	public static Date round2Day(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}


	/**
	 * 跳转到当天开始hour时
	 * @param date
	 * @return
	 */
	public static Date round2Hour(Date date, int hour) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		if (hour > -1 && hour < 25) {
			cal.set(Calendar.HOUR_OF_DAY, hour);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
		}
		return cal.getTime();
	}

	/**
	 * 清空秒
	 * 
	 * @param date
	 * @return
	 */
	public static Date round2Minute(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 跳转到dete是minute分
	 * 
	 * @param date
	 * @param minute
	 * @return
	 */
	public static Date round2Minute(Date date, int minute) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		if (minute < 0)
			minute = (-1) * minute;

		// get overlapping hours
		int overlapping = minute / 60;

		// compute new hour
		int oldHour = cal.get(Calendar.HOUR_OF_DAY);

		int addDays = (oldHour + overlapping) / 24;

		// set the hours
		cal.set(Calendar.HOUR_OF_DAY, (oldHour + overlapping) % 24);

		// set the days
		if (addDays > 0)
			cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH)
					+ addDays);

		// set minutes
		cal.set(Calendar.MINUTE, (minute % 60));

		return cal.getTime();
	}

	/**
	 * 跳转到本月开始
	 * @param date
	 * @return
	 */
	public static Date round2Month(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 跳转到本周开始
	 * @param date
	 * @return
	 */
	public static Date round2Week(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 跳转到年初
	 * @param date
	 * @return
	 */
	public static Date round2Year(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
	
	
	/**
	 * 取值出入时间的最近15分钟 00 15 30 45 之一
	 * @param date
	 * @return
	 */
	public static Date roundNice(Date date) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);

		int minutes = cal.get(Calendar.MINUTE);

		int multiplier = (minutes / 15);

		minutes = multiplier * 15;

		cal.set(Calendar.MINUTE, minutes);

		return cal.getTime();
	}

	
	/**
	 * 跳转到星期几
	 * 
	 * @param date
	 * @param weekday
	 * @return
	 */
	public static Date setDayOfWeek(Date date, int weekday) {
		Calendar cal = newCalendar();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, weekday);

		return cal.getTime();
	}

}
