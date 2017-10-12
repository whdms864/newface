package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.newface.page.PageUtil;
import com.newface.service.PhotoService;
import com.newface.vo.PhotoVo;
import com.newface.vo.PhotocomVo;
import com.newface.vo.PhotofolderVo;
import com.newface.vo.PhotolistVo;
@Controller
public class PhotoController {
	@Autowired PhotoService service;
	
	@RequestMapping(value = "/photo", method = RequestMethod.GET)
	public String photo() {
		return ".photo";
	}
	@RequestMapping(value = "/photo/write", method = RequestMethod.GET)
	public String write(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.Hompy_num(id);
		List<PhotofolderVo> list=service.folder_list(hompy_num);
		model.addAttribute("list",list);
		return ".write.photo";
	}
	@RequestMapping(value= "/photo/folder_insert", method = RequestMethod.POST)
	public String folder_insert(PhotofolderVo vo,HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.Hompy_num(id);
		vo.setHompy_num(hompy_num);
		int n=service.folder_insert(vo);
		if(n>0) {
			return "redirect:/photo/folder";
		}else {
			model.addAttribute("code","오류");
			model.addAttribute("url","/photo/folder_list");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/folder", method = RequestMethod.GET)
	public String photo_folder(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.Hompy_num(id);
		List<PhotofolderVo> list=service.folder_list(hompy_num);
		if(list!=null) {
			model.addAttribute("list",list);
			return ".folder.photo";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/folder_list", method = RequestMethod.GET)
	public String folder_list(Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.Hompy_num(id);
		List<PhotofolderVo> list=service.folder_list(hompy_num);
		if(list!=null) {
			model.addAttribute("list",list);
			return ".photo";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/insert", method = RequestMethod.POST)
	public String photo_insert(PhotoVo vo,Model model) {
		int n=service.photo_insert(vo);
		if(n>0) {
			return ".photo";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/list")
	public String photo_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@RequestParam(value="photo_folder_num",defaultValue="0")int photo_folder_num,HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		int hompy_num=service.Hompy_num(id);
		String name=service.name(id);
		map.put("hompy_num", hompy_num);
		map.put("photo_folder_num", photo_folder_num);
		List<PhotolistVo> list1 =null;
		PageUtil pu=null;
		if (photo_folder_num > 0) {
			int totalRowCount=service.getCount1(photo_folder_num);
			pu=new PageUtil(pageNum, 5, 5, totalRowCount);
			map.put("startRow",pu.getStartRow());
			map.put("endRow",pu.getEndRow());
			list1=service.photo_list1(map);
		}else {
			int totalRowCount=service.getCount(hompy_num);
			pu=new PageUtil(pageNum, 5, 5, totalRowCount);
			map.put("startRow",pu.getStartRow());
			map.put("endRow",pu.getEndRow());
			list1=service.photo_list(map);
		}
		if(list1!=null) {
			model.addAttribute("list1",list1);
			model.addAttribute("pu",pu);
			model.addAttribute("name",name);
			return "forward:/photo/com_list";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/delete", method = RequestMethod.GET)
	public String photo_delete(Model model,HttpServletRequest request) {
		int photo_num=Integer.parseInt(request.getParameter("photo_num"));
		int n=service.photo_delete(photo_num);
		if(n>0) {
			return "redirect:/photo/folder_list";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/love", method = RequestMethod.GET)
	public String photo_love(Model model,HttpServletRequest request) {
		int love=Integer.parseInt(request.getParameter("love"));
		int photo_num=Integer.parseInt(request.getParameter("photo_num"));
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("love", love);
		map.put("photo_num", photo_num);
		int n=service.photo_love(map);
		if(n>0) {
			return "redirect:/photo/folder_list";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/update", method = RequestMethod.GET)
	public String photo_update(Model model,HttpServletRequest request) {
		int photo_num=Integer.parseInt(request.getParameter("photo_num"));
		PhotoVo vo=service.photo_update(photo_num);
		if(vo !=null) {
			model.addAttribute("vo",vo);
			return ".update.photo";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/updateok", method = RequestMethod.POST)
	public String photo_updateok(Model model,PhotoVo vo) {
		int n=service.photo_updateok(vo);
		if(n>0) {
			return "redirect:/photo/folder_list";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/folder_update", method = RequestMethod.POST)
	public String folder_update(PhotofolderVo vo,Model model) {
		int n=service.folder_update(vo);
		if(n>0) {
			return "redirect:/photo/folder";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/folder_delete", method = RequestMethod.POST)
	public String folder_delete(PhotofolderVo vo,Model model) {
		int n=service.folder_delete(vo);
		if(n>0) {
			return "redirect:/photo/folder";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/com_insert", method = RequestMethod.POST)
	public String com_insert(PhotocomVo vo,Model model) {
		int n=service.com_insert(vo);
		if(n>0) {
			return "redirect:/photo/folder_list";
		}else {
			model.addAttribute("code","오류");
			return ".code"; 
		}
	}
	@RequestMapping(value="/photo/com_list", method = RequestMethod.GET)
	public String com_list(Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		String name=service.name(id);
		List<PhotocomVo> list=service.com_list();
		if(list != null) {
			model.addAttribute("name",name);
			model.addAttribute("list2",list);
			model.addAttribute("id",id);
			return "forward:/photo/folder_list";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/com_delete", method = RequestMethod.GET)
	public String com_delete(Model model,HttpServletRequest request) {
		int photo_com_num=Integer.parseInt(request.getParameter("photo_com_num"));
		int n=service.com_delete(photo_com_num);
		if(n>0) {
			return "redirect:/photo/folder_list";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
}
