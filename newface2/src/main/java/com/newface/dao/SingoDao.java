package com.newface.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.DiarysingoVo;
import com.newface.vo.PhotosingoVo;
import com.newface.vo.SingoVo;
import com.newface.vo.Singo_getVo;


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
		return sqlSession.delete(NAMESPACE+".p_delete",map);
	}
	public int d_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".d_delete",map);
	}
	public PhotosingoVo p_list(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".p_list",map);
	}
	public DiarysingoVo d_list(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".d_list",map);
	}
	public int p_update(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".p_update",map);
	}
	public int d_update(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".d_update",map);
	}
	public int p_blind(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".p_blind",map);
	}
	public int d_blind(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".d_blind",map);
	}
	public int ps_update(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".ps_update",map);
	}
	public int ds_update(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".ds_update",map);
	}
	public List<SingoVo> singo_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".singo_list",map);
	}
	public List<PhotosingoVo> p_getinfo(int num2) {
		return sqlSession.selectList(NAMESPACE+".p_getinfo",num2);
	}
	public List<DiarysingoVo> d_getinfo(int num2) {
		return sqlSession.selectList(NAMESPACE+".d_getinfo",num2);
	}
	public Singo_getVo getinfo(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".getinfo",map);
	}
	public int getcount() {
		return sqlSession.selectOne(NAMESPACE+".getcount");
	}
}
