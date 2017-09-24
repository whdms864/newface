package com.newface.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.DiaryVo;
import com.newface.vo.DiarycomVo;
import com.newface.vo.DiaryfolderVo;

@Repository
public class DiaryDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.DiaryMapper";
	
	public int insert(DiaryVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public List<DiaryVo> folder_list(int diary_folder_num){
		return sqlSession.selectList(NAMESPACE + ".folder_list", diary_folder_num);
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
	public List<DiaryVo> folder_all_list(){
		return sqlSession.selectList(NAMESPACE + ".folder_all_list");
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
}
