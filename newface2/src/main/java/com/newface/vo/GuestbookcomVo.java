package com.newface.vo;

import java.util.Date;

public class GuestbookcomVo {
	private int guest_com_num;
	private String content;
	private Date regdate;
	private int guest_num;
	private String id;
	
	public GuestbookcomVo() {}

	public GuestbookcomVo(int guest_com_num, String content, Date regdate, int guest_num, String id) {
		super();
		this.guest_com_num = guest_com_num;
		this.content = content;
		this.regdate = regdate;
		this.guest_num = guest_num;
		this.id = id;
	}

	public int getGuest_com_num() {
		return guest_com_num;
	}

	public void setGuest_com_num(int guest_com_num) {
		this.guest_com_num = guest_com_num;
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

	public int getGuest_num() {
		return guest_num;
	}

	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
