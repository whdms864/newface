package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.DiaryDao;
import com.newface.vo.CalendarListVo;
import com.newface.vo.DiaryListVo;
import com.newface.vo.DiaryVo;
import com.newface.vo.DiarycomVo;
import com.newface.vo.DiaryfolderVo;
import com.newface.vo.HompyVo;

@Service
public class DiaryService {
	@Autowired public DiaryDao dao;
	public int insert(DiaryVo vo) {
		return dao.insert(vo);
	}
	public List<DiaryVo> folder_list(HashMap<String, Integer> map){
		return dao.folder_list(map);
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
			vo.setName(name);
		}
		return com_list;
	}
	public String name(String id) {
		return dao.name(id);
	}
	public String id(int hompy_num) {
		return dao.id(hompy_num);
	}
	public List<DiaryListVo> folder_basic_list(HashMap<String, Integer> map){
		List<DiaryListVo> list=dao.folder_basic_list(map);
		for(DiaryListVo vo:list) {
			String name=dao.diary_name(vo.getDiary_folder_num());
			vo.setName(name);
		}
		return list;
	}
	public List<DiaryListVo> folder_all_list(HashMap<String, Integer> map){
		List<DiaryListVo> list=dao.folder_all_list(map);
		for(DiaryListVo vo:list) {
			String name=dao.diary_name(vo.getDiary_folder_num());
			vo.setName(name);
		}
		return list;
	}
	public int diary_all_count(int hompy_num) {
		return dao.diary_all_count(hompy_num);
	}
	public int diary_folder_count(HashMap<String, Integer> map) {
		return dao.diary_folder_count(map);
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
	public String fname_select(int diary_folder_num) {
		return dao.fname_select(diary_folder_num);
	}
	public int folder_update(DiaryfolderVo vo) {
		return dao.folder_update(vo);
	}
	public int folder_delete(DiaryfolderVo vo) {
		List<Integer> list=dao.diary_is(vo.getDiary_folder_num());
		if(list!=null) {
			dao.diary_delete(vo.getDiary_folder_num());
		}
		return dao.folder_delete(vo);
	}
	public int com_update(DiarycomVo vo) {
		return dao.com_update(vo);
	}
	public int com_delete(int diary_com_num) {
		return dao.com_delete(diary_com_num);
	}
	public HompyVo hompy_is(HompyVo vo) {
		return dao.hompy_is(vo);
	}
	public List<CalendarListVo> group_m(CalendarListVo vo){
		return dao.group_m(vo);
	}
	public List<CalendarListVo> get_m(CalendarListVo vo){
		return dao.get_m(vo);
	}
	public CalendarListVo diary_m(int diary_num) {
		return dao.diary_m(diary_num);
	}
	public int get_diary_num() {
		return dao.get_diary_num();
	}
}
