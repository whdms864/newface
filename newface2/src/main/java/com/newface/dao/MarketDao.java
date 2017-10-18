package com.newface.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.CategoryVo;
import com.newface.vo.ItemVo;
import com.newface.vo.Qna11Vo;
import com.newface.vo.Qna11comVo;

@Repository
public class MarketDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MarketMapper";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(CategoryVo vo) {
		return sqlSession.insert(NAMESPACE+".insert_cate",vo);
	}
	public int insert(ItemVo vo) {
		return sqlSession.insert(NAMESPACE+".insert_item",vo);
	}
	public List<CategoryVo> list_cate(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".list_cate",map);
	}
	public List<CategoryVo> list_cate_all() {
		return sqlSession.selectList(NAMESPACE+".list_cate_all");
	}
	public List<ItemVo> list_item(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".list_item",map);
	}
	public int getCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".count",map);
	}
	public int getCount() {
		return sqlSession.selectOne(NAMESPACE+".count_cate");
	}
	public CategoryVo getinfo_cate(int category_num) {
		return sqlSession.selectOne(NAMESPACE+".getinfo_cate",category_num);
	}
	public ItemVo getinfo_item(int item_num) {
		return sqlSession.selectOne(NAMESPACE+".getinfo_item",item_num);
	}
	public int delete_item(int item_num) {
		return sqlSession.delete(NAMESPACE+".delete_item",item_num);
	}
	public int delete_cate(int category_num) {
		return sqlSession.insert(NAMESPACE+".delete_cate",category_num);
	}
	public int update_item(ItemVo vo) {
		return sqlSession.delete(NAMESPACE+".update_item",vo);
	}
	public int update_cate(CategoryVo vo) {
		return sqlSession.insert(NAMESPACE+".update_cate",vo);
	}
	public String minime_info(String id) {
		return sqlSession.selectOne(NAMESPACE + ".minime_info", id);
	}
}
