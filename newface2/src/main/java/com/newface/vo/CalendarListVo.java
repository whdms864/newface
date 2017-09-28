package com.newface.vo;

public class CalendarListVo {
	private int hompy_num;
	private int diary_num;
	private String regdate;
	private String y;
	private String m;
	private String d;
	
	public CalendarListVo() {}

	public CalendarListVo(int hompy_num, int diary_num, String regdate, String y, String m, String d) {
		super();
		this.hompy_num = hompy_num;
		this.diary_num = diary_num;
		this.regdate = regdate;
		this.y = y;
		this.m = m;
		this.d = d;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getM() {
		return m;
	}

	public void setM(String m) {
		this.m = m;
	}

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}
}
