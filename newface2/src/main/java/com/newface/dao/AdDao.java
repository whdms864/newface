package com.newface.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.AderVo;



@Repository
public class AdDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.AdMapper";

	public int ader_insert(AderVo vo) {
		return sqlSession.insert(NAMESPACE + ".ader_insert",vo);
	}
	
	public List<AderVo> ader_list(){
		return sqlSession.selectList(NAMESPACE+".ader_list");
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
}
