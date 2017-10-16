package com.newface.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.TimelineService;
import com.newface.vo.TimelineVo;





@Controller
public class HomeController {
	@Autowired private TimelineService timelineservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".main";
	}
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String manager() {
		return ".admin";
	}
	
	
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String main2(Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		String pro_img=timelineservice.pro_img(id);
		List<TimelineVo> list=timelineservice.list();
		model.addAttribute("list",list);
		model.addAttribute("pro_img",pro_img);
		return ".main2";
	}
	
	
}
