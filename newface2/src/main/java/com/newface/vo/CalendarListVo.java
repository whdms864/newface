package com.newface.vo;

public class CalendarListVo {
	private int diary_num;
	private String y;
	private String m;
	private String d;
	
	public CalendarListVo() {}

	public CalendarListVo(int diary_num, String y,String m,String d) {
		super();
		this.diary_num = diary_num;
		this.y = y;
		this.m = m;
		this.d = d;
	}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
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
