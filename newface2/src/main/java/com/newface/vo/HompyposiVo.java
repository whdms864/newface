package com.newface.vo;

public class HompyposiVo {
	private int hompy_posi_num;
	private int hompy_num;
	private int mine_num;
	public HompyposiVo(int hompy_posi_num, int hompy_num, int mine_num) {
		super();
		this.hompy_posi_num = hompy_posi_num;
		this.hompy_num = hompy_num;
		this.mine_num = mine_num;
	}
	
	public HompyposiVo() {}

	public int getHompy_posi_num() {
		return hompy_posi_num;
	}

	public void setHompy_posi_num(int hompy_posi_num) {
		this.hompy_posi_num = hompy_posi_num;
	}

	public int getHompy_num() {
		return hompy_num;
	}

	public void setHompy_num(int hompy_num) {
		this.hompy_num = hompy_num;
	}

	public int getMine_num() {
		return mine_num;
	}

	public void setMine_num(int mine_num) {
		this.mine_num = mine_num;
	}
	
}
