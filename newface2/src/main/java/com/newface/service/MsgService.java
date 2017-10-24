package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MiniHomeDao;
import com.newface.dao.MsgDao;
import com.newface.vo.AdminMsgVo;
import com.newface.vo.AdminVo;
import com.newface.vo.Iu_NameVo;
import com.newface.vo.MsgVo;

@Service
public class MsgService {
	@Autowired public MsgDao dao;
	@Autowired public MiniHomeDao minihomedao;
	
	public void setDao(MsgDao dao) {
		this.dao = dao;
	}
	
	public int msg_insert(MsgVo vo) {
		return dao.msg_insert(vo);
	}
	
	public List<MsgVo> msgrecv_list(HashMap<String, Object> map){
		return dao.msgrecv_list(map);
	}
	
	public int msgrecv_count(String loginid) {
		return dao.msgrecv_count(loginid);
	}
	
	public int msgnorecv_count(String loginid) {
		return dao.msgnorecv_count(loginid);
	}
	
	
	public List<MsgVo> msgsend_list(HashMap<String, Object> map){
		return dao.msgsend_list(map);
	}
	
	public int msgsend_count(String loginid) {
		return dao.msgsend_count(loginid);
	}
	
	public int msgrecv_delete(int msg_num) {
		return dao.msgrecv_delete(msg_num);
	}
	
	public int msgsend_delete(int msg_num) {
		return dao.msgsend_delete(msg_num);		
	}
	
	public int msgrecv_chk(int msg_num) {
		return dao.msgrecv_chk(msg_num);
	}
	
	public MsgVo msgrecv_getinfo(int msg_num) {
		return dao.msgrecv_getinfo(msg_num);
	}
	
	public int send_clx(int msg_num) {
		return dao.send_clx(msg_num);
	}
	
	public List<Iu_NameVo> iu_list(String loginid){
		return minihomedao.iu_list(loginid);
	}
	
	
	public int adminmsg_insert(AdminMsgVo vo) {
		return dao.adminmsg_insert(vo);
	}
	
	public List<AdminMsgVo> adminmsg_list(HashMap<String, Object> map){
		return dao.adminmsg_list(map);
	}
	
	public int adminmsg_count(String loginid) {
		return dao.adminmsg_count(loginid);
	}
	
	public int adminmsg_delete(int adminmsg_num) {
		return dao.adminmsg_delete(adminmsg_num);
	}
	
	public AdminMsgVo adminmsg_getinfo(int adminmsg_num) {
		return dao.adminmsg_getinfo(adminmsg_num);
	}
	
	public int adminmsgno_count(String loginid) {
		return dao.adminmsgno_count(loginid);
	}
	
}
