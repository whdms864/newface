package com.newface.vo;

public class GuestbooklistVo {
	private String name;
	private String id;
	private int guest_num;
	private String content;
	private String secret;
	private String regdate;

	public GuestbooklistVo() {
	}

	public GuestbooklistVo(String name, String id, int guest_num, String content, String secret, String regdate) {
		super();
		this.name = name;
		this.id = id;
		this.guest_num = guest_num;
		this.content = content;
		this.secret = secret;
		this.regdate = regdate;
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

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
