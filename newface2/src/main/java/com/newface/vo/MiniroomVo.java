package com.newface.vo;

public class MiniroomVo {
	private int miniroom_num;
	private String name;
	private int hompy_num;
	
	public MiniroomVo() {}

	public MiniroomVo(int miniroom_num, String name, int hompy_num) {
		super();
		this.miniroom_num = miniroom_num;
		this.name = name;
		this.hompy_num = hompy_num;
	}

	public int getMiniroom_num() {
		return miniroom_num;
	}

	public void setMiniroom_num(int miniroom_num) {
		this.miniroom_num = miniroom_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}
	
}
