package com.newface.dao;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.DiarysingoVo;
import com.newface.vo.PhotosingoVo;


@Repository
public class SingoDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.SingoMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int p_insert(PhotosingoVo vo) {
		return sqlSession.insert(NAMESPACE+".p_insert",vo);
	}
	public int d_insert(DiarysingoVo vo) {
		return sqlSession.insert(NAMESPACE+".d_insert",vo);
	}
	public int p_delete(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".p_delete",map);
	}
	public int d_delete(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".d_delete",map);
	}
	public PhotosingoVo p_list(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".p_list",map);
	}
	public DiarysingoVo d_list(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".d_list",map);
	}
	public int p_update(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".p_update",map);
	}
	public int d_update(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE+".d_update",map);
	}
}
