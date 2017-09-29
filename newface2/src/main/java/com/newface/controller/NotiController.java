package com.newface.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.NotiService;
import com.newface.vo.NotiVo;
import com.newface.vo.NoticomVo;

@Controller
public class NotiController {
	@Autowired private NotiService service;
	
	@RequestMapping(value = "/notiadmin_list", method = RequestMethod.GET)
	public String notiadmin_list(Model model) {
		List<NotiVo> list=service.list();
		model.addAttribute("list",list);
		return ".notiadmin_list";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.GET)
	public String notiadmin_insertform() {
		return ".notiadmin_insert";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.POST)
	public String nadmininsert(NotiVo vo) {
		service.insert(vo);
		return "redirect:/notiadmin_list";
	}
	
	@RequestMapping(value="/notiadmin_getinfo", method=RequestMethod.GET)
	public String notiadmin_getinfo(Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
		/*String content=vo.getContent();
		content=content.replaceAll("\n","<br>");//\n 문자열을 <br>로 바꾸기
		vo.setContent(content);*/	
		
		model.addAttribute("vo", vo);
		return ".notiadmin_getinfo";
	}
	
	@RequestMapping(value="/notiadmin_update", method=RequestMethod.GET)
	public String notiadmin_update(Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
		model.addAttribute("vo", vo);
		return ".notiadmin_update";
	}
	
	@RequestMapping(value = "/notiadmin_updateok", method = RequestMethod.POST)
	public String notiadmin_update(NotiVo vo) {
		service.notiupdate(vo);
		return "redirect:/notiadmin_getinfo?noti_num=" + vo.getNoti_num();
	}
	
	@RequestMapping(value = "/notiadmin_delete", method = RequestMethod.GET)
	public String notiadmin_delete(int noti_num) {
		service.notidelete(noti_num);
		return "redirect:/notiadmin_list";
	}
	
	@RequestMapping(value = "/noti_list", method = RequestMethod.GET)
	public String noti_list(Model model) {
		List<NotiVo> list=service.list();
		model.addAttribute("list",list);
		return ".noti_list";
	}
	
	
	@RequestMapping(value="/noti_getinfo", method=RequestMethod.GET)
	public String noti_getinfo(Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
	/*	String content=vo.getContent();
		content=content.replaceAll("\n","<br>");//\n 문자열을 <br>로 바꾸기
		vo.setContent(content);	*/
		
		model.addAttribute("vo", vo);
		return ".noti_getinfo";
		
	}
	
	@RequestMapping(value = "/noti_side", method = RequestMethod.GET)
	public String noti_side(Model model) {
		List<NotiVo> noti_side=service.noti_side();
		System.out.println(noti_side);
		model.addAttribute("noti_side",noti_side);
		return ".market";
	}
	
	@RequestMapping(value="/noti_com_insert",method=RequestMethod.POST)
	public String noti_com_insert(Model model, NoticomVo vo) {
		service.noti_com_insert(vo);
		return "redirct:/noti_com_list";
	}
	
	@RequestMapping(value="/noti_com_list",method=RequestMethod.GET)
	public String noti_com_list(Model model) {
		List<NoticomVo> noti_com_list=service.noti_com_list();
		model.addAttribute("noti_com_list",noti_com_list);
		return "";
	}
	
}
