package com.newface.vo;

public class IuVo {
	private int iu_num;
	private String i_name;
	private String u_name;
	private String i_id;
	private String u_id;
	
	public IuVo() {}
	public IuVo(int iu_num, String i_name, String u_name, String i_id, String u_id) {
		super();
		this.iu_num = iu_num;
		this.i_name = i_name;
		this.u_name = u_name;
		this.i_id = i_id;
		this.u_id = u_id;
	}
	public int getIu_num() {
		return iu_num;
	}
	public void setIu_num(int iu_num) {
		this.iu_num = iu_num;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
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
