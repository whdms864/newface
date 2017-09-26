package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.newface.dao.Qna11Dao;
import com.newface.vo.Qna11Vo;

@Service
public class Qna11Service {
	@Autowired public Qna11Dao dao;
	public void setDao(Qna11Dao dao) {
		this.dao = dao;
	}
	public List<Qna11Vo> getinfo(String id) {
		return dao.getinfo(id);
	}
	public int insert(Qna11Vo vo) {
		return dao.insert(vo);
	}
	public List<Qna11Vo> list() {
		return dao.list();
	}
}
