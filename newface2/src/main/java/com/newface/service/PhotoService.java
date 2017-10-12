package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.PhotoDao;
import com.newface.vo.PhotoVo;
import com.newface.vo.PhotocomVo;
import com.newface.vo.PhotofolderVo;
import com.newface.vo.PhotolistVo;

@Service
public class PhotoService {
	@Autowired public PhotoDao dao;
	public int Hompy_num(String id) {
		return dao.hompy_num(id);
	}
	public int folder_insert(PhotofolderVo vo) {
		return dao.folder_insert(vo);
	}
	public List<PhotofolderVo> folder_list(int hompy_num){
		return dao.folder_list(hompy_num);
	}
	public int photo_insert(PhotoVo vo) {
		return dao.photo_insert(vo);
	}
	public List<PhotolistVo> photo_list(HashMap<String, Object> map){
		return dao.photo_list(map);
	}
	public List<PhotolistVo> photo_list1(HashMap<String, Object> map){
		return dao.photo_list1(map);
	}
	public String name(String id) {
		return dao.name(id);
	}
	public int photo_delete(int photo_num) {
		return dao.photo_delete(photo_num);
	}
	public int photo_love(HashMap<String, Object> map) {
		return dao.photo_love(map);
	}
	public PhotoVo photo_update(int photo_num) {
		return dao.photo_update(photo_num);
	}
	public int photo_updateok(PhotoVo vo) {
		return dao.photo_updateok(vo);
	}
	public int getCount(int hompy_num) {
		return dao.getCount(hompy_num);
	}
	public int getCount1(int photo_folder_num) {
		return dao.getCount1(photo_folder_num);
	}
	public int folder_update(PhotofolderVo vo) {
		return dao.folder_update(vo);
	}
	public int folder_delete(PhotofolderVo vo) {
		return dao.folder_delete(vo);
	}
	public int com_insert(PhotocomVo vo) {
		return dao.com_insert(vo);
	}
	public List<PhotocomVo> com_list(){
		return dao.com_list();
	}
	public int com_delete(int photo_com_num) {
		return dao.com_delete(photo_com_num);
	}
	public int home_test(HashMap<String,Object> map) {
		return dao.home_test(map);
	}
}
