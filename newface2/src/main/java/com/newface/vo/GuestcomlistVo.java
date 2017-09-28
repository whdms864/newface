package com.newface.vo;

import java.util.Date;

public class GuestcomlistVo {
	private String name;
	private int guest_num;
	private String content;
	private Date regdate;
	
	public GuestcomlistVo() {}

	public GuestcomlistVo(String name, int guest_num, String content, Date regdate) {
		super();
		this.name = name;
		this.guest_num = guest_num;
		this.content = content;
		this.regdate = regdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGuest_num() {
		return guest_num;
	}

	public void setGuest_num(int guest_num) {
		this.guest_num = guest_num;
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
	
}
