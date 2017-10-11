package com.newface.vo;

public class AdimgVo {
	private int ad_img_num;
	private String type;
	private String ad_img;
	private String url;
	private int ad_num;
	
	public AdimgVo() {}

	public AdimgVo(int ad_img_num, String type, String ad_img, String url, int ad_num) {
		super();
		this.ad_img_num = ad_img_num;
		this.type = type;
		this.ad_img = ad_img;
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

	public String getAd_img() {
		return ad_img;
	}

	public void setAd_img(String ad_img) {
		this.ad_img = ad_img;
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
