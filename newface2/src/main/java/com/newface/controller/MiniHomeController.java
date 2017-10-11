package com.newface.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.MiniHomeService;
import com.newface.vo.HompyVo;
import com.newface.vo.MemberVo;
import com.newface.vo.NowVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.SetupVo;

@Controller
public class MiniHomeController {
	@Autowired MiniHomeService service;
	
	@RequestMapping(value = "/minihome", method = RequestMethod.GET)
	public String home(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		session.setAttribute("hompy_num", hompy_num);
		
		//홈피명,총방문자
		HompyVo hompy=service.hompy(id);
		session.setAttribute("hname", hompy.getHname());
		session.setAttribute("total", hompy.getTotal());
		session.setAttribute("hompyid", hompy.getId());
		
		//메뉴설정
		SetupVo vo=service.setup_list(hompy_num);
		System.out.println("hompy_num : " + hompy_num);
		System.out.println("diary : " + vo.getDiary());
		System.out.println("photo : " + vo.getPhoto());
		System.out.println("guest : " + vo.getGuest());		
		session.setAttribute("diary", vo.getDiary());
		session.setAttribute("photo", vo.getPhoto());
		session.setAttribute("guest", vo.getGuest());
		
		//프로필사진
		ProfileVo profile=service.profile(hompy_num);
		model.addAttribute("vo", profile);
		
		//최신글
		List<NowVo> now=service.now(hompy_num);
		model.addAttribute("now", now);
		
		//게시판 현황
		int diary_count=service.diary_count(hompy_num);
		int diary_now=service.diary_now(hompy_num);
		int photo_count=service.photo_count(hompy_num);
		int photo_now=service.photo_now(hompy_num);
		int guest_count=service.guest_count(hompy_num);
		int guest_now=service.guest_now(hompy_num);
		model.addAttribute("diary_count", diary_count);
		model.addAttribute("diary_now", diary_now);
		model.addAttribute("photo_count", photo_count);
		model.addAttribute("photo_now", photo_now);
		model.addAttribute("guest_count", guest_count);
		model.addAttribute("guest_now", guest_now);
		
		//미니홈피 이름
		MemberVo member=service.profile_member(hompy_num);
		model.addAttribute("member", member);
		return ".minihome";
	}
}
