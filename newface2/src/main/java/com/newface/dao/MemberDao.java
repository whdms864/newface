package com.newface.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.AdminVo;
import com.newface.vo.HompyVo;
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
	
	public AdminVo getadmin(String id) {
		AdminVo vo=sqlSession.selectOne(NAMESPACE+".getadmin",id);
		return vo;
	}
	
	
	public int insert(MemberVo vo) {
		int n=sqlSession.insert(NAMESPACE+".insert",vo);
		return n;
	}
	public int hompyinsert(HompyVo vo) {
		int n=sqlSession.insert(NAMESPACE+".hompyinsert",vo);
		return n;
	}
	public MemberVo isMember(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE+ ".isMember",map);
	}
	
	public AdminVo isAdmin(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE+ ".isAdmin",map);
	}
		
	
	public MemberVo mypage(String id) {
		MemberVo vo=sqlSession.selectOne(NAMESPACE + ".mypage",id);
		return vo;
	}
	
	public int update(MemberVo vo) {
		int n=sqlSession.update(NAMESPACE + ".update",vo);
		return n;
	}
	
	public int leave(MemberVo vo) {
		int n=sqlSession.update(NAMESPACE+".leave",vo);
		return n;
	}
	
	public String searchid(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE+ ".searchid",map);
	}
	
	public String searchpwd(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE+ ".serachpwd",map);
	}
	
	
}
