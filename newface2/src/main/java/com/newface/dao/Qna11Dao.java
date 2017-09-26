package com.newface.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.Qna11Vo;

@Repository
public class Qna11Dao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.Qna11Mapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Qna11Vo> getinfo(String id) {
		return sqlSession.selectList(NAMESPACE+".getinfo",id);
	}
	
	public int insert(Qna11Vo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public List<Qna11Vo> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}
}
