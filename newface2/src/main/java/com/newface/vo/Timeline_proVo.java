package com.newface.vo;


public class Timeline_proVo {
	private int num;
	private String save_name;
	private String id;
	
	
	public Timeline_proVo() {}


	public Timeline_proVo(int num, String save_name, String id) {
		super();
		this.num = num;
		this.save_name = save_name;
		this.id = id;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getSave_name() {
		return save_name;
	}


	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}



}
