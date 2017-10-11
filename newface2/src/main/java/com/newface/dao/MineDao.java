package com.newface.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.MineVo;


@Repository
public class MineDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MineMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(MineVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public List<MineVo> list(String id) {
		return sqlSession.selectList(NAMESPACE+".list_all",id);
	}
	public int update(MineVo vo) {
		return sqlSession.insert(NAMESPACE+".update",vo);
	}
}
