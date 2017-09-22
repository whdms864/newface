package com.newface.vo;

public class MineVo {
	private int mine_num;
	private int totcnt;
	private int cnt;
	private int item_num;
	private String id;
	
	public MineVo() {}

	public MineVo(int mine_num, int totcnt, int cnt, int item_num, String id) {
		super();
		this.mine_num = mine_num;
		this.totcnt = totcnt;
		this.cnt = cnt;
		this.item_num = item_num;
		this.id = id;
	}

	public int getMine_num() {
		return mine_num;
	}

	public void setMine_num(int mine_num) {
		this.mine_num = mine_num;
	}

	public int getTotcnt() {
		return totcnt;
	}

	public void setTotcnt(int totcnt) {
		this.totcnt = totcnt;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
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
