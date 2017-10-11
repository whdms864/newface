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
		return ".cash";
		
	}
	@RequestMapping(value = "/cash/insert", method = RequestMethod.POST)
	public String insert(Model model,HttpSession session,String mon) {
		String id=(String)session.getAttribute("loginid");
		int addcnt=0;
		int cnt=0;
		addcnt=Integer.parseInt(mon);
		CashVo vo=service.list(id);
		if(vo!=null) {
			cnt=vo.getCnt()+addcnt;
			vo.setCnt(cnt);
			service.update(vo);
		}else {
			CashVo vo2=new CashVo(0, addcnt, id);
			service.insert(vo2);
		}
		session.setAttribute("cnt", cnt);
		model.addAttribute("addcnt", addcnt);
		return ".cash_insert";
	}
}
