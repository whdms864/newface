package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.newface.page.PageUtil;
import com.newface.service.AdService;
import com.newface.vo.AdVo;
import com.newface.vo.AderVo;
import com.newface.vo.MemberVo;

@Controller
public class AdController {
	@Autowired private AdService service;

	// 광고계약
	@RequestMapping(value = "/ad_list", method = RequestMethod.GET)
	public String ad_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model, int ader_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.ad_count(ader_num);
		PageUtil pu = new PageUtil(pageNum, 15, 5, totalRowCount);
		map.put("ader_num",ader_num);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AdVo> ad_list = service.ad_list(map);
		model.addAttribute("pu", pu);
		model.addAttribute("ad_list", ad_list);
		return ".ad_list";
	}

	// 광고상세보기
	@RequestMapping(value = "/ad_getinfo", method = RequestMethod.GET)
	public String ad_getinfo(Model model, int ad_num) {
		AdVo ad_getinfo = service.ad_getinfo(ad_num);
		model.addAttribute("ad_getinfo", ad_getinfo);

		return ".ad_getinfo";
	}

	// 광고 등록 페이지
	@RequestMapping(value = "/ad_insert", method = RequestMethod.GET)
	public String ad_insert(Model model, int ader_num) {
		AderVo vo = service.ader_getinfo(ader_num);
		model.addAttribute("vo", vo);
		return ".ad_insert";
	}
	
	// 광고 등록
	@RequestMapping(value = "/ad_insert", method = RequestMethod.POST)
	public String ad_insert(Model model, AdVo vo) {
		service.ad_insert(vo);
		return "redirect:/ad_list?ader_num=" + vo.getAder_num();
	}
	
	// 광고 수정페이지
	@RequestMapping(value = "/ad_update", method = RequestMethod.GET)
	public String ad_updateform(Model model, int ad_num) {
		AdVo vo = service.ad_getinfo(ad_num);
		model.addAttribute("vo", vo);
		return ".ad_update";
	}
	
	// 광고 수정
	@RequestMapping(value = "/ad_update", method = RequestMethod.POST)
	public String ad_update(AdVo vo) {
		service.ad_update(vo);
		return "redirect:/ad_getinfo?ad_num=" + vo.getAd_num();
	}
	
	// 광고 삭제
	@RequestMapping(value = "/ad_delete", method = RequestMethod.GET)
	public String ad_delete(int ad_num) {
		service.ad_delete(ad_num);
		return "redirect:/ader_list";
	}
	
	@RequestMapping(value = "/ad_getinfo2", method = RequestMethod.GET)
	public String admin_member_getinfo(int ad_num,Model model,@RequestParam(value="up",defaultValue="0") int up) {
		AdVo vo=service.ad_getinfo(ad_num);
		model.addAttribute("vo",vo);
		model.addAttribute("up",up);
		return ".ad_getinfo";
	}
	
	@RequestMapping(value = "/adtype_update", method = RequestMethod.GET)
	public String admin_member_getinfo_update(int ad_num,Model model,String type) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("ad_num", ad_num);
		map.put("type", type);
		service.update_type(map);
		return "redirect:/ad_getinfo2?ad_num="+ad_num;
	}
	
	
	

	// 광고주 목록
	@RequestMapping(value = "/ader_list", method = RequestMethod.GET)
	public String ader_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.ader_count();
		PageUtil pu = new PageUtil(pageNum, 15, 5, totalRowCount);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AderVo> ader_list = service.ader_list(map);
		model.addAttribute("pu", pu);
		model.addAttribute("ader_list", ader_list);
		return ".ader_list";
	}
	 
	// 광고주 상세보기
	@RequestMapping(value = "/ader_getinfo", method = RequestMethod.GET)
	public String ader_getinfo(Model model, int ader_num) {
		AderVo vo = service.ader_getinfo(ader_num);
		model.addAttribute("vo", vo);
		return ".ader_getinfo";
	}
	 
	// 광고주 등록페이지
	@RequestMapping(value = "/ader_insert", method = RequestMethod.GET)
	public String ader_insertform(Model model) {
		return ".ader_insert";
	}
	
	// 광고주 등록
	@RequestMapping(value = "/ader_insert", method = RequestMethod.POST)
	public String ader_insert(Model model, AderVo vo) {
		service.ader_insert(vo);
		return "redirect:/ader_list";
	}
	
	// 광고주 수정페이지
	@RequestMapping(value = "/ader_update", method = RequestMethod.GET)
	public String ader_updateform(Model model, int ader_num) {
		AderVo vo = service.ader_getinfo(ader_num);
		model.addAttribute("vo", vo);
		return ".ader_update";
	}
	
	// 광고주 수정
	@RequestMapping(value = "/ader_update", method = RequestMethod.POST)
	public String ader_update(AderVo vo) {
		service.ader_update(vo);
		return "redirect:/ader_getinfo?ader_num=" + vo.getAder_num();
	}
	
	// 광고주 삭제
	@RequestMapping(value = "/ader_delete", method = RequestMethod.GET)
	public String ader_delete(Model model, int ader_num) {
		service.ader_delete(ader_num);
		return "redirect:/ader_list";
	}
}
