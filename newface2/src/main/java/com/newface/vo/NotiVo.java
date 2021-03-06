package com.newface.vo;


public class NotiVo {
	private int noti_num;
	private String title;
	private String content;
	private String regdate;
	private String id;
	private int noticom_count;
	
	public NotiVo() {}

	public NotiVo(int noti_num, String title, String content, String regdate, String id, int noticom_count) {
		super();
		this.noti_num = noti_num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.id = id;
		this.noticom_count = noticom_count;
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

	public int getNoticom_count() {
		return noticom_count;
	}

	public void setNoticom_count(int noticom_count) {
		this.noticom_count = noticom_count;
	}
}