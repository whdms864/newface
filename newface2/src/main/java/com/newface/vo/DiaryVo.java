package com.newface.vo;

import java.util.Date;

public class DiaryVo {
	private int diary_num;
	private String type;
	private String title;
	private String content;
	private String singo;
	private int love;
	private Date regdate;
	private int diary_folder_num;
	public DiaryVo(int diary_num, String type, String title, String content, String singo, int love, Date regdate,
			int diary_folder_num) {
		super();
		this.diary_num = diary_num;
		this.type = type;
		this.title = title;
		this.content = content;
		this.singo = singo;
		this.love = love;
		this.regdate = regdate;
		this.diary_folder_num = diary_folder_num;
	}
	
	public DiaryVo() {}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getSingo() {
		return singo;
	}

	public void setSingo(String singo) {
		this.singo = singo;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getDiary_folder_num() {
		return diary_folder_num;
	}

	public void setDiary_folder_num(int diary_folder_num) {
		this.diary_folder_num = diary_folder_num;
	}
	
}
