package com.newface.vo;


public class Singo_getVo {
	private int num;
	private String title;
	private String content;
	private int love;
	private String singo;
	private String regdate;
	private String id;
	private String tb;
	
	public Singo_getVo() {}

	public Singo_getVo(int num, String title, String content, int love, String singo, String regdate, String id,
			String tb) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.love = love;
		this.singo = singo;
		this.regdate = regdate;
		this.id = id;
		this.tb = tb;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLove() {
		return love;
	}

	public void setLove(int love) {
		this.love = love;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTb() {
		return tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}



	
}
