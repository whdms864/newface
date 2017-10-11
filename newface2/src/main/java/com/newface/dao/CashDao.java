package com.newface.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.CashVo;


@Repository
public class CashDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.CashMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(CashVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public CashVo list(String id) {
		return sqlSession.selectOne(NAMESPACE+".list_all",id);
	}
	public int update(CashVo vo) {
		return sqlSession.insert(NAMESPACE+".update",vo);
	}
}
