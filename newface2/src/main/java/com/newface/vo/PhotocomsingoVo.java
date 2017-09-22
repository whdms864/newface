package com.newface.vo;

public class PhotocomsingoVo {
	private int pcs_num;
	private String content;
	private int photo_com_num;
	private String id;
	
	public PhotocomsingoVo() {}

	public PhotocomsingoVo(int pcs_num, String content, int photo_com_num, String id) {
		super();
		this.pcs_num = pcs_num;
		this.content = content;
		this.photo_com_num = photo_com_num;
		this.id = id;
	}

	public int getPcs_num() {
		return pcs_num;
	}

	public void setPcs_num(int pcs_num) {
		this.pcs_num = pcs_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPhoto_com_num() {
		return photo_com_num;
	}

	public void setPhoto_com_num(int photo_com_num) {
		this.photo_com_num = photo_com_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
