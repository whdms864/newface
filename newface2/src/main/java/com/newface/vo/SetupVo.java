package com.newface.vo;

public class SetupVo {
	private int setup_num;
	private int hompy_num;
	private String guest;
	private String photo;
	private String diary;
	
	public SetupVo() {}

	public SetupVo(int setup_num, int hompy_num, String guest, String photo, String diary) {
		super();
		this.setup_num = setup_num;
		this.hompy_num = hompy_num;
		this.guest = guest;
		this.photo = photo;
		this.diary = diary;
	}

	public int getSetup_num() {
		return setup_num;
	}

	public void setSetup_num(int setup_num) {
		this.setup_num = setup_num;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}

	public String getGuest() {
		return guest;
	}

	public void setGuest(String guest) {
		this.guest = guest;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDiary() {
		return diary;
	}

	public void setDiary(String diary) {
		this.diary = diary;
	}
	
}
