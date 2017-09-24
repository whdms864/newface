package com.newface.calendar;

import java.util.Calendar;

public class TodayCalendar {
	private int year;
	private int month;
	private int date;
	private int lastdate;
	private String week;
	
	private static TodayCalendar instance=new TodayCalendar();
	
	private TodayCalendar() {
		Calendar cd=Calendar.getInstance();

		year=cd.get(Calendar.YEAR);	
		month=(cd.get(Calendar.MONTH)+1);	
		date=cd.get(Calendar.DATE);	
		lastdate=cd.getActualMaximum(Calendar.DATE);
		int w=cd.get(Calendar.DAY_OF_WEEK);
		switch (w) {
		case 1:week="일요일";break;
		case 2:week="월요일";break;
		case 3:week="화요일";break;
		case 4:week="수요일";break;
		case 5:week="목요일";break;
		case 6:week="금요일";break;
		case 7:week="토요일";break;
		}
	}
	
	public static TodayCalendar getInstance() {
		return instance;
	}

	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}

	public int getDate() {
		return date;
	}

	public int getLastdate() {
		return lastdate;
	}

	public String getWeek() {
		return week;
	}
	
}
