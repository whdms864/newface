package com.newface.vo;

import java.util.Date;

public class ItemVo {
	private int item_num;
	private int pay;
	private String name;
	private String content;
	private String item_img;
	private String regdate;
	private int category_num;

	public ItemVo() {
	}

	public ItemVo(int item_num, int pay, String name, String content, String item_img, String regdate, int category_num) {
		super();
		this.item_num = item_num;
		this.pay = pay;
		this.name = name;
		this.content = content;
		this.item_img = item_img;
		this.regdate = regdate;
		this.category_num = category_num;
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

	public String getItem_img() {
		return item_img;
	}

	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	
	
}