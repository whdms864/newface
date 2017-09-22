package com.newface.vo;

import java.util.Date;

public class AdVo {
	private int ad_num;
	private String type;
	private int pay;
	private Date sdate;
	private Date edate;
	private int ader_num;
	
	public AdVo() {}

	public AdVo(int ad_num, String type, int pay, Date sdate, Date edate, int ader_num) {
		super();
		this.ad_num = ad_num;
		this.type = type;
		this.pay = pay;
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public int getAder_num() {
		return ader_num;
	}

	public void setAder_num(int ader_num) {
		this.ader_num = ader_num;
	}
	
}
