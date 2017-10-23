package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MemberDao;
import com.newface.vo.AdminVo;
import com.newface.vo.HompyVo;
import com.newface.vo.IuVo;
import com.newface.vo.MemberVo;
import com.newface.vo.Member_Profile_Hompy_JoinVo;

@Service
public class MemberService {
	@Autowired public MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	public MemberVo getinfo(String id) {
		return dao.getinfo(id);
	}
	public List<MemberVo> name_info(String name) {
		return dao.name_info(name);
	}
	public List<MemberVo> getinfo_type(HashMap<String, Object> map) {
		return dao.getinfo_type(map);
	}
	public List<MemberVo> listall(HashMap<String, Object> map) {
		return dao.listall(map);
	}
	public int count(HashMap<String, Object> map) {
		return dao.count(map);
	}
	public int count_type(HashMap<String, Object> map) {
		return dao.count_type(map);
	}
	public int profile_insert(int hompy_num) {
		return dao.profile_insert(hompy_num);
	}
	public int setup_insert(int hompy_num) {
		return dao.setup_insert(hompy_num);
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
	public int update_type(HashMap<String, Object> map) {
		return dao.update_type(map);
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
	public int diary_folder_insert(int hompy_num) {
		return dao.diary_folder_insert(hompy_num);
	}
	public int photo_folder_insert(int hompy_num) {
		return dao.photo_folder_insert(hompy_num);
	}
	
	public int today_today(int hompy_num) {
		return dao.today_today(hompy_num);
	}
	public int guest_now(int hompy_num) {
		return dao.guest_now(hompy_num);
	}
	public int iu_request_list(String id){
		return dao.iu_request_list(id);
	}
	public List<Member_Profile_Hompy_JoinVo> fsearch(HashMap<String, Object> map) {
		return dao.fsearch(map);
	}
	
	public int fsearch_count(HashMap<String, Object> map) {
		return dao.fsearch_count(map);
	}
}
