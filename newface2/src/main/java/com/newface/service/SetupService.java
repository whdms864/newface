package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.SetupDao;
import com.newface.vo.HompyVo;
import com.newface.vo.ItemVo;
import com.newface.vo.IuVo;
import com.newface.vo.MineVo;
import com.newface.vo.Miniroom_HompyVo;
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
	public String hname_select(String id) {
		return dao.hname_select(id);
	}
	public ProfileVo profile(int hompy_num) {
		return dao.profile(hompy_num);
	}
	public int profile_insert(ProfileVo vo) {
		return dao.profile_insert(vo);
	}
	public List<IuVo> iu_request_list(String id){
		return dao.iu_request_list(id);
	}
	public int iu_insert(IuVo vo) {
		return dao.iu_insert(vo);
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
	public RoomposiVo mine_num_is(RoomposiVo vo) {
		return dao.mine_num_is(vo);
	}
	public List<Miniroom_HompyVo> miniroom_hompy(int mini_num){
		return dao.miniroom_hompy(mini_num);
	}
	public List<ItemVo> miniroom_decorate(String id){
		return dao.miniroom_decorate(id);
	}
	public List<ItemVo> skin_list(String id){
		return dao.skin_list(id);
	}
	public int skin_insert(RoomposiVo vo) {
		return dao.skin_insert(vo);
	}
	public int skin_delete(int mini_num) {
		return dao.skin_delete(mini_num);
	}
	public int item_num(int mine_num) {
		return dao.item_num(mine_num);
	}
	public RoomposiVo skin_mine_num(int mini_num) {
		return dao.skin_mine_num(mini_num);
	}
	public HompyVo hompy(String id) {
		return dao.hompy(id);
	}
	public List<ItemVo> minime_list(String id){
		return dao.minime_list(id);
	}
	public int minime_mine_num(int item_num) {
		return dao.minime_mine_num(item_num);
	}
	public int hompy_num(String id) {
		return dao.hompy_num(id);
	}
	public int minime_insert(HashMap<String, Object> map) {
		return dao.minime_insert(map);
	}
	public String minime_img(int mini_num) {
		return dao.minime_img(mini_num);
	}
	public RoomposiVo minime_is(int mini_num) {
		return dao.minime_is(mini_num);
	}
	public int minime_delete(int mini_num) {
		return dao.minime_delete(mini_num);
	}
}
