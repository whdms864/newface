package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.CashService;
import com.newface.service.MarketService;
import com.newface.service.MemberService;
import com.newface.service.MsgService;
import com.newface.service.NotiService;
import com.newface.service.TimelineService;
import com.newface.vo.CashVo;
import com.newface.vo.NotiVo;
import com.newface.vo.TimelineVo;

@Controller
public class LoginContorller {
	@Autowired
	private MemberService service;
	@Autowired
	private CashService cashservice;
	@Autowired
	private NotiService notiservice;
	@Autowired
	private MarketService marketservice;
	@Autowired
	private MsgService msgservice;

	// 로그인
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {

		String loginid = request.getParameter("loginid");
		String loginpwd = request.getParameter("loginpwd");

		List<NotiVo> noti_side = notiservice.noti_side();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("loginid", loginid);
		map.put("loginpwd", loginpwd);
		boolean r = service.isMembers(map);
		boolean a = service.isAdmin(map);

		if (r || a) {
			if (r) {

				// 공지사항 사이드바 & 로그인 아이디
				HttpSession session = request.getSession();
				session.setAttribute("loginid", loginid);
				session.setAttribute("noti_side", noti_side);

				// 쪽지
				int msgnorecv_count = msgservice.msgnorecv_count(loginid);
				session.setAttribute("msgnorecv_count", msgnorecv_count);

				// 미니미
				String minime_img = marketservice.minime_info(loginid);
				session.setAttribute("minime_img", minime_img);
				
				// 방문자
				int hompy_num=service.hompy_num(loginid);
				int today=service.today_today(hompy_num);
				session.setAttribute("today", today);
				
				//방명록
				int guest_now=service.guest_now(hompy_num);
				session.setAttribute("guest_now", guest_now);
				
				//일촌신청
				int iu_request_now=service.iu_request_list(loginid);
				session.setAttribute("iu_request_now", iu_request_now);
				
				CashVo vo = cashservice.list(loginid);
				if (vo != null) {
					session.setAttribute("cnt", vo.getCnt());
				} else {
					session.setAttribute("cnt", 0);
				}
				return "redirect:/main2";
			} else if (a) {
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

	// 로그아웃
	@RequestMapping("/members/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return ".main";
	}
}
