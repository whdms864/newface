package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.DiaryDao;
import com.newface.vo.DiaryVo;
import com.newface.vo.DiarycomVo;
import com.newface.vo.DiaryfolderVo;

@Service
public class DiaryService {
	@Autowired public DiaryDao dao;
	public int insert(DiaryVo vo) {
		return dao.insert(vo);
	}
	public List<DiaryVo> folder_list(int diary_folder_num){
		return dao.folder_list(diary_folder_num);
	}
	public DiaryVo content(int diary_num) {
		return dao.content(diary_num);
	}
	public int com_insert(DiarycomVo vo) {
		return dao.com_insert(vo);
	}
	public List<DiarycomVo> com_list(int diary_num){	
		List<DiarycomVo> com_list=dao.com_list(diary_num);
		for(DiarycomVo vo:com_list) {
			String name=dao.name(vo.getId());
			vo.setId(name);
		}
		return com_list;
	}
	public List<DiaryVo> folder_all_list(){
		return dao.folder_all_list();
	}
	public int update(DiaryVo vo) {
		return dao.update(vo);
	}
	public int delete(int diary_num) {
		List<Integer> com=dao.com_is(diary_num);
		if(com!=null) {
			dao.com_all_delete(diary_num);
		}
		return dao.delete(diary_num);
	}
	public int hompy_num(String id) {
		return dao.hompy_num(id);
	}
	public int folder_insert(DiaryfolderVo vo) {
		return dao.folder_insert(vo);
	}
	public List<DiaryfolderVo> fname(int hompy_num){
		return dao.fname(hompy_num);
	}
	public List<String> regdate_d(String regdate_ym){
		return dao.regdate_d(regdate_ym);
	}
	public int folder_move(DiaryVo vo) {
		return dao.folder_move(vo);
	}
}
