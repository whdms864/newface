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

@Controller
public class Qna11Controller {
	@Autowired private Qna11Service service;

	@RequestMapping(value = "/qna11/insert", method = RequestMethod.GET)
	public String insertform() {
		return ".qna11.insert";
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
		return ".qna11.getinfo";
	}
	@RequestMapping(value = "/qna11/detail", method = RequestMethod.GET)
	public String detail(int qna11_num,Model model) {
		Qna11Vo vo=service.getinfo(qna11_num);
		model.addAttribute("vo",vo);
		return ".qna11.detail";
	}
}
