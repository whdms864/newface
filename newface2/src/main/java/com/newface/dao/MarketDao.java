package com.newface.dao;


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
	public List<CategoryVo> list_cate() {
		return sqlSession.selectList(NAMESPACE+".list_cate");
	}
	public List<ItemVo> list_item() {
		return sqlSession.selectList(NAMESPACE+".list_item");
	}
	public CategoryVo getinfo_cate(int category_num) {
		return sqlSession.selectOne(NAMESPACE+".getinfo_cate",category_num);
	}
	public ItemVo getinfo_item(int item_num) {
		return sqlSession.selectOne(NAMESPACE+".getinfo_item",item_num);
	}
}
