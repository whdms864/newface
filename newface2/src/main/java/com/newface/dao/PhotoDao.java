package com.newface.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.PhotoVo;
import com.newface.vo.PhotofolderVo;
import com.newface.vo.PhotolistVo;

@Repository
public class PhotoDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.PhotoMapper";
	
	public int hompy_num(String id) {
		return sqlSession.selectOne(NAMESPACE+".hompy_num",id);
	}
	public int folder_insert(PhotofolderVo vo) {
		return sqlSession.insert(NAMESPACE+".folder_insert",vo);
	}
	public List<PhotofolderVo> folder_list(int hompy_num){
		return sqlSession.selectList(NAMESPACE+".folder_list",hompy_num);
	}
	public int photo_insert(PhotoVo vo) {
		return sqlSession.insert(NAMESPACE+".photo_insert",vo);
	}
	public List<PhotolistVo> photo_list(int hompy_num){
		return sqlSession.selectList(NAMESPACE+".photo_list",hompy_num);
	}
}
