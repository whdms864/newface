package com.newface.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.MiniHomeService;
import com.newface.vo.HompyVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;

@Controller
public class MiniHomeController {
	@Autowired MiniHomeService service;
	
	@RequestMapping(value = "/minihome", method = RequestMethod.GET)
	public String home(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		session.setAttribute("hompy_num", hompy_num);
		
		//Ȩ�Ǹ�,�ѹ湮��
		HompyVo hompy=service.hompy(id);
		session.setAttribute("hname", hompy.getHname());
		session.setAttribute("total", hompy.getTotal());
		session.setAttribute("hompyid", hompy.getId());
		
		//�޴�����
		SetupVo vo=service.setup_list(hompy_num);
		session.setAttribute("diary", vo.getDiary());
		session.setAttribute("photo", vo.getPhoto());
		session.setAttribute("guest", vo.getGuest());
		
		//�����ʻ���
		ProfileVo profile=service.profile(hompy_num);
		model.addAttribute("vo", profile);
		return ".minihome";
	}
}
