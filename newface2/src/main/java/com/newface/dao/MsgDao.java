package com.newface.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newface.vo.AdminMsgVo;
import com.newface.vo.Iu_NameVo;
import com.newface.vo.MsgVo;

@Repository
public class MsgDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.newface.mybatis.MsgMapper";
	
	public int msg_insert(MsgVo vo) {
		return sqlSession.insert(NAMESPACE+".msg_insert",vo);
	}
	
	public List<MsgVo> msgrecv_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".msgrecv_list",map);
	}
	
	public int msgrecv_count(String loginid) {
		return sqlSession.selectOne(NAMESPACE+".msgrecv_count",loginid);
	}
	
	public int msgnorecv_count(String loginid) {
		return sqlSession.selectOne(NAMESPACE+".msgnorecv_count",loginid);
	}
	
	public List<MsgVo> msgsend_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".msgsend_list",map);
	}
	public int msgsend_count(String loginid) {
		return sqlSession.selectOne(NAMESPACE+".msgsend_count",loginid);
	}
	
	public int msgrecv_delete(int msg_num) {
		return sqlSession.update(NAMESPACE+".msgrecv_delete",msg_num);
	}
	
	public int msgsend_delete(int msg_num) {
		return sqlSession.update(NAMESPACE+".msgsend_delete",msg_num);
	}
	
	public int msgrecv_chk(int msg_num) {
		return sqlSession.update(NAMESPACE+".msgrecv_chk",msg_num);
	}
	public MsgVo msgrecv_getinfo(int msg_num) {
		return sqlSession.selectOne(NAMESPACE+".msgrecv_getinfo",msg_num);
	}
	
	public int send_clx(int msg_num) {
		return sqlSession.update(NAMESPACE+".send_clx",msg_num);
	}
	
	public List<Iu_NameVo> iu_list(String loginid) {
		return sqlSession.selectList(NAMESPACE + ".iu_list", loginid);
	}
	
	
	///////////////// 관리자 쪽지 ///////////////
	
	public int adminmsg_insert(AdminMsgVo vo) {
		return sqlSession.insert(NAMESPACE + ".adminmsg_insert",vo);
	}
	
	public List<AdminMsgVo> adminmsg_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+ ".adminmsg_list",map);
	}
	
	public int adminmsg_count (String loginid) {
		return sqlSession.selectOne(NAMESPACE + ".adminmsg_count",loginid);
	}
	
	public int adminmsg_delete(int adminmsg_num) {
		return sqlSession.update(NAMESPACE + ".adminmsg_delete",adminmsg_num);
	}
	
	public AdminMsgVo adminmsg_getinfo(int adminmsg_num) {
		return sqlSession.selectOne(NAMESPACE+".adminmsg_getinfo",adminmsg_num);
	}

}
