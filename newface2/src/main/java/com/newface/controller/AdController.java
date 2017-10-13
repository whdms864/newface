package com.newface.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.AdService;
import com.newface.vo.AdVo;
import com.newface.vo.AderVo;

@Controller
public class AdController {
	@Autowired private AdService service;
		
	//±§∞Ì∞Ëæ‡
	@RequestMapping(value = "/ad_list", method = RequestMethod.GET)
	public String ad_list(Model model,int ader_num) {
		List<AdVo> ad_list=service.ad_list(ader_num);
		model.addAttribute("ad_list", ad_list);
		return ".ad_list";
	}
	
	@RequestMapping(value = "/ad_getinfo", method = RequestMethod.GET)
	public String ad_getinfo(Model model, int ad_num) {
		AdVo ad_getinfo=service.ad_getinfo(ad_num);
		model.addAttribute("ad_getinfo", ad_getinfo);
		
		return ".ad_getinfo";
	}
	
	@RequestMapping(value = "/ad_insert", method = RequestMethod.GET)
	public String ad_insert(Model model,int ader_num) {
		AderVo vo=service.ader_getinfo(ader_num);
		model.addAttribute("vo", vo);
		return ".ad_insert";
	}
	
	@RequestMapping(value = "/ad_insert", method = RequestMethod.POST)
	public String ad_insert(Model model,AdVo vo) {
		service.ad_insert(vo);
		return "redirect:/ad_list?ader_num="+ vo.getAder_num();
	}
	
	@RequestMapping(value = "/ad_update", method = RequestMethod.GET)
	public String ad_updateform(Model model, int ad_num) {
		AdVo vo=service.ad_getinfo(ad_num);
		model.addAttribute("vo", vo);
		return ".ad_update";
	}
	
	@RequestMapping(value = "/ad_update", method = RequestMethod.POST)
	public String ad_update(AdVo vo) {
		service.ad_update(vo);
		return "redirect:/ad_getinfo?ad_num=" + vo.getAd_num();
	}
	
	@RequestMapping(value = "/ad_delete", method = RequestMethod.GET)
	public String ad_delete(int ad_num) {
		service.ad_delete(ad_num);
		return "redirect:/ader_list";
	}
	
	
	//±§∞Ì¡÷
	@RequestMapping(value = "/ader_list", method = RequestMethod.GET)
	public String ader_list(Model model) {
		List<AderVo> ader_list=service.ader_list();
		model.addAttribute("ader_list",ader_list);
		return ".ader_list";
	}
	
	@RequestMapping(value = "/ader_getinfo", method = RequestMethod.GET)
	public String ader_getinfo(Model model,int ader_num) {
		AderVo vo=service.ader_getinfo(ader_num);
		model.addAttribute("vo", vo);
		return ".ader_getinfo";
	}
	
	@RequestMapping(value = "/ader_insert", method = RequestMethod.GET)
	public String ader_insertform(Model model) {
		return ".ader_insert";
	}
	
	@RequestMapping(value = "/ader_insert", method = RequestMethod.POST)
	public String ader_insert(Model model, AderVo vo) {
		service.ader_insert(vo);
		return "redirect:/ader_list";
	}
	
	@RequestMapping(value = "/ader_update", method = RequestMethod.GET)
	public String ader_updateform(Model model, int ader_num) {
		AderVo vo=service.ader_getinfo(ader_num);
		model.addAttribute("vo", vo);
		return ".ader_update";
	}
	
	@RequestMapping(value = "/ader_update", method = RequestMethod.POST)
	public String ader_update(AderVo vo) {
		service.ader_update(vo);
		return "redirect:/ader_getinfo?ader_num=" + vo.getAder_num();
	}
	
	@RequestMapping(value = "/ader_delete", method = RequestMethod.GET)
	public String ader_delete(Model model, int ader_num) {
		service.ader_delete(ader_num);
		return "redirect:/ader_list";
	}
}
