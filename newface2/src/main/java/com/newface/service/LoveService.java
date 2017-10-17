package com.newface.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.LoveDao;
import com.newface.vo.Diary_loveVo;
import com.newface.vo.Photo_loveVo;

@Service
public class LoveService {
	@Autowired public LoveDao dao;
	public void setDao(LoveDao dao) {
		this.dao = dao;
	}
	public int p_insert(Photo_loveVo vo) {
		return dao.p_insert(vo);
	}
	public int d_insert(Diary_loveVo vo) {
		return dao.d_insert(vo);
	}
	public int p_delete(HashMap<String, Object> map) {
		return dao.p_delete(map);
	}
	public int d_delete(HashMap<String, Object> map) {
		return dao.d_delete(map);
	}
	public Photo_loveVo p_list(HashMap<String, Object> map) {
		return dao.p_list(map);
	}
	public Diary_loveVo d_list(HashMap<String, Object> map) {
		return dao.d_list(map);
	}
	public int p_update(HashMap<String, Object> map) {
		return dao.p_update(map);
	}
	public int d_update(HashMap<String, Object> map) {
		return dao.d_update(map);
	}
}
