package com.newface.vo;

public class CategoryVo {
	private int category_num;
	private String name;
	public CategoryVo(int category_num, String name) {
		super();
		this.category_num = category_num;
		this.name = name;
	}
	
	public CategoryVo() {}

	public int getCategory_num() {
		return category_num;
	}

	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
