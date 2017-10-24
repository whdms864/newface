package com.newface.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.AdService;
import com.newface.vo.AdVo;






@Controller
public class HomeController {
	@Autowired AdService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		List<AdVo> ad_slide=service.ad_slide();
		List<AdVo> ad_slide2=service.ad_slide2();
		session.setAttribute("ad_slide", ad_slide);
		session.setAttribute("ad_slide2", ad_slide2);
		
		return ".main";
	}
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String manager() {
		return ".admin";
	}
	
}
