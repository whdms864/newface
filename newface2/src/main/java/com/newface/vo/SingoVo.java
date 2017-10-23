package com.newface.vo;

public class SingoVo {
	private int cnt;
	private String content;
	private int num2;
	private String tb;
	
	public SingoVo() {}

	public SingoVo(int cnt, String content, int num2, String tb) {
		super();
		this.cnt = cnt;
		this.content = content;
		this.num2 = num2;
		this.tb = tb;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
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

	public String getTb() {
		return tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}

	
	
}
