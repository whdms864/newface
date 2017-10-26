package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.CalendarListVo;
import com.newface.vo.DiaryListVo;
import com.newface.vo.DiaryVo;
import com.newface.vo.DiarycomVo;
import com.newface.vo.DiaryfolderVo;
import com.newface.vo.HompyVo;

@Repository
public class DiaryDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.DiaryMapper";
	
	public int insert(DiaryVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public List<DiaryVo> folder_list(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE + ".folder_list", map);
	}
	public DiaryVo content(int diary_num) {
		return sqlSession.selectOne(NAMESPACE + ".content", diary_num);
	}
	public int com_insert(DiarycomVo vo) {
		return sqlSession.insert(NAMESPACE + ".com_insert", vo);
	}
	public List<DiarycomVo> com_list(int diary_num) {
		return sqlSession.selectList(NAMESPACE + ".com_list", diary_num);
	}
	public String name(String id) {
		return sqlSession.selectOne(NAMESPACE + ".name", id);
	}
	public String id(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".id", hompy_num);
	}
	public List<DiaryListVo> folder_basic_list(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE + ".folder_basic_list", map);
	}
	public List<DiaryListVo> folder_all_list(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE + ".folder_all_list", map);
	}	
	public String diary_name(int diary_folder_num) {
		return sqlSession.selectOne(NAMESPACE + ".diary_name", diary_folder_num);
	}
	public int diary_all_count(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".diary_all_count", hompy_num);
	}
	public int diary_folder_count(HashMap<String, Integer> map) {
		return sqlSession.selectOne(NAMESPACE + ".diary_folder_count", map);
	}
	public int update(DiaryVo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	public List<Integer> com_is(int diary_num) {
		return sqlSession.selectList(NAMESPACE + ".com_is", diary_num);
	}
	public int com_all_delete(int diary_num){
		return sqlSession.delete(NAMESPACE + ".com_all_delete", diary_num);
	}
	public int delete(int diary_num){
		return sqlSession.delete(NAMESPACE + ".delete", diary_num);
	}
	public int hompy_num(String id) {
		return sqlSession.selectOne(NAMESPACE + ".hompy_num", id);
	}
	public int folder_insert(DiaryfolderVo vo) {
		return sqlSession.insert(NAMESPACE + ".folder_insert", vo);
	}
	public List<DiaryfolderVo> fname(int hompy_num) {
		return sqlSession.selectList(NAMESPACE + ".fname", hompy_num);
	}
	public List<String> regdate_d(String regdate_ym){
		return sqlSession.selectList(NAMESPACE + ".regdate_d", regdate_ym);
	}
	public int folder_move(DiaryVo vo) {
		return sqlSession.update(NAMESPACE + ".folder_move", vo);
	}
	public String fname_select(int diary_folder_num) {
		return sqlSession.selectOne(NAMESPACE + ".fname_select", diary_folder_num);
	}
	public int folder_update(DiaryfolderVo vo) {
		return sqlSession.update(NAMESPACE + ".folder_update", vo);
	}
	public List<Integer> diary_is(int diary_folder_num){
		return sqlSession.selectOne(NAMESPACE + ".diary_is", diary_folder_num);
	}
	public int diary_delete(int diary_folder_num) {
		return sqlSession.delete(NAMESPACE + ".diary_delete", diary_folder_num);
	}
	public int folder_delete(DiaryfolderVo vo) {
		return sqlSession.delete(NAMESPACE + ".folder_delete", vo);
	}
	public int com_update(DiarycomVo vo) {
		return sqlSession.update(NAMESPACE + ".com_update", vo);
	}
	public int com_delete(int diary_com_num) {
		return sqlSession.delete(NAMESPACE + ".com_delete", diary_com_num);
	}
	public HompyVo hompy_is(HompyVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".hompy_is", vo);
	}
	public List<CalendarListVo> group_m(CalendarListVo vo){
		return sqlSession.selectList(NAMESPACE + ".group_m", vo);
	}
	public List<CalendarListVo> get_m(CalendarListVo vo){
		return sqlSession.selectList(NAMESPACE + ".get_m", vo);
	}
	public CalendarListVo diary_m(int diary_num) {
		return sqlSession.selectOne(NAMESPACE + ".diary_m", diary_num);
	}
	public int get_diary_num() {
		return sqlSession.selectOne(NAMESPACE + ".get_diary_num");
	}
	public DiaryVo diary_basic(int diary_num) {
		return sqlSession.selectOne(NAMESPACE + ".diary_basic", diary_num);
	}
	public int diary_com_delete(int diary_num) {
		return sqlSession.delete(NAMESPACE + ".diary_com_delete", diary_num);
	}
}
