package com.newface.vo;

public class PhotosingoVo {
	private int ps_num;
	private String content;
	private int photo_num;
	private String id;
	
	public PhotosingoVo() {}

	public PhotosingoVo(int ps_num, String content, int photo_num, String id) {
		super();
		this.ps_num = ps_num;
		this.content = content;
		this.photo_num = photo_num;
		this.id = id;
	}

	public int getPs_num() {
		return ps_num;
	}

	public void setPs_num(int ps_num) {
		this.ps_num = ps_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
