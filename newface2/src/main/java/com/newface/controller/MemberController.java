package com.newface.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.newface.service.MemberService;
import com.newface.vo.HompyVo;
import com.newface.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	
	
	
	@RequestMapping(value="/idcheck/json",produces="application/json;charset=utf-8")
	@ResponseBody
	public String idcheck(String id) {
		
		JSONObject json=new JSONObject();
		MemberVo vo=service.getinfo(id);
		
		if(vo==null) {
			json.put("id", "사용하실 수 있습니다.");			
		}else {
			json.put("id", "중복된 아이디입니다.");
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String member() {
		return ".member";
	}
	
	@RequestMapping(value = "/member/insert", method = RequestMethod.POST)
	public String membergaib(MemberVo vo1,HompyVo vo2) {
		int n1=service.insert(vo1);
		int n2=service.hompyinsert(vo2);
		if(n1>0 || n2>0) {
			return ".main";
		}else {
			return ".member";
		}
	}
}
