package com.newface.vo;

public class DiaryListVo {
	private int diary_num;
	private String title;
	private String content;
	private String regdate;
	private int love;
	private String fname;
	private int diary_folder_num;
	private int rownum;
	private String name;
	
	public DiaryListVo() {}

	public DiaryListVo(int diary_num, String title, String content, String regdate, int love, String fname,
			int diary_folder_num, int rownum, String name) {
		super();
		this.diary_num = diary_num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.love = love;
		this.fname = fname;
		this.diary_folder_num = diary_folder_num;
		this.rownum = rownum;
		this.name = name;
	}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getDiary_folder_num() {
		return diary_folder_num;
	}

	public void setDiary_folder_num(int diary_folder_num) {
		this.diary_folder_num = diary_folder_num;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
