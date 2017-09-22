package com.newface.vo;

public class DiarytagVo {
	private int tag_num;
	private int diary_com_num;
	private String i_id;
	private String u_id;
	
	public DiarytagVo() {}

	public DiarytagVo(int tag_num, int diary_com_num, String i_id, String u_id) {
		super();
		this.tag_num = tag_num;
		this.diary_com_num = diary_com_num;
		this.i_id = i_id;
		this.u_id = u_id;
	}

	public int getTag_num() {
		return tag_num;
	}

	public void setTag_num(int tag_num) {
		this.tag_num = tag_num;
	}

	public int getDiary_com_num() {
		return diary_com_num;
	}

	public void setDiary_com_num(int diary_com_num) {
		this.diary_com_num = diary_com_num;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
}
