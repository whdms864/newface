package com.newface.vo;

public class Mine_Join_itemVo {
	private int mine_num;
	private int totcnt;
	private int cnt;
	private int item_num;
	private String iname;
	private String content;
	private String item_img;
	private int category_num;
	private String cname;
	private String id;
	
	public Mine_Join_itemVo() {}

	public Mine_Join_itemVo(int mine_num, int totcnt, int cnt, int item_num, String iname, String content,
			String item_img, int category_num, String cname, String id) {
		super();
		this.mine_num = mine_num;
		this.totcnt = totcnt;
		this.cnt = cnt;
		this.item_num = item_num;
		this.iname = iname;
		this.content = content;
		this.item_img = item_img;
		this.category_num = category_num;
		this.cname = cname;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
}
