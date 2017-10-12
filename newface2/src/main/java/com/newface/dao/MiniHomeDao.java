package com.newface.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.HompyVo;
import com.newface.vo.IuVo;
import com.newface.vo.IucomVo;
import com.newface.vo.MemberVo;
import com.newface.vo.NowVo;
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
	public List<NowVo> now(int hompy_num) {
		return sqlSession.selectList(NAMESPACE + ".now", hompy_num);
	}
	public int diary_count(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".diary_count", hompy_num);
	}
	public int diary_now(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".diary_now", hompy_num);
	}
	public int photo_count(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".photo_count", hompy_num);
	}
	public int photo_now(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".photo_now", hompy_num);
	}
	public int guest_count(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".guest_count", hompy_num);
	}
	public int guest_now(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".guest_now", hompy_num);
	}
	public MemberVo profile_member(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".profile_member", hompy_num);
	}
	public String id(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".id", hompy_num);
	}
	public int iu_request(IuVo vo) {
		return sqlSession.insert(NAMESPACE + ".iu_request", vo);
	}
	public int iu_com(IucomVo vo) {
		return sqlSession.insert(NAMESPACE + ".iu_com", vo);
	}
	public int iu_is(IuVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".iu_is", vo);
	}
	public List<IucomVo> iu_com_list(int hompy_num){
		return sqlSession.selectList(NAMESPACE + ".iu_com_list", hompy_num);
	}
	public String name(String id) {
		return sqlSession.selectOne(NAMESPACE + ".name", id);
	}
}
