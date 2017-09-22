package com.newface.vo;

import java.util.Date;

public class PhotofolderVo {
	private int photo_folder_num;
	private String fname;
	private Date regdate;
	private int hompy_num;
	
	public PhotofolderVo() {}

	public PhotofolderVo(int photo_folder_num, String fname, Date regdate, int hompy_num) {
		super();
		this.photo_folder_num = photo_folder_num;
		this.fname = fname;
		this.regdate = regdate;
		this.hompy_num = hompy_num;
	}

	public int getPhoto_folder_num() {
		return photo_folder_num;
	}

	public void setPhoto_folder_num(int photo_folder_num) {
		this.photo_folder_num = photo_folder_num;
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
