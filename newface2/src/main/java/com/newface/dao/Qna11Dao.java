package com.newface.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.Qna11Vo;
import com.newface.vo.Qna11comVo;

@Repository
public class Qna11Dao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.Qna11Mapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Qna11Vo> getinfo(HashMap<String,Object> map) {
		return sqlSession.selectList(NAMESPACE+".getinfo",map);
	}
	public Qna11Vo getinfo(int qna11_num) {
		return sqlSession.selectOne(NAMESPACE+".getinfo2",qna11_num);
	}
	public Qna11comVo com_getinfo(int qna11_num) {
		return sqlSession.selectOne(NAMESPACE+".com_getinfo",qna11_num);
	}
	
	public int insert(Qna11Vo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public int insert(Qna11comVo vo) {
		return sqlSession.insert(NAMESPACE+".com_insert",vo);
	}
	public int update(Qna11Vo vo) {
		return sqlSession.update(NAMESPACE+".update",vo);
	}
	public int com_update(Qna11comVo vo) {
		return sqlSession.update(NAMESPACE+".com_update",vo);
	}
	public int up_confirm(Qna11Vo vo) {
		return sqlSession.update(NAMESPACE+".up_confirm",vo);
	}
	public int delete(int qna11_num) {
		return sqlSession.delete(NAMESPACE+".delete",qna11_num);
	}
	public int com_delete(int qna11_com_num) {
		return sqlSession.delete(NAMESPACE+".com_delete",qna11_com_num);
	}
	public List<Qna11Vo> list(HashMap<String,Object> map) {
		return sqlSession.selectList(NAMESPACE+".list",map);
	}
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE+".count");
	}
	public int getCount(String id) {
		return sqlSession.selectOne(NAMESPACE+".count_user",id);
	}
}
