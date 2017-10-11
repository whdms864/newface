package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.AdDao;
import com.newface.vo.AderVo;

@Service
public class AdService {
	@Autowired public AdDao dao;
	
	public void setDao(AdDao dao) {
		this.dao = dao;
	}
	public int ader_insert(AderVo vo) {
		return dao.ader_insert(vo);
	}
	public List<AderVo> ader_list(){
		return dao.ader_list();
	}
	public AderVo ader_getinfo(int ader_num) {
		return dao.ader_getinfo(ader_num);
	}
	public int ader_update(AderVo vo) {
		return dao.ader_update(vo);
	}
	public int ader_delete(int ader_num) {
		return dao.ader_delete(ader_num);
	}
}
