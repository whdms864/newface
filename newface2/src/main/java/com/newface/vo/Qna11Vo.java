package com.newface.vo;

import java.util.Date;

public class Qna11Vo {
	private int qna11_num;
	private String title;
	private String content;
	private Date regdate;
	private String confirm;
	private String id;
	
	public Qna11Vo() {}

	public Qna11Vo(int qna11_num, String title, String content, Date regdate, String confirm, String id) {
		super();
		this.qna11_num = qna11_num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.confirm = confirm;
		this.id = id;
	}

	public int getQna11_num() {
		return qna11_num;
	}

	public void setQna11_num(int qna11_num) {
		this.qna11_num = qna11_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
