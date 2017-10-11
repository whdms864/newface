package com.newface.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.SetupDao;
import com.newface.vo.HompyVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;

@Service
public class SetupService {
	@Autowired public SetupDao dao;
	
	public SetupVo setup_list(int hompy_num) {
		return dao.setup_list(hompy_num);
	}
	public int menu_update(SetupVo vo) {
		return dao.menu_update(vo);
	}
	public int hname(HompyVo vo) {
		return dao.hname(vo);
	}
	public ProfileVo profile(int hompy_num) {
		return dao.profile(hompy_num);
	}
	public int profile_photo(ProfileVo vo) {
		return dao.profile_photo(vo);
	}
	public int profile_content(ProfileVo vo) {
		return dao.profile_content(vo);
	}
	public int profile_todayis(ProfileVo vo) {
		return dao.profile_todayis(vo);
	}
}
