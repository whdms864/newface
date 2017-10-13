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
	public String nadmininsert(NotiVo vo, HttpSession session) {
		List<NotiVo> noti_side=service.noti_side();
		service.insert(vo);
		session.setAttribute("noti_side", noti_side);
		return "redirect:/notiadmin_list";
	}
	
	@RequestMapping(value="/notiadmin_getinfo", method=RequestMethod.GET)
	public String notiadmin_getinfo(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=service.getCount(noti_num);
		PageUtil pu=new PageUtil(pageNum,6,5,totalRowCount);
		map.put("noti_num",noti_num);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<NoticomVo> noti_com_list=service.noti_com_list(map);
		model.addAttribute("pu",pu);
		model.addAttribute("noti_com_list",noti_com_list);
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
	public String notiadmin_update(NotiVo vo,HttpSession session) {
		List<NotiVo> noti_side=service.noti_side();
		service.notiupdate(vo);
		session.setAttribute("noti_side", noti_side);
		return "redirect:/notiadmin_getinfo?noti_num=" + vo.getNoti_num();
	}
	
	@RequestMapping(value = "/notiadmin_delete", method = RequestMethod.GET)
	public String notiadmin_delete(int noti_num) {
		service.noti_com_delete(noti_num);
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
	public String noti_getinfo(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,int noti_num) {
		NotiVo vo=service.notigetinfo(noti_num);
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=service.getCount(noti_num);
		PageUtil pu=new PageUtil(pageNum,6,5,totalRowCount);
		map.put("noti_num",noti_num);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		List<NoticomVo> noti_com_list=service.noti_com_list(map);
		model.addAttribute("pu",pu);
		model.addAttribute("noti_com_list",noti_com_list);
		model.addAttribute("vo", vo);
		return ".noti_getinfo";
		
	}
	
	@RequestMapping(value = "/noti_side", method = RequestMethod.GET)
	public String noti_side(HttpSession session) {
		List<NotiVo> noti_side=service.noti_side();
		
		session.setAttribute("noti_side", noti_side);
		return ".market";
	}
	
	@RequestMapping(value="/noti_com_insert",method=RequestMethod.POST)
	public String noti_com_insert(Model model, NoticomVo vo) {
		service.noti_com_insert(vo);
		return "redirect:/noti_getinfo?noti_num=" + vo.getNoti_num();
	}
	
	
	

	
}
