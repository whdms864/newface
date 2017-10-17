package com.newface.vo;


public class TimelineVo {
	private int num;
	private String title;
	private String content;
	private int love;
	private String singo;
	private String regdate;
	private String id;
	private String name;
	private String save_name;
	private String tb;
	
	public TimelineVo() {}

	public TimelineVo(int num, String title, String content, int love, String singo, String regdate, String id,
			String name, String save_name, String tb) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.love = love;
		this.singo = singo;
		this.regdate = regdate;
		this.id = id;
		this.name = name;
		this.save_name = save_name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public String getTb() {
		return tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}


	
}
