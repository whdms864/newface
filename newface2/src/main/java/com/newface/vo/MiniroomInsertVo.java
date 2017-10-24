package com.newface.vo;

import java.util.List;

public class MiniroomInsertVo {
	private String wall;
	private int item_num;
	private double x;
	private double y;
	private int mine_num;
	private List<MiniroomInsertVo> list;
	
	public MiniroomInsertVo() {}
	
	
	public MiniroomInsertVo(String wall, int item_num, double x, double y, int mine_num, List<MiniroomInsertVo> list) {
		super();
		this.wall = wall;
		this.item_num = item_num;
		this.x = x;
		this.y = y;
		this.mine_num = mine_num;
		this.list = list;
	}


	public int getMine_num() {
		return mine_num;
	}


	public void setMine_num(int mine_num) {
		this.mine_num = mine_num;
	}


	public List<MiniroomInsertVo> getList() {
		return list;
	}
	public void setList(List<MiniroomInsertVo> list) {
		this.list = list;
	}
	public String getWall() {
		return wall;
	}
	public void setWall(String wall) {
		this.wall = wall;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
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
	
}
