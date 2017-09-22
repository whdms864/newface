package com.newface.vo;

public class PhotocomtagVo {
	private int pct_num;
	private int photo_com_num;
	private String i_id;
	private String u_id;
	
	public PhotocomtagVo() {}

	public PhotocomtagVo(int pct_num, int photo_com_num, String i_id, String u_id) {
		super();
		this.pct_num = pct_num;
		this.photo_com_num = photo_com_num;
		this.i_id = i_id;
		this.u_id = u_id;
	}

	public int getPct_num() {
		return pct_num;
	}

	public void setPct_num(int pct_num) {
		this.pct_num = pct_num;
	}

	public int getPhoto_com_num() {
		return photo_com_num;
	}

	public void setPhoto_com_num(int photo_com_num) {
		this.photo_com_num = photo_com_num;
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
