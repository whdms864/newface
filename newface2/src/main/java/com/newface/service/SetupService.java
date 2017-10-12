package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.SetupDao;
import com.newface.vo.HompyVo;
import com.newface.vo.IuVo;
import com.newface.vo.MineVo;
import com.newface.vo.Miniroom_listVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.RoomposiVo;
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
	public List<IuVo> iu_request_list(String id){
		return dao.iu_request_list(id);
	}
	public int iuOk(IuVo vo) {
		return dao.iuOk(vo);
	}
	public List<Miniroom_listVo> miniroom_wallpaper(Miniroom_listVo vo){
		return dao.miniroom_wallpaper(vo);
	}
	public String item_img(int item_num) {
		return dao.item_img(item_num);
	}
	public int mini_num(int hompy_num) {
		return dao.mini_num(hompy_num);
	}
	public int mine_num(MineVo vo) {
		return dao.mine_num(vo);
	}
	public int position_insert(RoomposiVo vo) {
		return dao.position_insert(vo);
	}
}
