package com.newface.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.SingoDao;
import com.newface.vo.DiarysingoVo;
import com.newface.vo.PhotosingoVo;
import com.newface.vo.SingoVo;
import com.newface.vo.Singo_getVo;

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
	public int p_delete_all(int num) {
		return dao.p_delete_all(num);
	}
	public int d_delete_all(int num) {
		return dao.d_delete_all(num);
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
	public int p_blind(HashMap<String, Object> map) {
		return dao.p_blind(map);
	}
	public int d_blind(HashMap<String, Object> map) {
		return dao.d_blind(map);
	}
	public int ps_update(HashMap<String, Object> map) {
		return dao.ps_update(map);
	}
	public int ds_update(HashMap<String, Object> map) {
		return dao.ds_update(map);
	}
	public List<SingoVo> singo_list(HashMap<String, Object> map) {
		return dao.singo_list(map);
	}
	public List<PhotosingoVo> p_getinfo(int num2) {
		return dao.p_getinfo(num2);
	}
	public List<DiarysingoVo> d_getinfo(int num2) {
		return dao.d_getinfo(num2);
	}
	public Singo_getVo getinfo(HashMap<String, Object> map) {
		return dao.getinfo(map);
	}
	public int getcount()  {
		return dao.getcount();
	}
}
