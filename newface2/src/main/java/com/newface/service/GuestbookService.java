package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.GuestbookDao;
import com.newface.vo.GuestbookVo;
import com.newface.vo.GuestbookcomVo;
import com.newface.vo.GuestbooklistVo;
import com.newface.vo.GuestcomlistVo;

@Service
public class GuestbookService {
	@Autowired public GuestbookDao dao;
	public int insert(GuestbookVo vo) {
		return dao.insert(vo);
	}
	public List<GuestbooklistVo> list_all(){
		return dao.list_all();
	}
	public int secret(HashMap<String,Object> map) {
		return dao.secret(map);
	}
	public int delete(int guest_num) {
		return dao.delete(guest_num);
	}
	public GuestbookVo update(int guest_num) {
		return dao.update(guest_num);
	}
	public int updateok(GuestbookVo vo) {
		return dao.updateok(vo);
	}
	public int com_insert(GuestbookcomVo vo) {
		return dao.com_insert(vo);
	}
	public List<GuestcomlistVo> com_list(){
		return dao.com_list();
	}
}
