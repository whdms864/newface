package com.newface.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.CashDao;
import com.newface.vo.CashVo;

@Service
public class CashService {
	@Autowired public CashDao dao;
	public void setDao(CashDao dao) {
		this.dao = dao;
	}
	public CashVo list(String id) {
		return dao.list(id);
	}
	public int insert(CashVo vo) {
		return dao.insert(vo);
	}
	public int update(CashVo vo) {
		return dao.update(vo);
	}
}
