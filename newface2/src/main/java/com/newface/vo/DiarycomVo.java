package com.newface.vo;

import java.util.Date;

public class DiarycomVo {
	private int diary_com_num;
	private String content;
	private String singo;
	private Date regdate;
	private int diary_num;
	public DiarycomVo(int diary_com_num, String content, String singo, Date regdate, int d) {
		super();
		this.diary_com_num = diary_com_num;
		this.content = content;
		this.singo = singo;
		this.regdate = regdate;
		this.diary_num = diary_num;
	}
	private String id;
	
	public DiarycomVo() {}

	public int getDiary_com_num() {
		return diary_com_num;
	}

	public void setDiary_com_num(int diary_com_num) {
		this.diary_com_num = diary_com_num;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
