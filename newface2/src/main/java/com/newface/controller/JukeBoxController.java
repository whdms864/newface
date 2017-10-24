package com.newface.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.MiniHomeService;
import com.newface.vo.ItemVo;

@Controller
public class JukeBoxController {
	@Autowired MiniHomeService service;
	
	@RequestMapping(value="/jukebox",method=RequestMethod.GET)
	public String jukebox() {
		return ".jukebox";
	}
	
	//BGM
	@RequestMapping(value="/bgm",method=RequestMethod.GET)
	@ResponseBody
	public String bgm(HttpSession session) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		int mini_num=service.mini_num(hompy_num);
		List<ItemVo> bgm_list=service.bgm(mini_num);
		JSONArray arr=new JSONArray();
		for(ItemVo bgmVo:bgm_list) {
			JSONObject json=new JSONObject();
			if(bgmVo.getContent()!=null) {
				json.put("content", bgmVo.getContent());
			}
			arr.add(json);					
		}			
		return arr.toString();
	}
}
