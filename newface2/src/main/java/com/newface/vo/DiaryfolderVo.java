package com.newface.vo;

import java.util.Date;

public class DiaryfolderVo {
	private int diary_folder_num;
	private String fname;
	private Date regdate;
	private int hompy_num;
	
	public DiaryfolderVo() {}

	public DiaryfolderVo(int diary_folder_num, String fname, Date regdate, int hompy_num) {
		super();
		this.diary_folder_num = diary_folder_num;
		this.fname = fname;
		this.regdate = regdate;
		this.hompy_num = hompy_num;
	}

	public int getDiary_folder_num() {
		return diary_folder_num;
	}

	public void setDiary_folder_num(int diary_folder_num) {
		this.diary_folder_num = diary_folder_num;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}
	
}
