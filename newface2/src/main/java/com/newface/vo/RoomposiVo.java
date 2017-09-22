package com.newface.vo;

public class RoomposiVo {
	private int room_posi_num;
	private int miniroom_num;
	private String drag;
	private double x;
	private double y;
	private int mine_num;
	
	public RoomposiVo() {}
	public RoomposiVo(int room_posi_num, int miniroom_num, String drag, double x, double y, int mine_num) {
		super();
		this.room_posi_num = room_posi_num;
		this.miniroom_num = miniroom_num;
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
	public int getMiniroom_num() {
		return miniroom_num;
	}
	public void setMiniroom_num(int miniroom_num) {
		this.miniroom_num = miniroom_num;
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
