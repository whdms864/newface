package com.newface.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MineDao;
import com.newface.vo.MineVo;

@Service
public class MineService {
	@Autowired public MineDao dao;
	public void setDao(MineDao dao) {
		this.dao = dao;
	}
	public List<MineVo> list(String id) {
		return dao.list(id);
	}
	public int insert(MineVo vo) {
		return dao.insert(vo);
	}
	public int update(MineVo vo) {
		return dao.update(vo);
	}
}
