package com.newface.vo;

public class DiarycomVo {
	private int diary_com_num;
	private String content;
	private String singo;
	private String regdate;
	private int diary_num;
	private String id;
	private String name;
	
	public DiarycomVo() {}

	public DiarycomVo(int diary_com_num, String content, String singo, String regdate, int diary_num, String id,
			String name) {
		super();
		this.diary_com_num = diary_com_num;
		this.content = content;
		this.singo = singo;
		this.regdate = regdate;
		this.diary_num = diary_num;
		this.id = id;
		this.name = name;
	}

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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
