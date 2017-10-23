package com.newface.vo;

public class Singo_getVo {
	private int num;
	private String content;
	private int num2;
	private String id;
	private String tb;
	
	public Singo_getVo() {}

	public Singo_getVo(int num, String content, int num2, String id, String tb) {
		super();
		this.num = num;
		this.content = content;
		this.num2 = num2;
		this.id = id;
		this.tb = tb;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTb() {
		return tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}

	
}
