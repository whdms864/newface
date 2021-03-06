package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.AdminVo;
import com.newface.vo.HompyVo;
import com.newface.vo.IuVo;
import com.newface.vo.MemberVo;
import com.newface.vo.Member_Profile_Hompy_JoinVo;

@Repository
public class MemberDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MemberMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<MemberVo> getinfo_type(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".getinfo_type",map);
	}
	public List<MemberVo> listall(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".listall",map);
	}
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".count",map);
	}
	public int count_type(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".count_type",map);
	}
	public int profile_insert(int hompy_num) {
		return sqlSession.insert(NAMESPACE + ".profile_insert", hompy_num);
	}
	public MemberVo getinfo(String id) {
		MemberVo vo=sqlSession.selectOne(NAMESPACE+".getinfo",id);
		return vo;
	}
	public List<MemberVo> name_info(String name) {
		return sqlSession.selectList(NAMESPACE+".name_info",name);
	}
	public int setup_insert(int hompy_num) {
		int n=sqlSession.insert(NAMESPACE + ".setup_insert", hompy_num);
		return n;
	}
	public AdminVo getadmin(String id) {
		AdminVo vo=sqlSession.selectOne(NAMESPACE+".getadmin",id);
		return vo;
	}
	public int miniroom(int hompy_num) {
		int n=sqlSession.insert(NAMESPACE + ".miniroom", hompy_num);
		return n;
	}
	public int hompy_num(String id) {
		int hompy_num=sqlSession.selectOne(NAMESPACE + ".hompy_num", id);
		return hompy_num;
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
	public int update_type(HashMap<String, Object> map) {
		int n=sqlSession.update(NAMESPACE + ".update_type",map);
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
	public int diary_folder_insert(int hompy_num) {
		return sqlSession.insert(NAMESPACE + ".diary_folder_insert", hompy_num);
	}
	public int photo_folder_insert(int hompy_num) {
		return sqlSession.insert(NAMESPACE + ".photo_folder_insert", hompy_num);
	}
	public int today_today(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".today_today", hompy_num);
	}
	public int guest_now(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE + ".guest_now", hompy_num);
	}
	public int iu_request_list(String id){
		return sqlSession.selectOne(NAMESPACE + ".iu_request_list", id);
	}
	public List<Member_Profile_Hompy_JoinVo> fsearch(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".fsearch",map);
	}
	
	public int fsearch_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".fsearch_count",map);
	}
}
