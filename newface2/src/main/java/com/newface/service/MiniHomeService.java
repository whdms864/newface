package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MiniHomeDao;
import com.newface.vo.HompyVo;
import com.newface.vo.MemberVo;
import com.newface.vo.NowVo;
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
	public List<NowVo> now(int hompy_num){
		return dao.now(hompy_num);
	}
	public int diary_count(int hompy_num) {
		return dao.diary_count(hompy_num);
	}
	public int diary_now(int hompy_num) {
		return dao.diary_now(hompy_num);
	}
	public int photo_count(int hompy_num) {
		return dao.photo_count(hompy_num);
	}
	public int photo_now(int hompy_num) {
		return dao.photo_now(hompy_num);
	}
	public int guest_count(int hompy_num) {
		return dao.guest_count(hompy_num);
	}
	public int guest_now(int hompy_num) {
		return dao.guest_now(hompy_num);
	}
	public MemberVo profile_member(int hompy_num) {
		return dao.profile_member(hompy_num);
	}
}
