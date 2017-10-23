package com.newface.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.newface.page.PageUtil;
import com.newface.service.DiaryService;
import com.newface.service.PhotoService;
import com.newface.service.SingoService;
import com.newface.vo.DiaryVo;
import com.newface.vo.DiarysingoVo;
import com.newface.vo.PhotoVo;
import com.newface.vo.PhotosingoVo;
import com.newface.vo.SingoVo;





@Controller
public class SingoController {
	@Autowired private SingoService singoservice;
	@Autowired private PhotoService photoservice;
	@Autowired private DiaryService diaryservice;
	
	@RequestMapping(value = "/singoadmin", method = RequestMethod.GET)
	public String main2(@RequestParam(value="pageNum",defaultValue="1") int pageNum,
			Model model,HttpSession session) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=singoservice.getcount();
		PageUtil pu=new PageUtil(pageNum,15,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<SingoVo> list=singoservice.singo_list(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		return ".singoadmin";
	}
	@RequestMapping(value = "/singo/admin/getinfo", method = RequestMethod.GET)
	public String main2(Model model,HttpSession session,int num2,String tb) {
		if(tb.equals("사진첩")) {
			List<PhotosingoVo> list=singoservice.p_getinfo(num2);
			PhotoVo v=photoservice.photo_update(num2);
			model.addAttribute("list",list);
			model.addAttribute("cvo",v);
		}else if(tb.equals("다이어리")) {
			List<DiarysingoVo> list=singoservice.d_getinfo(num2);
			DiaryVo v=diaryservice.content(num2);
			model.addAttribute("list",list);
			model.addAttribute("cvo",v);
		}
		return ".singoadmin_getinfo";
	}
}
