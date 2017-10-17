package com.newface.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.Diary_loveVo;
import com.newface.vo.PhotoVo;
import com.newface.vo.Photo_loveVo;


@Repository
public class LoveDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.LoveMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int p_insert(Photo_loveVo vo) {
		return sqlSession.insert(NAMESPACE+".p_insert",vo);
	}
	public int d_insert(Diary_loveVo vo) {
		return sqlSession.insert(NAMESPACE+".d_insert",vo);
	}
	public int p_delete(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".p_delete",map);
	}
	public int d_delete(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".d_delete",map);
	}
	public Photo_loveVo p_list(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".p_list",map);
	}
	public Diary_loveVo d_list(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".d_list",map);
	}
	public int p_update(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".p_update",map);
	}
	public int d_update(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".d_update",map);
	}
}
