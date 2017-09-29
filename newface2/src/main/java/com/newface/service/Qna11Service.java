package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newface.dao.Qna11Dao;
import com.newface.vo.Qna11Vo;
import com.newface.vo.Qna11comVo;

@Service
public class Qna11Service {
	@Autowired public Qna11Dao dao;
	public void setDao(Qna11Dao dao) {
		this.dao = dao;
	}
	public List<Qna11Vo> getinfo(String id) {
		return dao.getinfo(id);
	}
	public Qna11Vo getinfo(int qna11_num) {
		return dao.getinfo(qna11_num);
	}
	public Qna11comVo com_getinfo(int qna11_num) {
		return dao.com_getinfo(qna11_num);
	}
	public int insert(Qna11Vo vo) {
		return dao.insert(vo);
	}
	public int insert(Qna11comVo vo) {
		return dao.insert(vo);
	}
	public List<Qna11Vo> list(HashMap<String,Object> map) {
		return dao.list(map);
	}
	public int getCount() {
		return dao.getCount();
	}
	public int update(Qna11Vo vo) {
		return dao.update(vo);
	}
	public int com_update(Qna11comVo vo) {
		return dao.com_update(vo);
	}
	public int up_confirm(Qna11Vo vo) {
		return dao.up_confirm(vo);
	}
	public int delete(int qna11_num) {
		return dao.delete(qna11_num);
	}
	public int com_delete(int qna11_com_num) {
		return dao.com_delete(qna11_com_num);
	}
}
