package com.newface.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.MarketService;
import com.newface.vo.CategoryVo;
import com.newface.vo.ItemVo;

@Controller
public class MarketController {
	@Autowired private MarketService service;

	/***************************** °ü¸®ÀÚ ******************************************/
	
	@RequestMapping(value = "/market/admin/item/list", method = RequestMethod.GET)
	public String item_list(Model model) {
		List<ItemVo> list=service.list_item();
		model.addAttribute("list",list);
		return ".marketadmin";
	}
	@RequestMapping(value = "/market/admin/cate/list", method = RequestMethod.GET)
	public String cate_list(Model model) {
		List<CategoryVo> list=service.list_cate();
		model.addAttribute("list",list);
		return ".marketadmin_list_cate";
	}
	@RequestMapping(value = "/market/admin/item/insert", method = RequestMethod.GET)
	public String item_insertForm(int item_num,Model model) {
		ItemVo vo=service.getinfo_item(item_num);
		model.addAttribute("vo", vo);
		return ".marketadmin_insert_item";
	}
	@RequestMapping(value = "/market/admin/item/insertok", method = RequestMethod.POST)
	public String item_insert(ItemVo vo,Model model) {
		service.insert(vo);
		return "redirect:/market/admin/item/list";
	}
	@RequestMapping(value = "/market/admin/cate/insert", method = RequestMethod.GET)
	public String cate_insertForm(int category_num,Model model) {
		CategoryVo vo=service.getinfo_cate(category_num);
		model.addAttribute("vo", vo);
		return ".marketadmin_insert_cate";
	}
	@RequestMapping(value = "/market/admin/cate/insertok", method = RequestMethod.POST)
	public String cate_insert(CategoryVo vo,Model model) {
		service.insert(vo);
		return "redirect:/market/admin/cate/list";
	}
}
