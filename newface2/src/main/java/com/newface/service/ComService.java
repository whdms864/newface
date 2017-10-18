package com.newface.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.ComDao;
import com.newface.vo.ComVo;

@Service
public class ComService {
	@Autowired public ComDao dao;
	
	public List<ComVo> p_c_list(HashMap<String, Object> map) {
		return dao.p_c_list(map);
	}
	public List<ComVo> d_c_list(HashMap<String, Object> map) {
		return dao.d_c_list(map);
	}
}
