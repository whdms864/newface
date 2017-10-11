package com.newface.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.CashService;
import com.newface.vo.CashVo;

@Controller
public class CashController {
	@Autowired private CashService service;
	
	@RequestMapping(value = "/cash", method = RequestMethod.GET)
	public String home(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		CashVo vo=service.list(id);
		if(vo!=null) {
			model.addAttribute("cnt", vo.getCnt());
		}else {
			model.addAttribute("cnt", 0);
		}
		return ".cash";
		
	}
	@RequestMapping(value = "/cash/insert", method = RequestMethod.POST)
	public String insert(Model model,HttpSession session,String mon,String mon_info) {
		String id=(String)session.getAttribute("loginid");
		
		int cnt=0;
		
		if(mon!="직접입력") {
			cnt=Integer.parseInt(mon);
		}else {
			cnt=Integer.parseInt(mon_info);
		}
		CashVo vo=service.list(id);
		if(vo!=null) {
			vo.setCnt(vo.getCnt()+cnt);
			service.update(vo);
		}else {
			CashVo vo2=new CashVo(0, cnt, id);
			service.insert(vo2);
		}
		model.addAttribute("cnt", cnt);
		return ".cash_insert";
	}
}
