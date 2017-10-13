package com.newface.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.HompyVo;
import com.newface.vo.ItemVo;
import com.newface.vo.IuVo;
import com.newface.vo.MineVo;
import com.newface.vo.Miniroom_HompyVo;
import com.newface.vo.Miniroom_listVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.RoomposiVo;
import com.newface.vo.SetupVo;

@Repository
public class SetupDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.SetupMapper";
	
	public SetupVo setup_list(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".setup_list", hompy_num);
	}
	public int menu_update(SetupVo vo) {
		return sqlSession.update(NAMESPACE + ".menu_update", vo);
	}
	public int hname(HompyVo vo) {
		return sqlSession.update(NAMESPACE + ".hname", vo);
	}
	public ProfileVo profile(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".profile", hompy_num);
	}
	public int profile_photo(ProfileVo vo) {
		return sqlSession.update(NAMESPACE + ".profile_photo", vo);
	}
	public int profile_content(ProfileVo vo) {
		return sqlSession.update(NAMESPACE + ".profile_content", vo);
	}
	public int profile_todayis(ProfileVo vo) {
		return sqlSession.update(NAMESPACE + ".profile_todayis", vo);
	}
	public List<IuVo> iu_request_list(String id){
		return sqlSession.selectList(NAMESPACE + ".iu_request_list", id);
	}
	public int iuOk(IuVo vo) {
		return sqlSession.update(NAMESPACE + ".iuOk", vo);
	}
	public List<Miniroom_listVo> miniroom_wallpaper(Miniroom_listVo vo){
		return sqlSession.selectList(NAMESPACE + ".miniroom_wallpaper", vo);
	}
	public String item_img(int item_num) {
		return sqlSession.selectOne(NAMESPACE + ".item_img", item_num);
	}
	public int mini_num(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".mini_num", hompy_num);
	}
	public int mine_num(MineVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".mine_num", vo);
	}
	public int position_insert(RoomposiVo vo) {
		return sqlSession.insert(NAMESPACE + ".position_insert", vo);
	}
	public RoomposiVo mine_num_is(RoomposiVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".mine_num_is", vo);
	}
	public List<Miniroom_HompyVo> miniroom_hompy(int mini_num){
		return sqlSession.selectList(NAMESPACE + ".miniroom_hompy", mini_num);
	}
	public List<ItemVo> miniroom_decorate(String id){
		return sqlSession.selectList(NAMESPACE + ".miniroom_decorate", id);
	}
	public List<ItemVo> skin_list(String id){
		return sqlSession.selectList(NAMESPACE + ".skin_list", id);
	}
	public int skin_insert(RoomposiVo vo) {
		return sqlSession.insert(NAMESPACE + ".skin_insert", vo);
	}
	public int skin_delete(int mini_num) {
		return sqlSession.delete(NAMESPACE + ".skin_delete", mini_num);
	}
	public int item_num(int mine_num) {
		return sqlSession.selectOne(NAMESPACE + ".item_num", mine_num);
	}
	public int skin_mine_num(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".skin_mine_num", hompy_num);
	}
}
