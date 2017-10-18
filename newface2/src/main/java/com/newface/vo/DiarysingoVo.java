package com.newface.vo;

public class DiarysingoVo {
	private int diary_singo_num;
	private String content;
	private int diary_num;
	private String id;
	
	public DiarysingoVo() {}

	public DiarysingoVo(int diary_singo_num, String content,int diary_num,String id ) {
		super();
		this.diary_singo_num = diary_singo_num;
		this.content = content;
		this.diary_num = diary_num;
		this.id = id;
	}

	public int getDiary_singo_num() {
		return diary_singo_num;
	}

	public void setDiary_singo_num(int diary_singo_num) {
		this.diary_singo_num = diary_singo_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}
	
}
