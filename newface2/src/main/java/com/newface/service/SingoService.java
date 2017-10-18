package com.newface.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.SingoDao;
import com.newface.vo.DiarysingoVo;
import com.newface.vo.PhotosingoVo;

@Service
public class SingoService {
	@Autowired public SingoDao dao;
	public void setDao(SingoDao dao) {
		this.dao = dao;
	}
	public int p_insert(PhotosingoVo vo) {
		return dao.p_insert(vo);
	}
	public int d_insert(DiarysingoVo vo) {
		return dao.d_insert(vo);
	}
	public int p_delete(HashMap<String, Object> map) {
		return dao.p_delete(map);
	}
	public int d_delete(HashMap<String, Object> map) {
		return dao.d_delete(map);
	}
	public PhotosingoVo p_list(HashMap<String, Object> map) {
		return dao.p_list(map);
	}
	public DiarysingoVo d_list(HashMap<String, Object> map) {
		return dao.d_list(map);
	}
	public int p_update(HashMap<String, Object> map) {
		return dao.p_update(map);
	}
	public int d_update(HashMap<String, Object> map) {
		return dao.d_update(map);
	}
}
