package com.newface.vo;

import java.util.Date;

public class ItemVo {
	private int item_num;
	private int pay;
	private String name;
	private String content;
	private Date regdate;
	private String org_name;
	private String save_name;
	
	public ItemVo() {}

	public ItemVo(int item_num, int pay, String name, String content, Date regdate, String org_name, String save_name) {
		super();
		this.item_num = item_num;
		this.pay = pay;
		this.name = name;
		this.content = content;
		this.regdate = regdate;
		this.org_name = org_name;
		this.save_name = save_name;
	}

	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
}
