package com.newface.vo;


public class Buy_Join_ItemVo {
	private int buy_num;
	private int cnt;
	private int pay;
	private int item_num;
	private String iname;
	private String content;
	private String item_img;
	private int category_num;
	private String cname;
	private String regdate;
	private String id;
	
	public Buy_Join_ItemVo() {}

	public Buy_Join_ItemVo(int buy_num, int cnt, int pay, int item_num, String iname, String content, String item_img,
			int category_num, String cname, String regdate, String id) {
		super();
		this.buy_num = buy_num;
		this.cnt = cnt;
		this.pay = pay;
		this.item_num = item_num;
		this.iname = iname;
		this.content = content;
		this.item_img = item_img;
		this.category_num = category_num;
		this.cname = cname;
		this.regdate = regdate;
		this.id = id;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
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

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}
