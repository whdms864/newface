package com.newface.vo;

public class Miniroom_listVo {
	private int mine_num;
	private int totcnt;
	private int cnt;
	private int item_num;
	private String id;
	private int category_num;
	private String name;
	private String item_img;
	
	public Miniroom_listVo() {}

	public Miniroom_listVo(int mine_num, int totcnt, int cnt, int item_num, String id, int category_num, String name,
			String item_img) {
		super();
		this.mine_num = mine_num;
		this.totcnt = totcnt;
		this.cnt = cnt;
		this.item_num = item_num;
		this.id = id;
		this.category_num = category_num;
		this.name = name;
		this.item_img = item_img;
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

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getItem_img() {
		return item_img;
	}

	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}

}
