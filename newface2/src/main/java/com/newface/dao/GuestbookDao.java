package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.GuestbookVo;
import com.newface.vo.GuestbookcomVo;
import com.newface.vo.GuestbooklistVo;
import com.newface.vo.GuestcomlistVo;
import com.newface.vo.HompyVo;

@Repository
public class GuestbookDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.GuestbookMapper";
	
	public int insert(GuestbookVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	
	public List<GuestbooklistVo> list_all(HashMap<String,Object> map){
		return sqlSession.selectList(NAMESPACE+".list_all",map);
	}
	public int secret(HashMap<String,Object> map) {
		return sqlSession.update(NAMESPACE+".secret",map);
	}
	public int delete(int guest_num) {
		return sqlSession.delete(NAMESPACE+".delete",guest_num);
	}
	public GuestbookVo update(int guest_num) {
		return sqlSession.selectOne(NAMESPACE+".update",guest_num);
	}
	public int updateok(GuestbookVo vo) {
		return sqlSession.update(NAMESPACE+".updateok",vo);
	}
	public int com_insert(GuestbookcomVo vo) {
		return sqlSession.insert(NAMESPACE+".com_insert",vo);
	}
	public List<GuestcomlistVo> com_list(){
		return sqlSession.selectList(NAMESPACE+".com_list");
	}
	public int com_delete(int guest_com_num) {
		return sqlSession.delete(NAMESPACE+".com_delete",guest_com_num);
	}
/*	public int getCount(HashMap<String,Object> map) {
		return sqlSession.selectOne(NAMESPACE+".count",map);
	}*/
	public int getCount(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE+".count",hompy_num);
	}
	public int getCount1(int hompy_num) {
		return sqlSession.selectOne(NAMESPACE+".count1",hompy_num);
	}
	public String minime_info(String id) {
		return sqlSession.selectOne(NAMESPACE + ".minime_info", id);
	}
	public HompyVo hompy_is(HompyVo vo) {
		return sqlSession.selectOne(NAMESPACE+".hompy_is",vo);
	}
	public List<GuestbooklistVo> list_1(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".list_1",map);
	}
}
