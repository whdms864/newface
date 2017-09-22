package com.newface.vo;

public class AdimgVo {
	private int ad_img_num;
	private String type;
	private String org_name;
	private String save_name;
	private String url;
	private int ad_num;
	
	public AdimgVo(){}

	public AdimgVo(int ad_img_num, String type, String org_name, String save_name, String url, int ad_num) {
		super();
		this.ad_img_num = ad_img_num;
		this.type = type;
		this.org_name = org_name;
		this.save_name = save_name;
		this.url = url;
		this.ad_num = ad_num;
	}

	public int getAd_img_num() {
		return ad_img_num;
	}

	public void setAd_img_num(int ad_img_num) {
		this.ad_img_num = ad_img_num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
}	
