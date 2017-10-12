package com.newface.vo;

public class Miniroom_HompyVo {
	private int room_posi_num;
	private int mini_num;
	private String drag;
	private double x;
	private double y;
	private int mine_num;
	private int category_num;
	private String item_img;
	
	public Miniroom_HompyVo() {}
	
	public Miniroom_HompyVo(int room_posi_num, int mini_num, String drag, double x, double y, int mine_num,
			int category_num, String item_img) {
		super();
		this.room_posi_num = room_posi_num;
		this.mini_num = mini_num;
		this.drag = drag;
		this.x = x;
		this.y = y;
		this.mine_num = mine_num;
		this.category_num = category_num;
		this.item_img = item_img;
	}
	public int getRoom_posi_num() {
		return room_posi_num;
	}
	public void setRoom_posi_num(int room_posi_num) {
		this.room_posi_num = room_posi_num;
	}
	public int getMini_num() {
		return mini_num;
	}
	public void setMini_num(int mini_num) {
		this.mini_num = mini_num;
	}
	public String getDrag() {
		return drag;
	}
	public void setDrag(String drag) {
		this.drag = drag;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public int getMine_num() {
		return mine_num;
	}
	public void setMine_num(int mine_num) {
		this.mine_num = mine_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	
}
