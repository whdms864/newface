package com.newface.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.newface.service.MemberService;
import com.newface.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired private MemberService service;
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member() {
		return ".member";
	}
	
	@RequestMapping(value="/idcheck/json",produces="application/json;charset=utf-8")
	@ResponseBody
	public String idcheck(String id) {
		
		JSONObject json=new JSONObject();
		MemberVo vo=service.getinfo(id);
		
		if(vo==null) {
			json.put("id", "����Ͻ� �� �ֽ��ϴ�.");			
		}else {
			json.put("id", "�ߺ��� ���̵��Դϴ�.");
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.POST)
	public String membergaib(MemberVo vo) {
		int n=service.insert(vo);
		if(n>0) {
			return ".success";
		}else {
			return ".member";
		}
	}
}