package com.newface.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.Qna11Service;
import com.newface.vo.ItemVo;
import com.newface.vo.Qna11Vo;
import com.newface.vo.Qna11comVo;

@Controller
public class MarketController {
	/*@Autowired private  service;

	*//***************************** °ü¸®ÀÚ ******************************************//*
	
	@RequestMapping(value = "/qna11/admin/item/list", method = RequestMethod.GET)
	public String item_list() {
		List<ItemVo> list=service.list();
		model.addAttribute("list",list);
		return ".marketadmin";
	}
	@RequestMapping(value = "/qna11/admin/item/insert", method = RequestMethod.GET)
	public String item_insertForm() {
		return ".marketadmin_insert_item";
	}
	@RequestMapping(value = "/qna11/admin/item/insertok", method = RequestMethod.POST)
	public String item_insert() {
		return ".qna11admin";
	}*/
}
