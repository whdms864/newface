package com.newface.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.BuyDao;
import com.newface.vo.BuyVo;
import com.newface.vo.Buy_Join_ItemVo;

@Service
public class BuyService {
	@Autowired public BuyDao dao;
	public void setDao(BuyDao dao) {
		this.dao = dao;
	}
	public List<BuyVo> list(String id) {
		return dao.list(id);
	}
	public List<Buy_Join_ItemVo> joinlist(String id) {
		return dao.joinlist(id);
	}
	public int insert(BuyVo vo) {
		return dao.insert(vo);
	}

}
