package com.newface.vo;


public class Photo_loveVo {
	private int photo_love_num;
	private String id;
	private int photo_num;
	
	public Photo_loveVo() {}

	public Photo_loveVo(int photo_love_num, String id, int photo_num) {
		super();
		this.photo_love_num = photo_love_num;
		this.id = id;
		this.photo_num = photo_num;
	}

	public int getPhoto_love_num() {
		return photo_love_num;
	}

	public void setPhoto_love_num(int photo_love_num) {
		this.photo_love_num = photo_love_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}

	
}
