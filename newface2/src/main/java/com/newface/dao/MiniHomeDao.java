package com.newface.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MiniHomeDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MiniHomeMapper";
	public int hompy_num(String id) {
		return sqlSession.selectOne(NAMESPACE + ".hompy_num", id);
	}
}
