package com.newface.dao;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.MineVo;
import com.newface.vo.Qna11Vo;


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
	public MineVo getinfo(HashMap<String,Object> map) {
		return sqlSession.selectOne(NAMESPACE+".getinfo",map);
	}
	public int update(MineVo vo) {
		return sqlSession.insert(NAMESPACE+".update",vo);
	}
}
