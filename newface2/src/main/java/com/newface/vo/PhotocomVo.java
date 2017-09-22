package com.newface.vo;

import java.util.Date;

public class PhotocomVo {
	private int photo_com_num;
	private String singo;
	private String content;
	private Date regdate;
	private int photo_num;
	private String id;
	
	public PhotocomVo() {}

	public PhotocomVo(int photo_com_num, String singo, String content, Date regdate, int photo_num, String id) {
		super();
		this.photo_com_num = photo_com_num;
		this.singo = singo;
		this.content = content;
		this.regdate = regdate;
		this.photo_num = photo_num;
		this.id = id;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
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
	
}
