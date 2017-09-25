package com.newface.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.newface.service.MemberService;


@Controller
public class LoginContorller {
	@Autowired private MemberService service;
	

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String box = request.getParameter("box");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		boolean r = service.isMembers(map);

		if (r) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			return ".main2";

		} else {
			request.setAttribute("errMsg", "아이디 또는 비밀번호가 맞지 않아요");
			return "redirect:/";
		}
	}

	@RequestMapping("/members/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
