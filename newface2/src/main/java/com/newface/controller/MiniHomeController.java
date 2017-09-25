package com.newface.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.MiniHomeService;

@Controller
public class MiniHomeController {
	@Autowired MiniHomeService service;
	
	@RequestMapping(value = "/minihome", method = RequestMethod.GET)
	public String home(HttpSession session) {
		String id=(String)session.getAttribute("id");
		int hompy_num=service.hompy_num(id);
		session.setAttribute("hompy_num", hompy_num);
		return ".minihome";
	}
	@RequestMapping(value = "/guestbook", method = RequestMethod.GET)
	public String guestbook() {
		return ".guestbook";
	}
	@RequestMapping(value = "/setup", method = RequestMethod.GET)
	public String setup() {
		return ".setup";
	}
}
