package com.newface.controller;


import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.newface.page.PageUtil;
import com.newface.service.MarketService;
import com.newface.vo.CategoryVo;
import com.newface.vo.ItemVo;

@Controller
public class MarketController {
	@Autowired private MarketService service;
	
	@RequestMapping(value = "/market/item/list", method = RequestMethod.GET)
	public String user_item_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@RequestParam(value="category_num",defaultValue="3") int category_num,Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=service.getCount(category_num);
		PageUtil pu=new PageUtil(pageNum,12,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("category_num", category_num);
		List<ItemVo> list=service.list_item(map);
		List<CategoryVo> list_cate=service.list_cate_all();
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("category_num",category_num);
		model.addAttribute("list_cate",list_cate);
		return ".market";
	}
	
	/***************************** °ü¸®ÀÚ ******************************************/
	
	@RequestMapping(value = "/market/admin/item/list", method = RequestMethod.GET)
	public String item_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,@RequestParam(value="category_num",defaultValue="3") int category_num,Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=service.getCount(category_num);
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("category_num", category_num);
		List<ItemVo> list=service.list_item(map);
		List<CategoryVo> list_cate=service.list_cate_all();
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("category_num",category_num);
		model.addAttribute("list_cate",list_cate);
		return ".marketadmin";
	}
	@RequestMapping(value = "/market/admin/cate/list", method = RequestMethod.GET)
	public String cate_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,@RequestParam(value="category_num",defaultValue="0") int category_num,@RequestParam(value="up",defaultValue="0") int up) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=service.getCount();
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<CategoryVo> list=service.list_cate(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("category_num",category_num);
		model.addAttribute("up",up);
		return ".marketadmin_list_cate";
	}
	@RequestMapping(value = "/market/admin/item/insert", method = RequestMethod.GET)
	public String item_insertForm(Model model) {
		List<CategoryVo> list=service.list_cate_all();
		model.addAttribute("list",list);
		return ".marketadmin_insert_item";
	}
	@RequestMapping(value = "/market/admin/item/insertok", method = RequestMethod.POST)
	public String item_insert(ItemVo vo) {
		service.insert(vo);
		return "redirect:/market/admin/item/list";
	}
	@RequestMapping(value = "/market/admin/cate/insertok", method = RequestMethod.POST)
	public String cate_insert(CategoryVo vo) {
		service.insert(vo);
		return "redirect:/market/admin/cate/list";
	}
	@RequestMapping(value = "/market/admin/item/delete", method = RequestMethod.GET)
	public String item_delete(int item_num) {
		service.delete_item(item_num);
		return "redirect:/market/admin/item/list";
	}
	@RequestMapping(value = "/market/admin/cate/delete", method = RequestMethod.GET)
	public String cate_delete(int category_num) {
		service.delete_cate(category_num);
		return "redirect:/market/admin/cate/list";
	}
	@RequestMapping(value = "/market/admin/item/update", method = RequestMethod.GET)
	public String item_update(int item_num,Model model) {
		ItemVo vo=service.getinfo_item(item_num);
		List<CategoryVo> list=service.list_cate_all();
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		return ".marketadmin_update_item";
	}
	@RequestMapping(value = "/market/admin/item/updateok", method = RequestMethod.POST)
	public String item_updateok(ItemVo vo) {
		service.update_item(vo);
		return "redirect:/market/admin/item/list";
	}
	@RequestMapping(value = "/market/admin/cate/update", method = RequestMethod.POST)
	public String cate_update(CategoryVo vo) {
		service.update_cate(vo);
		return "redirect:/market/admin/cate/list";
	}
}
