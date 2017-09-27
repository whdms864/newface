package com.newface.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.Qna11Service;
import com.newface.vo.Qna11Vo;
import com.newface.vo.Qna11comVo;

@Controller
public class Qna11Controller {
	@Autowired private Qna11Service service;

	@RequestMapping(value = "/qna11/insert", method = RequestMethod.GET)
	public String insertform() {
		return ".qna11_insert";
	}
	@RequestMapping(value = "/qna11/insertok", method = RequestMethod.POST)
	public String insert(Qna11Vo vo) {
		service.insert(vo);
		return "redirect:/qna11/getinfo";
	}
	@RequestMapping(value = "/qna11/getinfo", method = RequestMethod.GET)
	public String getinfo(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		List<Qna11Vo> list=service.getinfo(id);
		model.addAttribute("list",list);
		return ".qna11_getinfo";
	}
	@RequestMapping(value = "/qna11/detail", method = RequestMethod.GET)
	public String detail(int qna11_num,Model model) {
		Qna11Vo vo=service.getinfo(qna11_num);
		Qna11comVo comvo=service.com_getinfo(qna11_num);
		model.addAttribute("vo",vo);
		model.addAttribute("comvo",comvo);
		return ".qna11_detail";
	}
	@RequestMapping(value = "/qna11/update", method = RequestMethod.GET)
	public String update(int qna11_num,Model model) {
		Qna11Vo vo=service.getinfo(qna11_num);
		model.addAttribute("vo",vo);
		return ".qna11_update";
	}
	@RequestMapping(value = "/qna11/updateok", method = RequestMethod.POST)
	public String updateok(Qna11Vo vo) {
		service.update(vo);
		return "redirect:/qna11/getinfo";
	}
	@RequestMapping(value = "/qna11/delete", method = RequestMethod.GET)
	public String delete(int qna11_num) {
		service.delete(qna11_num);
		return "redirect:/qna11/getinfo";
	}
	
	/***************************** 관리자 ******************************************/
	
	@RequestMapping(value = "/qna11/admin/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<Qna11Vo> list=service.list();
		model.addAttribute("list",list);
		return ".qna11admin";
	}
	@RequestMapping(value = "/qna11/admin/detail", method = RequestMethod.GET)
	public String admin_detail(int qna11_num,Model model) {
		Qna11Vo vo=service.getinfo(qna11_num);
		Qna11comVo comvo=service.com_getinfo(qna11_num);
		
		//상태변경
		String confirm="확인중";
		if(vo.getConfirm().equals("대기")) {
			vo.setConfirm(confirm);
			service.up_confirm(vo);
		}
		
		model.addAttribute("vo",vo);
		model.addAttribute("comvo",comvo);
		return ".qna11admin_detail";
	}
	@RequestMapping(value = "/qna11/admin/insertok", method = RequestMethod.POST)
	public String admin_insert(Qna11comVo comvo) {
		service.insert(comvo);
		
		//상태변경
		String confirm="답변완료";
		Qna11Vo vo=service.getinfo(comvo.getQna11_num());
		if(vo.getConfirm().equals("확인중")) {
			vo.setConfirm(confirm);
			service.up_confirm(vo);
		}
		return "redirect:/qna11/admin/list";
	}
	@RequestMapping(value = "/qna11/admin/update", method = RequestMethod.GET)
	public String admin_updateform(int qna11_num,Model model) {
		Qna11Vo vo=service.getinfo(qna11_num);
		Qna11comVo comvo=service.com_getinfo(qna11_num);

		model.addAttribute("vo",vo);
		model.addAttribute("comvo",comvo);
		return ".qna11admin_update";
	}
	@RequestMapping(value = "/qna11/admin/updateok", method = RequestMethod.POST)
	public String admin_updateok(Qna11comVo comvo) {
		service.com_update(comvo);
		
		String confirm="답변완료";
		Qna11Vo vo=service.getinfo(comvo.getQna11_num());
		if(vo.getConfirm().equals("확인중")) {
			vo.setConfirm(confirm);
			service.up_confirm(vo);
		}
		return "redirect:/qna11/admin/list";
	}
	@RequestMapping(value = "/qna11/admin/delete", method = RequestMethod.GET)
	public String admin_delete(int qna11_com_num) {
		service.com_delete(qna11_com_num);
		String confirm="확인중";
		Qna11Vo vo=service.getinfo(qna11_com_num);
		if(vo.getConfirm().equals("답변완료")) {
			vo.setConfirm(confirm);
			service.up_confirm(vo);
		}
		return "redirect:/qna11/admin/list";
	}
}
