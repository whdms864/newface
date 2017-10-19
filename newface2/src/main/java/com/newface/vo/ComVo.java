package com.newface.vo;


public class ComVo {
	private int num;
	private String content;
	private String regdate;
	private int num2;
	private String id;
	private String name;
	private String save_name;
	private String tb;
	
	public ComVo() {}

	public ComVo(int num, String content, String regdate, int num2, String id, String name, String save_name,
			String tb) {
		super();
		this.num = num;
		this.content = content;
		this.regdate = regdate;
		this.num2 = num2;
		this.id = id;
		this.name = name;
		this.save_name = save_name;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}

	public String getTb() {
		return tb;
	}

	public void setTb(String tb) {
		this.tb = tb;
	}
	
}
