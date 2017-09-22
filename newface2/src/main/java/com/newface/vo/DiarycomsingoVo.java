package com.newface.vo;

public class DiarycomsingoVo {
	private int dos_num;
	private String content;
	private int diary_com_num;
	private String id;
	
	public DiarycomsingoVo() {}

	public DiarycomsingoVo(int dos_num, String content, int diary_com_num, String id) {
		super();
		this.dos_num = dos_num;
		this.content = content;
		this.diary_com_num = diary_com_num;
		this.id = id;
	}

	public int getDos_num() {
		return dos_num;
	}

	public void setDos_num(int dos_num) {
		this.dos_num = dos_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDiary_com_num() {
		return diary_com_num;
	}

	public void setDiary_com_num(int diary_com_num) {
		this.diary_com_num = diary_com_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
