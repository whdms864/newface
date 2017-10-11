package com.newface.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MiniHomeDao;
import com.newface.vo.HompyVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;


@Service
public class MiniHomeService {
	@Autowired public MiniHomeDao dao;

	public int hompy_num(String id) {
		return dao.hompy_num(id);
	}
	public SetupVo setup_list(int hompy_num) {
		return dao.setup_list(hompy_num);
	}
	public HompyVo hompy(String id) {
		return dao.hompy(id);
	}
	public ProfileVo profile(int hompy_num) {
		return dao.profile(hompy_num);
	}
}
