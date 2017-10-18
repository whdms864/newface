package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.AdVo;
import com.newface.vo.AderVo;



@Repository
public class AdDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.AdMapper";

	public int ader_insert(AderVo vo) {
		return sqlSession.insert(NAMESPACE + ".ader_insert",vo);
	}
	
	public List<AderVo> ader_list(HashMap<String,Object> map){
		return sqlSession.selectList(NAMESPACE+".ader_list",map);
	}
	
	public AderVo ader_getinfo(int ader_num) {
		return sqlSession.selectOne(NAMESPACE+ ".ader_getinfo",ader_num);
	}
	
	public int ader_delete(int ader_num) {
		return sqlSession.delete(NAMESPACE + ".ader_delete",ader_num);
	}
	
	public int ader_update(AderVo vo) {
		return sqlSession.update(NAMESPACE+ ".ader_update",vo);
	}
	
	public int ader_count() {
		return sqlSession.selectOne(NAMESPACE + ".ader_count");
	}
	
	public int ad_insert(AdVo vo) {
		return sqlSession.insert(NAMESPACE + ".ad_insert",vo);
	}
	
	public List<AdVo> ad_list(HashMap<String,Object> map){
		return sqlSession.selectList(NAMESPACE+".ad_list",map);
	}
	
	public AdVo ad_getinfo(int ad_num) {
		return sqlSession.selectOne(NAMESPACE+ ".ad_getinfo",ad_num);
	}
	
	public int ad_delete(int ad_num) {
		return sqlSession.delete(NAMESPACE + ".ad_delete",ad_num);
	}
	
	public int ad_update(AdVo vo) {
		return sqlSession.update(NAMESPACE+ ".ad_update",vo);
	}
	
	public int ad_count(int ader_num) {
		return sqlSession.selectOne(NAMESPACE + ".ad_count",ader_num);
	}
}
