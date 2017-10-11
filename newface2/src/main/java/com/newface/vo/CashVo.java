package com.newface.vo;

public class CashVo {
	private int cash_num;
	private int cnt;
	private String id;

	public CashVo() {
	}

	public CashVo(int cash_num, int cnt, String id) {
		super();
		this.cash_num = cash_num;
		this.cnt = cnt;
		this.id = id;
	}

	public int getCash_num() {
		return cash_num;
	}

	public void setCash_num(int cash_num) {
		this.cash_num = cash_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}
