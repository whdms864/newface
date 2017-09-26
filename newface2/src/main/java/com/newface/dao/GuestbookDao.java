package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.GuestbookVo;
import com.newface.vo.GuestbooklistVo;

@Repository
public class GuestbookDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.GuestbookMapper";
	
	public int insert(GuestbookVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	
	public List<GuestbooklistVo> list_all(){
		return sqlSession.selectList(NAMESPACE+".list_all");
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
}
