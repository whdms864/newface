package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("startrow", 0);
		map.put("endrow", 20);
		List<TimelineVo> list=timelineservice.list(map);
		model.addAttribute("list",list);
		model.addAttribute("pro_img",pro_img);
		return ".main2";
	}
	
	@RequestMapping("/main2/list")
	@ResponseBody
	public HashMap<String, Object> main2_list(int startrow,int endrow,HttpSession session){
		String id=(String)session.getAttribute("loginid");
		String pro_img=timelineservice.pro_img(id);
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		List<TimelineVo> list=timelineservice.list(map);
		map.put("list",list);
		map.put("pro_img",pro_img);
		return map;
	}
}
