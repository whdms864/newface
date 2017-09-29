package com.newface.vo;

public class NoticomVo {
	private int noti_com_num;
	private String content;
	private String singo;
	private String regdate;
	private String id;
	private String noti_num;
	
	public NoticomVo() {}

	public NoticomVo(int noti_com_num, String content, String singo, String regdate, String id, String noti_num) {
		super();
		this.noti_com_num = noti_com_num;
		this.content = content;
		this.singo = singo;
		this.regdate = regdate;
		this.id = id;
		this.noti_num = noti_num;
	}

	public int getNoti_com_num() {
		return noti_com_num;
	}

	public void setNoti_com_num(int noti_com_num) {
		this.noti_com_num = noti_com_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getNoti_num() {
		return noti_num;
	}

	public void setNoti_num(String noti_num) {
		this.noti_num = noti_num;
	}
	
	

}
