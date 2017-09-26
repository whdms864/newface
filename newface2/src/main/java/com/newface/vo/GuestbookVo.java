package com.newface.vo;

import java.util.Date;

public class GuestbookVo {
	private int guest_num;
	private String title;
	private String content;
	private String secret;
	private Date regdate;
	private String id;
	private int hompy_num;
	
	public GuestbookVo() {}
	public GuestbookVo(int guest_num, String title, String content, String secret, Date regdate, String id,
			int hompy_num) {
		super();
		this.guest_num = guest_num;
		this.title = title;
		this.content = content;
		this.secret = secret;
		this.regdate = regdate;
		this.id = id;
		this.hompy_num = hompy_num;
	}
	public int getGuest_num() {
		return guest_num;
	}
	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
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
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getHompy_num() {
		return hompy_num;
	}
	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}
}
