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
		case 1:week="�Ͽ���";break;
		case 2:week="������";break;
		case 3:week="ȭ����";break;
		case 4:week="������";break;
		case 5:week="�����";break;
		case 6:week="�ݿ���";break;
		case 7:week="�����";break;
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
