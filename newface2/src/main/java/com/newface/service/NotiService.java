package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.NotiDao;
import com.newface.vo.NotiVo;
import com.newface.vo.NoticomVo;

@Service
public class NotiService {
	@Autowired public NotiDao dao;
	public void setDao(NotiDao dao) {
		this.dao = dao;
	}
		
	public int insert(NotiVo vo) {
		return dao.insert(vo);
	}
	
	public List<NotiVo> list(HashMap<String,Object> map){
		return dao.notilist(map);
	}
	
	public NotiVo notigetinfo(int noti_num){
		return dao.notigetinfo(noti_num);
	}
	
	public int notiupdate(NotiVo vo) {
		return dao.notiupdate(vo);
	}
	
	public int notidelete(int noti_num) {
		return dao.notidelete(noti_num);
	}
	
	public List<NotiVo> noti_side(){
		return dao.noti_side();
	}
	
	public int noti_com_insert(NoticomVo vo) {
		return dao.noti_com_insert(vo);
	}
	
	public List<NoticomVo> noti_com_list(HashMap<String,Object> map){
		return dao.noti_com_list(map);
	}
	
	public int noti_com_delete(int noti_num) {
		return dao.noti_com_delete(noti_num);
	}
	
	public int com_getCount(int noti_num) {
		return dao.com_getCount(noti_num);
	}
	
	public int getCount() {
		return dao.getCount();
	}
}
