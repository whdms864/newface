package com.newface.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.TimelineVo;


@Repository
public class TimelineDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.TimelineMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<TimelineVo> list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".list",map);
	}
	public String pro_img(String id) {
		return sqlSession.selectOne(NAMESPACE+".pro_img",id);
	}
}
