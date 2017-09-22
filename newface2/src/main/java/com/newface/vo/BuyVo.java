package com.newface.vo;

import java.util.Date;

public class BuyVo {
	private int buy_num;
	private Date regdate;
	private int cnt;
	private int pay;
	private int item_num;
	private String id;
	
	public BuyVo() {}

	public BuyVo(int buy_num, Date regdate, int cnt, int pay, int item_num, String id) {
		super();
		this.buy_num = buy_num;
		this.regdate = regdate;
		this.cnt = cnt;
		this.pay = pay;
		this.item_num = item_num;
		this.id = id;
	}

	public int getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
