package com.newface.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.NotiVo;

@Repository
public class NotiDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.NotiMapper";
	
	public int insert(NotiVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	
	public List<NotiVo> notilist(){
		return sqlSession.selectList(NAMESPACE+".notilist");
	}
}
