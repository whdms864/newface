package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.PhotoVo;
import com.newface.vo.PhotocomVo;
import com.newface.vo.PhotofolderVo;
import com.newface.vo.PhotolistVo;

@Repository
public class PhotoDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.PhotoMapper";
	
	public int hompy_num(String id) {
		return sqlSession.selectOne(NAMESPACE+".hompy_num",id);
	}
	public int folder_insert(PhotofolderVo vo) {
		return sqlSession.insert(NAMESPACE+".folder_insert",vo);
	}
	public List<PhotofolderVo> folder_list(int hompy_num){
		return sqlSession.selectList(NAMESPACE+".folder_list",hompy_num);
	}
	public int photo_insert(PhotoVo vo) {
		return sqlSession.insert(NAMESPACE+".photo_insert",vo);
	}
	public List<PhotolistVo> photo_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".photo_list",map);
	}
	public String name(String id) {
		return sqlSession.selectOne(NAMESPACE+".name",id);
	}
	public int photo_delete(int photo_num) {
		return sqlSession.delete(NAMESPACE+".photo_delete",photo_num);
	}
	public int photo_love(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".photo_love",map);
	}
	public PhotoVo photo_update(int photo_num) {
		return sqlSession.selectOne(NAMESPACE+".photo_update",photo_num);
	}
	public int photo_updateok(PhotoVo vo) {
		return sqlSession.update(NAMESPACE+".photo_updateok",vo);
	}
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE+".count");
	}
	public int folder_update(PhotofolderVo vo) {
		return sqlSession.update(NAMESPACE+".folder_update",vo);
	}
	public int folder_delete(PhotofolderVo vo) {
		return sqlSession.delete(NAMESPACE+".folder_delete",vo);
	}
	public int com_insert(PhotocomVo vo) {
		return sqlSession.insert(NAMESPACE+".com_insert",vo);
	}
	public List<PhotocomVo> com_list(){
		return sqlSession.selectList(NAMESPACE+".com_list");
	}
	public int com_delete(int photo_com_num) {
		return sqlSession.delete(NAMESPACE+".com_delete",photo_com_num);
	}
}
