package com.newface.vo;

import java.util.Date;

public class NotiVo {
	private int noti_num;
	private String title;
	private String content;
	private Date regdate;
	private String id;
	
	public NotiVo() {}

	public NotiVo(int noti_num, String title, String content, Date regdate, String id) {
		super();
		this.noti_num = noti_num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.id = id;
	}

	public int getNoti_num() {
		return noti_num;
	}

	public void setNoti_num(int noti_num) {
		this.noti_num = noti_num;
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
	
}
