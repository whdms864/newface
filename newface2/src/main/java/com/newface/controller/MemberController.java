package com.newface.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			json.put("id", "����Ͻ� �� �ֽ��ϴ�.");			
		}else {
			json.put("id", "�ߺ��� ���̵��Դϴ�.");
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
	
	@RequestMapping("/member/mypage")
	public String mypage(Model model,String id) {
		MemberVo vo=service.mypage(id);
		model.addAttribute("vo",vo);
		return ".mypage";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String updateform(String id, Model model) {
		MemberVo vo=service.mypage(id);
		model.addAttribute("vo",vo);
		return ".update";
	}
	
	
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String update(MemberVo vo) {
		int n=service.update(vo);
		
		if(n>0) {
			return "redirect:/member/mypage?id=" + vo.getId();
		}else {
			return ".market";
		}
	}
	
	@RequestMapping(value="/member/leave", method=RequestMethod.GET)
	public String leaveform(Model model,String id) {
		MemberVo vo=service.mypage(id);
		model.addAttribute("vo",vo);
		return ".leave";		
	}
	
	@RequestMapping(value="/member/leave", method=RequestMethod.POST)
	public String leave(MemberVo vo) {
		int n=service.leave(vo);
		if(n>0) {
			return ".bye";
		}else {
			return ".market";
		}
		
	}
	
	@RequestMapping(value="/member/search",method=RequestMethod.GET)
	public String serachform() {
		
		return ".search";
	}
	
	@RequestMapping(value = "/member/searchid", method = RequestMethod.POST)
	public String serachid(HttpServletRequest request,Model model) {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		boolean r = service.isMembers(map);

		if (r) {
			model.addAttribute("name", name);
			model.addAttribute("email", email);
			return ".";
		} else {
			model.addAttribute("errMsg", "���̵�/��й�ȣ�� ���� �ʰų� ��ϵ� ���̵� �����ϴ�");
			return ".loginpage";
		}
	}
	
}
