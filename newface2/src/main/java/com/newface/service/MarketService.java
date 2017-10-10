package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MarketDao;
import com.newface.dao.Qna11Dao;
import com.newface.vo.CategoryVo;
import com.newface.vo.ItemVo;
import com.newface.vo.Qna11Vo;
import com.newface.vo.Qna11comVo;

@Service
public class MarketService {
	@Autowired public MarketDao dao;
	public void setDao(MarketDao dao) {
		this.dao = dao;
	}
	public int insert(CategoryVo vo) {
		return dao.insert(vo);
	}
	public int insert(ItemVo vo) {
		return dao.insert(vo);
	}
	public List<CategoryVo> list_cate(HashMap<String, Object> map) {
		return dao.list_cate(map);
	}
	public List<CategoryVo> list_cate_all() {
		return dao.list_cate_all();
	}
	public List<ItemVo> list_item(HashMap<String, Object> map) {
		return dao.list_item(map);
	}
	public int getCount(int category_num) {
		return dao.getCount(category_num);
	}
	public int getCount() {
		return dao.getCount();
	}
	public CategoryVo getinfo_cate(int category_num) {
		return dao.getinfo_cate(category_num);
	}
	public ItemVo getinfo_item(int item_num) {
		return dao.getinfo_item(item_num);
	}
	public int delete_cate(int category_num) {
		return dao.delete_cate(category_num);
	}
	public int delete_item(int item_num) {
		return dao.delete_item(item_num);
	}
	public int update_item(ItemVo vo) {
		return dao.update_item(vo);
	}
	public int update_cate(CategoryVo vo) {
		return dao.update_cate(vo);
	}

}
