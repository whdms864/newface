package com.newface.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.PhotoDao;
import com.newface.vo.PhotoVo;
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
	public List<PhotolistVo> photo_list(int hompy_num){
		return dao.photo_list(hompy_num);
	}
}
