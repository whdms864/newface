package com.newface.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.PhotoService;
import com.newface.vo.PhotoVo;
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
			return ".folder.photo";
		}else {
			model.addAttribute("code","오류");
			model.addAttribute("url","/photo/folder_list");
			return ".code";
		}
	}
	@RequestMapping(value="/photo/folder", method = RequestMethod.GET)
	public String photo_folder() {
		return ".folder.photo";
	}
	@RequestMapping(value="/photo/folder_list", method = RequestMethod.GET)
	public String folder_list(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.Hompy_num(id);
		List<PhotofolderVo> list=service.folder_list(hompy_num);
		if(list!=null) {
			model.addAttribute("list",list);
			return "forward:/photo/list";
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
	public String photo_list(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.Hompy_num(id);
		List<PhotolistVo> list1=service.photo_list(hompy_num);
		if(list1!=null) {
			model.addAttribute("list1",list1);
			return ".photo";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
}
