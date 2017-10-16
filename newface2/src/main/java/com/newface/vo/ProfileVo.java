package com.newface.vo;

import java.util.Date;

public class ProfileVo {
	private int pro_num;
	private String todayis;
	private String content;
	private String regdate;
	private String org_name;
	private String save_name;
	private int hompy_num;
	
	public ProfileVo() {}

	public ProfileVo(int pro_num, String todayis, String content, String regdate, String org_name, String save_name,
			int hompy_num) {
		super();
		this.pro_num = pro_num;
		this.todayis = todayis;
		this.content = content;
		this.regdate = regdate;
		this.org_name = org_name;
		this.save_name = save_name;
		this.hompy_num = hompy_num;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public String getTodayis() {
		return todayis;
	}

	public void setTodayis(String todayis) {
		this.todayis = todayis;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}
	
}
