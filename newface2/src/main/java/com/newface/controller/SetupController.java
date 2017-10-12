package com.newface.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.SetupService;
import com.newface.vo.HompyVo;
import com.newface.vo.IuVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;

@Controller
public class SetupController {
	@Autowired SetupService service;
	
	@RequestMapping(value="/setup/basic",method=RequestMethod.GET)
	public String basicForm() {
		return ".basic.setup";
	}
	@RequestMapping(value="/setup/basic",method=RequestMethod.POST)
	public String basic(SetupVo vo,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n=service.menu_update(vo);
		if(n>0) {
			return ".basic.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 카테고리 메뉴수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/basic");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/skin",method=RequestMethod.GET)
	public String skin() {
		return ".skin.setup";
	}
	@RequestMapping(value="/setup/hname",method=RequestMethod.POST)
	public String hname(HompyVo vo,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n=service.hname(vo);
		if(n>0) {
			return ".basic.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 홈피명 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/hname");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/profile",method=RequestMethod.GET)
	public String profileForm() {
		return ".profile.setup";
	}
	@RequestMapping(value="/setup/profile_content",method=RequestMethod.POST)
	public String profile_content(String content,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		ProfileVo vo=new ProfileVo(0, null, content, null, null, null, hompy_num);
		int n=service.profile_content(vo);
		if(n>0) {
			return ".profile.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 자기소개 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/profile");
			return ".code";
		}		
	}
	@RequestMapping(value="/setup/profile_todayis",method=RequestMethod.POST)
	public String profile_todayis(ProfileVo vo,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n=service.profile_todayis(vo);
		if(n>0) {
			return ".profile.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 기분상태 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/profile");
			return ".code";
		}		
	}
	@RequestMapping(value="/setup/bgm",method=RequestMethod.GET)
	public String bgm() {
		return ".bgm.setup";
	}
	@RequestMapping(value="/setup/iu",method=RequestMethod.GET)
	public String iu(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		List<IuVo> iuVo=service.iu_request_list(id);
		model.addAttribute("iuVo", iuVo);
		return ".iu.setup";
	}
	@RequestMapping(value="/setup/iuOk",method=RequestMethod.GET)
	@ResponseBody
	public String iuOk(HttpSession session,String u_id) {
		String i_id=(String)session.getAttribute("loginid");
		IuVo vo=new IuVo(0, null, null, i_id, u_id);
		int n=service.iuOk(vo);
		JSONObject json=new JSONObject();
		json.put("n", n);
		return json.toString();
	}	
}
