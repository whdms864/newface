package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.NotiDao;
import com.newface.vo.NotiVo;

@Service
public class NotiService {
	@Autowired public NotiDao dao;
	public void setDao(NotiDao dao) {
		this.dao = dao;
	}
		
	public int insert(NotiVo vo) {
		return dao.insert(vo);
	}
	
	public List<NotiVo> list(){
		return dao.notilist();
	}
}
