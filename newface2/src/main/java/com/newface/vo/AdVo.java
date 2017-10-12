package com.newface.vo;



public class AdVo {
	private int ad_num;
	private String type;
	private String pay;
	private String ad_img;
	private String url;
	private String sdate;
	private String edate;
	private int ader_num;
	
	public AdVo() {}

	public AdVo(int ad_num, String type, String pay, String ad_img, String url, String sdate, String edate, int ader_num) {
		super();
		this.ad_num = ad_num;
		this.type = type;
		this.pay = pay;
		this.ad_img = ad_img;
		this.url = url;
		this.sdate = sdate;
		this.edate = edate;
		this.ader_num = ader_num;
	}

	public int getAd_num() {
		return ad_num;
	}

	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
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

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getAder_num() {
		return ader_num;
	}

	public void setAder_num(int ader_num) {
		this.ader_num = ader_num;
	}

	
	
}
