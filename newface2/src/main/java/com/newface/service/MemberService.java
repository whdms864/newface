package com.newface.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MemberDao;
import com.newface.vo.AdminVo;
import com.newface.vo.HompyVo;
import com.newface.vo.MemberVo;

@Service
public class MemberService {
	@Autowired public MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	public MemberVo getinfo(String id) {
		return dao.getinfo(id);
	}
	
	public AdminVo getadmin(String id) {
		return dao.getadmin(id);
	}
	public int insert(MemberVo vo) {
		return dao.insert(vo);
	}
	public int hompyinsert(HompyVo vo) {
		return dao.hompyinsert(vo);
	}
	public boolean isMembers(HashMap<String, String> map) {
		MemberVo vo=dao.isMember(map);
		
		if(vo!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean isAdmin(HashMap<String, String> map) {
		AdminVo vo=dao.isAdmin(map);
		
		if(vo!=null) {
			return true;
		}else {
			return false;
		}
	}
	public int miniroom(int hompy_num) {
		return dao.miniroom(hompy_num);
	}
	public int hompy_num(String id) {
		return dao.hompy_num(id);
	}
	public MemberVo mypage(String id) {
		return dao.mypage(id);
	}
	public int update(MemberVo vo) {
		return dao.update(vo);
	}
	
	public int leave(MemberVo vo) {
		return dao.leave(vo);
	}
	
	public String searchid(HashMap<String, String> map) {
		return dao.searchid(map);

	}
	
	public String searchpwd(HashMap<String, String> map) {
		return dao.searchpwd(map);
	}
}
