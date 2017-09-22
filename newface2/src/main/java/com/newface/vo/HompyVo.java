package com.newface.vo;

public class HompyVo {
	private int hompy_num;
	private int total;
	private String hname;
	private String id;
	
	public HompyVo() {}

	public HompyVo(int hompy_num, int total, String hname, String id) {
		super();
		this.hompy_num = hompy_num;
		this.total = total;
		this.hname = hname;
		this.id = id;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
