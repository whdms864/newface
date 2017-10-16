package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.CashService;
import com.newface.service.MemberService;
import com.newface.service.NotiService;
import com.newface.service.Qna11Service;
import com.newface.service.TimelineService;
import com.newface.vo.CashVo;
import com.newface.vo.NotiVo;
import com.newface.vo.TimelineVo;
import com.newface.vo.Timeline_proVo;


@Controller
public class LoginContorller {
	@Autowired private MemberService service;
	@Autowired private CashService cashservice;
	@Autowired private TimelineService timelineservice;
	@Autowired private NotiService notiservice;
	

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request,Model model) {

		String loginid = request.getParameter("loginid");
		String loginpwd = request.getParameter("loginpwd");
		
		List<NotiVo> noti_side=notiservice.noti_side();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("loginid", loginid);
		map.put("loginpwd", loginpwd);
		boolean r = service.isMembers(map);
		boolean a = service.isAdmin(map);

		if (r || a) {
			if(r) {
				HttpSession session = request.getSession();
				session.setAttribute("loginid", loginid);
				session.setAttribute("noti_side", noti_side);
				
				CashVo vo=cashservice.list(loginid);
				if(vo!=null) {
					session.setAttribute("cnt", vo.getCnt());
				}else {
					session.setAttribute("cnt", 0);
				}
				List<TimelineVo> list=timelineservice.list();
				Timeline_proVo pro_img=timelineservice.pro_img(loginid);
				model.addAttribute("list",list);
				model.addAttribute("pro_img",pro_img);
				return ".main2";
			}else if(a) {
				HttpSession session = request.getSession();
				session.setAttribute("loginid", loginid);
				return ".admin";
			}
		} else {
			model.addAttribute("errMsg", "아이디/비밀번호가 맞지 않거나 등록된 아이디가 없습니다");
			return ".loginpage";
		}
		return null;
	}
	
	

	@RequestMapping("/members/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return ".main";
	}
}
