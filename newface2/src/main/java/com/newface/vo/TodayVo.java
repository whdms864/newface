package com.newface.vo;

public class TodayVo {
	private int today_num;
	private int cnt;
	private String regdate;
	private int hompy_num;
	
	public TodayVo() {}

	public TodayVo(int today_num, int cnt, String regdate, int hompy_num) {
		super();
		this.today_num = today_num;
		this.cnt = cnt;
		this.regdate = regdate;
		this.hompy_num = hompy_num;
	}

	public int getToday_num() {
		return today_num;
	}

	public void setToday_num(int today_num) {
		this.today_num = today_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}
	
}
