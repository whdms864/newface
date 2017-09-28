package com.newface.vo;


public class GuestcomlistVo {
	private String name;
	private int guest_num;
	private int guest_com_num;
	private String content;
	private String regdate;
	private String id;
	
	public GuestcomlistVo() {}

	public GuestcomlistVo(String name, int guest_num, int guest_com_num, String content, String regdate, String id) {
		super();
		this.name = name;
		this.guest_num = guest_num;
		this.guest_com_num = guest_com_num;
		this.content = content;
		this.regdate = regdate;
		this.id = id;
	}

	public int getGuest_com_num() {
		return guest_com_num;
	}

	public void setGuest_com_num(int guest_com_num) {
		this.guest_com_num = guest_com_num;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
