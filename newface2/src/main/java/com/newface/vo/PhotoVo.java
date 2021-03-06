package com.newface.vo;

import java.util.Date;

public class PhotoVo {
	private int photo_num;
	private String title;
	private String content;
	private int love;
	private String secret;
	private int singo;
	private Date regdate;
	private String type;
	private int photo_folder_num;
	private int blind;
	
	public PhotoVo() {}

	public PhotoVo(int photo_num, String title, String content, int love, String secret, int singo, Date regdate,
			String type, int photo_folder_num, int blind) {
		super();
		this.photo_num = photo_num;
		this.title = title;
		this.content = content;
		this.love = love;
		this.secret = secret;
		this.singo = singo;
		this.regdate = regdate;
		this.type = type;
		this.photo_folder_num = photo_folder_num;
		this.blind = blind;
	}

	public int getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
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

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public int getSingo() {
		return singo;
	}

	public void setSingo(int singo) {
		this.singo = singo;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPhoto_folder_num() {
		return photo_folder_num;
	}

	public void setPhoto_folder_num(int photo_folder_num) {
		this.photo_folder_num = photo_folder_num;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}

	
	
}
