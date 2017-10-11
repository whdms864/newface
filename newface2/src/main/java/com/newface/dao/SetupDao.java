package com.newface.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.HompyVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;

@Repository
public class SetupDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.SetupMapper";
	
	public SetupVo setup_list(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".setup_list", hompy_num);
	}
	public int menu_update(SetupVo vo) {
		return sqlSession.update(NAMESPACE + ".menu_update", vo);
	}
	public int hname(HompyVo vo) {
		return sqlSession.update(NAMESPACE + ".hname", vo);
	}
	public ProfileVo profile(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".profile", hompy_num);
	}
	public int profile_photo(ProfileVo vo) {
		return sqlSession.update(NAMESPACE + ".profile_photo", vo);
	}
	public int profile_content(ProfileVo vo) {
		return sqlSession.update(NAMESPACE + ".profile_content", vo);
	}
	public int profile_todayis(ProfileVo vo) {
		return sqlSession.update(NAMESPACE + ".profile_todayis", vo);
	}
}
