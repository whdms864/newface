package com.newface.vo;

public class PhotocomVo {
	private int photo_com_num;
	private String singo;
	private String content;
	private String regdate;
	private int photo_num;
	private String id;
	private String name;
	private int hompy_num;
	
	public PhotocomVo() {}


	public PhotocomVo(int photo_com_num, String singo, String content, String regdate, int photo_num, String id,
			String name, int hompy_num) {
		super();
		this.photo_com_num = photo_com_num;
		this.singo = singo;
		this.content = content;
		this.regdate = regdate;
		this.photo_num = photo_num;
		this.id = id;
		this.name = name;
		this.hompy_num = hompy_num;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}


	public int getPhoto_com_num() {
		return photo_com_num;
	}

	public void setPhoto_com_num(int photo_com_num) {
		this.photo_com_num = photo_com_num;
	}

	public String getSingo() {
		return singo;
	}

	public void setSingo(String singo) {
		this.singo = singo;
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

	public int getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
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
