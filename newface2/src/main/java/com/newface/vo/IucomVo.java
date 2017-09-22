package com.newface.vo;

import java.util.Date;

public class IucomVo {	
	private int iu_com_num;
	private String content;
	private Date regdate;
	private int hompy_num;
	private String id;
	
	public IucomVo() {}

	public IucomVo(int iu_com_num, String content, Date regdate, int hompy_num, String id) {
		super();
		this.iu_com_num = iu_com_num;
		this.content = content;
		this.regdate = regdate;
		this.hompy_num = hompy_num;
		this.id = id;
	}

	public int getIu_com_num() {
		return iu_com_num;
	}

	public void setIu_com_num(int iu_com_num) {
		this.iu_com_num = iu_com_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
