package com.newface.vo;

public class Member_Profile_Hompy_JoinVo {
	private String id;
	private String name;
	private String school;
	private String addr;
	private String email;
	private String save_name;
	
	public Member_Profile_Hompy_JoinVo() {}

	public Member_Profile_Hompy_JoinVo(String id, String name, String school, String addr, String email,
			String save_name) {
		super();
		this.id = id;
		this.name = name;
		this.school = school;
		this.addr = addr;
		this.email = email;
		this.save_name = save_name;
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

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSave_name() {
		return save_name;
	}

	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	
	
}
