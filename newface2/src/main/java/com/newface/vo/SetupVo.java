package com.newface.vo;

public class SetupVo {
	private int setup_num;
	private int hompy_num;
	private int guest;
	private int photo;
	private int diary;
	private int jukebox;
	
	public SetupVo() {}

	public SetupVo(int setup_num, int hompy_num, int guest, int photo, int diary, int jukebox) {
		super();
		this.setup_num = setup_num;
		this.hompy_num = hompy_num;
		this.guest = guest;
		this.photo = photo;
		this.diary = diary;
		this.jukebox = jukebox;
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

	public int getGuest() {
		return guest;
	}

	public void setGuest(int guest) {
		this.guest = guest;
	}

	public int getPhoto() {
		return photo;
	}

	public void setPhoto(int photo) {
		this.photo = photo;
	}

	public int getDiary() {
		return diary;
	}

	public void setDiary(int diary) {
		this.diary = diary;
	}

	public int getJukebox() {
		return jukebox;
	}

	public void setJukebox(int jukebox) {
		this.jukebox = jukebox;
	}
	
}
