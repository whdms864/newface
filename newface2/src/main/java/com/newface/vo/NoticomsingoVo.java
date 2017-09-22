package com.newface.vo;

public class NoticomsingoVo {
	private int noti_com_singo;
	private String content;
	private String id;
	private int noti_com_num;
	
	public NoticomsingoVo() {}

	public NoticomsingoVo(int noti_com_singo, String content, String id, int noti_com_num) {
		super();
		this.noti_com_singo = noti_com_singo;
		this.content = content;
		this.id = id;
		this.noti_com_num = noti_com_num;
	}

	public int getNoti_com_singo() {
		return noti_com_singo;
	}

	public void setNoti_com_singo(int noti_com_singo) {
		this.noti_com_singo = noti_com_singo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNoti_com_num() {
		return noti_com_num;
	}

	public void setNoti_com_num(int noti_com_num) {
		this.noti_com_num = noti_com_num;
	}
	
}
