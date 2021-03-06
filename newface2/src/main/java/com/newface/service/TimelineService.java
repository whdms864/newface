package com.newface.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.TimelineDao;
import com.newface.vo.TimelineVo;

@Service
public class TimelineService {
	@Autowired public TimelineDao dao;
	
	public List<TimelineVo> list(HashMap<String, Object> map) {
		return dao.list(map);
	}
	public String pro_img(String id) {
		return dao.pro_img(id);
	}
}
