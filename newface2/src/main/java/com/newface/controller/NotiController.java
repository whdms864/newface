package com.newface.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.NotiService;
import com.newface.vo.NotiVo;

@Controller
public class NotiController {
	@Autowired private NotiService service;
	
	@RequestMapping(value = "/noti/list", method = RequestMethod.GET)
	public String notilist(Model model) {
		List<NotiVo> list=service.list();
		model.addAttribute("list",list);
		return ".notilist";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.GET)
	public String ndmininsertform() {
		return ".notiadmin_insert";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.POST)
	public String nadmininsert(NotiVo vo) {
		service.insert(vo);
		return ".notilist";
	}
	
	@RequestMapping(value="/notigetinfo", method=RequestMethod.GET)
	public String notigetinfo(Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
		model.addAttribute("vo", vo);
		return ".notigetinfo";
		
	}
	
	@RequestMapping(value="/notiadmin_update", method=RequestMethod.GET)
	public String notiadmin_update(Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
		model.addAttribute("vo", vo);
		return ".notiadmin_update";
	}
	
	@RequestMapping(value = "/notiadmin_updateok", method = RequestMethod.POST)
	public String notiupdate(NotiVo vo) {
		service.notiupdate(vo);
		return "redirect:/notigetinfo?noti_num=" + vo.getNoti_num();
	}
	
	@RequestMapping(value = "/notiadmin_delete", method = RequestMethod.GET)
	public String notidelete(int noti_num) {
		service.notidelete(noti_num);
		return "redirect:/noti/list";
	}
}
