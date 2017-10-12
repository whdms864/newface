package com.newface.service;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MineDao;
import com.newface.vo.MineVo;
import com.newface.vo.Mine_Join_itemVo;

@Service
public class MineService {
	@Autowired public MineDao dao;
	public void setDao(MineDao dao) {
		this.dao = dao;
	}
	public List<MineVo> list(String id) {
		return dao.list(id);
	}
	public List<Mine_Join_itemVo> joinlist(String id) {
		return dao.joinlist(id);
	}
	public MineVo getinfo(HashMap<String,Object> map) {
		return dao.getinfo(map);
	}
	public int insert(MineVo vo) {
		return dao.insert(vo);
	}
	public int update(MineVo vo) {
		return dao.update(vo);
	}
}
