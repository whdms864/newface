package com.newface.vo;

import java.util.Date;

public class AderVo {
	private int ader_num;
	private String hname;
	private String pname;
	private String snum;
	private String dname;
	private String phone;
	private String regdate;
	
	public AderVo() {}

	public AderVo(int ader_num, String hname, String pname, String snum, String dname, String phone, String regdate) {
		super();
		this.ader_num = ader_num;
		this.hname = hname;
		this.pname = pname;
		this.snum = snum;
		this.dname = dname;
		this.phone = phone;
		this.regdate = regdate;
	}

	public int getAder_num() {
		return ader_num;
	}

	public void setAder_num(int ader_num) {
		this.ader_num = ader_num;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSnum() {
		return snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
