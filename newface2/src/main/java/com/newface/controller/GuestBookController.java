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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.page.PageUtil;
import com.newface.service.GuestbookService;
import com.newface.service.MiniHomeService;
import com.newface.vo.GuestbookVo;
import com.newface.vo.GuestbookcomVo;
import com.newface.vo.GuestbooklistVo;
import com.newface.vo.GuestcomlistVo;
import com.newface.vo.HompyVo;

@Controller
public class GuestBookController {
	@Autowired GuestbookService service;
	@Autowired MiniHomeService mini;
	
	@RequestMapping(value = "/guestbook", method = RequestMethod.GET)
	public String guestbook() {
		return ".guestbook";
	}
	@RequestMapping(value = "/guest/insert", method = RequestMethod.POST)
	public String insert(GuestbookVo vo,Model model) {
		int n=service.insert(vo);
		if(n>0) {
			return "redirect:/guest/list_all";
		}else {
			model.addAttribute("code","����");
			model.addAttribute("url","/guestbook");
			return ".code";
		}
	}
	@RequestMapping("/guest/list_all")
	public String list_all(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,HttpSession session) {
		session.setAttribute("choice", "guest");
		int hompy_num = (Integer)session.getAttribute("hompy_num");
		String id=(String)session.getAttribute("loginid");
		String home_id=mini.id(hompy_num);
		HompyVo vo1=new HompyVo(hompy_num,0,null,id);
		HompyVo hompy=service.hompy_is(vo1);
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("hompy_num", hompy_num);
		map.put("id", id);
		List<GuestbooklistVo> list=null;
		PageUtil pu=null;
		if(hompy!=null) {
			int totalRowCount=service.getCount(hompy_num);
			pu=new PageUtil(pageNum,5,5,totalRowCount);
			map.put("startRow",pu.getStartRow());
			map.put("endRow",pu.getEndRow());
			map.put("home_id",home_id);
			list=service.list_all(map);
		}else {
			int totalRowCount=service.getCount1(hompy_num);
			pu=new PageUtil(pageNum,5,5,totalRowCount);
			map.put("startRow",pu.getStartRow());
			map.put("endRow",pu.getEndRow());
			map.put("home_id",home_id);
			list=service.list_1(map);
		}
		for(GuestbooklistVo vo:list) {
			String minime_img=service.minime_info(vo.getId());
			vo.setMinime_img(minime_img);
		}
		if(list!=null) {
			model.addAttribute("home_id",home_id);
			model.addAttribute("list",list);
			model.addAttribute("pu",pu);
			return "forward:/guest/com_list";
		}else {
			model.addAttribute("code","����");
			model.addAttribute("url","/guestbook");
			return ".code";
		}
	}
	@RequestMapping(value = "/guest/secret")
	public String secret(HttpServletRequest request) {
		String value=request.getParameter("value");
		int guest_num=Integer.parseInt(request.getParameter("guest_num"));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("value", value);
		map.put("guest_num", guest_num);
		int n=service.secret(map);
		if(n>0) {
			return "redirect:/guest/list_all";
		}else {
			return ".code";
		}
	}
	@RequestMapping(value = "/guest/delete")
	public String delete(HttpServletRequest request) {
		int guest_num=Integer.parseInt(request.getParameter("guest_num"));
		service.guest_com_delete(guest_num);
		int n=service.delete(guest_num);
		if(n>0) {
			return "redirect:/guest/list_all";
		}else {
			return ".code";
		}
	}
	@RequestMapping(value="/guest/update")
	public String update(HttpServletRequest request,Model model) {
		int guest_num=Integer.parseInt(request.getParameter("guest_num"));
		GuestbookVo vo=service.update(guest_num);
		if(vo!=null) {
			model.addAttribute("vo",vo);
			model.addAttribute("guest_num",guest_num);
			return ".update.guestbook";
		}else {
			return ".code";
		}
	}
	@RequestMapping(value="/guest/updateok",method = RequestMethod.POST)
	public String updateok(GuestbookVo vo) {
		int n=service.updateok(vo);
		if(n>0) {
			return "redirect:/guest/list_all";
		}else {
			return ".code";
		}
	}
	@RequestMapping(value="/guest/com_insert",method = RequestMethod.POST)
	public String com_insert(GuestbookcomVo vo) {
		int n=service.com_insert(vo);
		if(n>0) {
			return "redirect:/guest/list_all";
		}else {
			return ".code";
		}
	}
	@RequestMapping(value="/guest/com_list")
	public String com_list(Model model) {
		List<GuestcomlistVo> list1=service.com_list();
		if(list1 != null) {
			model.addAttribute("list1",list1);
			return ".guestbook";
		}else {
			return ".code";
		}
	}
	@RequestMapping(value="/guest/com_delete")
	public String com_delete(HttpServletRequest request) {
		int guest_com_num=Integer.parseInt(request.getParameter("guest_com_num"));
		int n=service.com_delete(guest_com_num);
		if(n>0) {
			return "redirect:/guest/list_all";
		}else {
			return ".code";
		}
	}
}
