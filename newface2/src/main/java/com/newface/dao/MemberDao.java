package com.newface.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.MemberVo;

@Repository
public class MemberDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MemberMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MemberVo getinfo(String id) {
		MemberVo vo=sqlSession.selectOne(NAMESPACE+".getinfo",id);
		return vo;
	}
	
	public int insert(MemberVo vo) {
		int n=sqlSession.insert(NAMESPACE+".insert",vo);
		return n;
	}
}
