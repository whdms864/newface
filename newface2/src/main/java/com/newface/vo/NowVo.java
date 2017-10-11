package com.newface.vo;

public class NowVo {
	private int num;
	private String title;
	private int folder_num;
	private int hompy_num;
	private String regdate;
	private int division;

	public NowVo() {}

	public NowVo(int num, String title, int folder_num, int hompy_num, String regdate, int division) {
		super();
		this.num = num;
		this.title = title;
		this.folder_num = folder_num;
		this.hompy_num = hompy_num;
		this.regdate = regdate;
		this.division = division;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getFolder_num() {
		return folder_num;
	}

	public void setFolder_num(int folder_num) {
		this.folder_num = folder_num;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}
}
