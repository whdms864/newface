package com.newface.vo;

import java.util.Date;

public class Qna11comVo {
	private int qna11_com_num;
	private String content;
	private String regdate;
	private int qna11_num;
	private String id;
	
	public Qna11comVo() {}

	public Qna11comVo(int qna11_com_num, String content, String regdate, int qna11_num, String id) {
		super();
		this.qna11_com_num = qna11_com_num;
		this.content = content;
		this.regdate = regdate;
		this.qna11_num = qna11_num;
		this.id = id;
	}

	public int getQna11_com_num() {
		return qna11_com_num;
	}

	public void setQna11_com_num(int qna11_com_num) {
		this.qna11_com_num = qna11_com_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getQna11_num() {
		return qna11_num;
	}

	public void setQna11_num(int qna11_num) {
		this.qna11_num = qna11_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
