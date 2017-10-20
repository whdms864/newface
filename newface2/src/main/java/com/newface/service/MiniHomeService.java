package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MiniHomeDao;
import com.newface.vo.HompyVo;
import com.newface.vo.ItemVo;
import com.newface.vo.IuVo;
import com.newface.vo.Iu_NameVo;
import com.newface.vo.IucomVo;
import com.newface.vo.MemberVo;
import com.newface.vo.Miniroom_HompyVo;
import com.newface.vo.NowVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.RoomposiVo;
import com.newface.vo.SetupVo;
import com.newface.vo.TodayVo;


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
	public List<ProfileVo> profile_list(int hompy_num){
		return dao.profile_list(hompy_num);
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
	public String id(int hompy_num) {
		return dao.id(hompy_num);
	}
	public int iu_request(IuVo vo) {
		return dao.iu_request(vo);
	}
	public int iu_com(IucomVo vo) {
		return dao.iu_com(vo);
	}
	public IuVo iu_is(IuVo vo) {
		return dao.iu_is(vo);
	}
	public List<IucomVo> iu_com_list(int hompy_num){
		return dao.iu_com_list(hompy_num);
	}
	public String name(String id) {
		return dao.name(id);
	}
	public IuVo iu_before(IuVo vo) {
		return dao.iu_before(vo);
	}
	public int mini_num(int hompy_num) {
		return dao.mini_num(hompy_num);
	}
	public List<Miniroom_HompyVo> miniroom_hompy(int mini_num){
		return dao.miniroom_hompy(mini_num);
	}
	public RoomposiVo mine_num(int mini_num) {
		return dao.mine_num(mini_num);
	}
	public int item_num(int mine_num) {
		return dao.item_num(mine_num);
	}
	public String item_img(int item_num) {
		return dao.item_img(item_num);
	}
	public List<Iu_NameVo> iu_list(String id){
		return dao.iu_list(id);
	}
	public List<TodayVo> today_is(HashMap<String, Object> map){
		return dao.today_is(map);
	}
	public int today_insert(HashMap<String, Object> map) {
		return dao.today_insert(map);
	}
	public int today_today(int hompy_num) {
		return dao.today_today(hompy_num);
	}
	public int today_total(int hompy_num) {
		return dao.today_total(hompy_num);
	}
	public List<IucomVo> iu_history(HashMap<String, Object> map){
		return dao.iu_history(map);
	}
	public int iu_com_count(HashMap<String, Object> map) {
		return dao.iu_com_count(map);
	}
	public List<ItemVo> bgm_list(int mini_num){
		return dao.bgm_list(mini_num);
	}
	public int iu_delete(IuVo iu) {
		return dao.iu_delete(iu);
	}
}
