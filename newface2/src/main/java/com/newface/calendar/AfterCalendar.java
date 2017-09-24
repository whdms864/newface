package com.newface.calendar;

import java.util.Calendar;

public class AfterCalendar {
	private String regdate;
	private int year;
	private int month;
	private int date;
	private int lastdate;
	private String week;
	
	public AfterCalendar() {}
	
	public AfterCalendar(String regdate) {
		super();
		this.regdate=regdate;
		
		String[] str=regdate.split("-");		
		int y=Integer.parseInt(str[0]);
		int m=Integer.parseInt(str[1]);
		int d=Integer.parseInt(str[2]);			

		Calendar cd=Calendar.getInstance();
		if(m==12) {
			cd.set(Calendar.YEAR,(y+1));
			cd.set(Calendar.MONTH,0);
		}else {
			cd.set(Calendar.YEAR, y);
			cd.set(Calendar.MONTH, m);
		}
		cd.set(Calendar.DATE, d);

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

	public String getRegdate() {
		return regdate;
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
