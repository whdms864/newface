package com.newface.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.BuyVo;
import com.newface.vo.Buy_Join_ItemVo;


@Repository
public class BuyDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.BuyMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(BuyVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public List<BuyVo> list(String id) {
		return sqlSession.selectList(NAMESPACE+".list_all",id);
	}
	public List<Buy_Join_ItemVo> joinlist(String id) {
		return sqlSession.selectList(NAMESPACE+".list_join",id);
	}
}
