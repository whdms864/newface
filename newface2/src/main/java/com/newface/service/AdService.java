package com.newface.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.AdDao;
import com.newface.vo.AdVo;
import com.newface.vo.AderVo;

@Service
public class AdService {
	@Autowired public AdDao dao;
	
	public void setDao(AdDao dao) {
		this.dao = dao;
	}
	public int ader_insert(AderVo vo) {
		return dao.ader_insert(vo);
	}
	public List<AderVo> ader_list(HashMap<String,Object> map){
		return dao.ader_list(map);
	}
	public AderVo ader_getinfo(int ader_num) {
		return dao.ader_getinfo(ader_num);
	}
	public int ader_update(AderVo vo) {
		return dao.ader_update(vo);
	}
	public int ader_delete(int ader_num) {
		return dao.ader_delete(ader_num);
	}
	public int ader_count() {
		return dao.ader_count();
	}
	
	
	
	public int ad_insert(AdVo vo) {
		return dao.ad_insert(vo);
	}
	public List<AdVo> ad_list(HashMap<String,Object> map){
		return dao.ad_list(map);
	}
	public AdVo ad_getinfo(int ad_num) {
		return dao.ad_getinfo(ad_num);
	}
	public int ad_update(AdVo vo) {
		return dao.ad_update(vo);
	}
	public int ad_delete(int ad_num) {
		return dao.ad_delete(ad_num);
	}
	public int ad_count(int ader_num) {
		return dao.ad_count(ader_num);
	}
	
	public int update_type(HashMap<String, Object> map) {
		return dao.update_type(map);
	}
	
	public List<AdVo> ad_slide(){
		return dao.ad_slide();
	}
	
	public List<AdVo> ad_slide2(){
		return dao.ad_slide2();
	}
	
	public List<AdVo> total_income(){
		return dao.total_income();
	}
	
	public List<AdVo> daily_income(){
		return dao.daily_income();
	}
	
	public List<AdVo> month_income(){
		return dao.month_income();
	}
	
	public List<AdVo> year_income(){
		return dao.year_income();
	}
}
