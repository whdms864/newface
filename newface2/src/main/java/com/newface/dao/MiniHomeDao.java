package com.newface.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.HompyVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;

@Repository
public class MiniHomeDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MiniHomeMapper";
	public int hompy_num(String id) {
		return sqlSession.selectOne(NAMESPACE + ".hompy_num", id);
	}
	public SetupVo setup_list(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".setup_list", hompy_num);
	}
	public HompyVo hompy(String id) {
		return sqlSession.selectOne(NAMESPACE + ".hompy", id);
	}
	public ProfileVo profile(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".profile", hompy_num);
	}
}
