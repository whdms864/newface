package com.newface.vo;

public class PhotoimgVo {
	private int photo_img_num;
	private String org_name;
	private String save_name;
	private int photo_num;
	
	public PhotoimgVo() {}

	public PhotoimgVo(int photo_img_num, String org_name, String save_name, int photo_num) {
		super();
		this.photo_img_num = photo_img_num;
		this.org_name = org_name;
		this.save_name = save_name;
		this.photo_num = photo_num;
	}

	public int getPhoto_img_num() {
		return photo_img_num;
	}

	public void setPhoto_img_num(int photo_img_num) {
		this.photo_img_num = photo_img_num;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public int getPhoto_num() {
		return photo_num;
	}

	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}
	
}
