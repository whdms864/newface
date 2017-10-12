package com.newface.vo;

public class RoomposiVo {
	private int room_posi_num;
	private int mini_num;
	private String drag;
	private double x;
	private double y;
	private int mine_num;
	
	public RoomposiVo() {}
	public RoomposiVo(int room_posi_num, int mini_num, String drag, double x, double y, int mine_num) {
		super();
		this.room_posi_num = room_posi_num;
		this.mini_num = mini_num;
		this.drag = drag;
		this.x = x;
		this.y = y;
		this.mine_num = mine_num;
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
	
}
