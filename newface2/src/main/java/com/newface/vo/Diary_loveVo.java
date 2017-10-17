package com.newface.vo;


public class Diary_loveVo {
	private int Diary_love_num;
	private String id;
	private int Diary_num;
	
	public Diary_loveVo() {}

	public Diary_loveVo(int diary_love_num, String id, int diary_num) {
		super();
		Diary_love_num = diary_love_num;
		this.id = id;
		Diary_num = diary_num;
	}

	public int getDiary_love_num() {
		return Diary_love_num;
	}

	public void setDiary_love_num(int diary_love_num) {
		Diary_love_num = diary_love_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getDiary_num() {
		return Diary_num;
	}

	public void setDiary_num(int diary_num) {
		Diary_num = diary_num;
	}

	
}
