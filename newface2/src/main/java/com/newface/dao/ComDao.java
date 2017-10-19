package com.newface.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.ComVo;


@Repository
public class ComDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.ComMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<ComVo> p_c_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".p_c_list",map);
	}
	public List<ComVo> d_c_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".d_c_list",map);
	}
	public int p_c_list_all(int num) {
		return sqlSession.selectOne(NAMESPACE+".p_c_list_all",num);
	}
	public int d_c_list_all(int num) {
		return sqlSession.selectOne(NAMESPACE+".d_c_list_all",num);
	}
}
