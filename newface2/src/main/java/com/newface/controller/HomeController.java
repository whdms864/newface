package com.newface.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.NotiService;
import com.newface.vo.NotiVo;


@Controller
public class HomeController {
	@Autowired private NotiService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".main";
	}
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String manager() {
		return ".admin";
	}
	
	
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String main2() {
						
		return ".main2";
	}
	
	
}
