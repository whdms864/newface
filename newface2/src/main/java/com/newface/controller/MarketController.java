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
import com.newface.service.BuyService;
import com.newface.service.CashService;
import com.newface.service.MarketService;
import com.newface.service.MineService;
import com.newface.vo.BuyVo;
import com.newface.vo.Buy_Join_ItemVo;
import com.newface.vo.CashVo;
import com.newface.vo.CategoryVo;
import com.newface.vo.ItemVo;
import com.newface.vo.MineVo;
import com.newface.vo.Mine_Join_itemVo;

@Controller
public class MarketController {
	@Autowired private MarketService service;
	@Autowired private BuyService buy_service;
	@Autowired private MineService mine_service;
	@Autowired private CashService cash_service;
	
	@RequestMapping(value = "/market/item/list", method = RequestMethod.GET)
	public String user_item_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,
			@RequestParam(value="category_num",defaultValue="3") int category_num,Model model,
			@RequestParam(value="text",defaultValue="") String text) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("category_num", category_num);
		map.put("text", text);
		int totalRowCount=service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,12,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<ItemVo> list=service.list_item(map);
		List<CategoryVo> list_cate=service.list_cate_all();
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("text",text);
		model.addAttribute("category_num",category_num);
		model.addAttribute("list_cate",list_cate);
		return ".market";
	}
	@RequestMapping(value = "/market/item/getinfo", method = RequestMethod.GET)
	public String user_item_getinfo(Model model,int item_num) {
		ItemVo vo=service.getinfo_item(item_num);
		model.addAttribute("vo",vo);
		return ".item_cash";
	}
	@RequestMapping(value = "/market/buy", method = RequestMethod.POST)
	public String user_item_buy(Model model,HttpSession session,int item_num) {
		int cash_cnt=(Integer)session.getAttribute("cnt");//세션 도토리보유
		String id=(String)session.getAttribute("loginid");
		ItemVo vo=service.getinfo_item(item_num);
		int pay=vo.getPay();
		
		int item_cnt=1;//아이템수량
		
		BuyVo buyvo=new BuyVo(0, null, item_cnt, pay, item_num, id);
		buy_service.insert(buyvo);
		
		int totcnt=0;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("item_num", item_num);
		MineVo minevo_org=mine_service.getinfo(map);
		if(minevo_org!=null) {
			totcnt=minevo_org.getTotcnt()+item_cnt;
			MineVo minevo_save=new MineVo(0, totcnt, totcnt, item_num, id);
			mine_service.update(minevo_save);
		}else {
			totcnt=item_cnt;
			MineVo minevo_save=new MineVo(0, totcnt, totcnt, item_num, id);
			mine_service.insert(minevo_save);
		}
		
		cash_cnt -=pay;
		CashVo cashvo=new CashVo(0, cash_cnt, id);
		cash_service.update(cashvo);//도토리수량 차감
		
		session.setAttribute("cnt", cash_cnt);
		model.addAttribute("vo", vo);
		return ".item_buy_ok";
	}
	@RequestMapping(value = "/market/buy/list", method = RequestMethod.GET)
	public String buy_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=buy_service.getCount(id);
		PageUtil pu=new PageUtil(pageNum,12,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("id", id);
		List<Buy_Join_ItemVo> list=buy_service.joinlist(map);
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		return ".buy_list";
	}
	@RequestMapping(value = "/market/mine/list", method = RequestMethod.GET)
	public String mine_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		HashMap<String,Object> map=new HashMap<String, Object>();
		int totalRowCount=mine_service.getCount(id);
		PageUtil pu=new PageUtil(pageNum,12,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		map.put("id", id);
		List<Mine_Join_itemVo> list=mine_service.joinlist(map);
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		return ".mine_list";
	}
	
	@RequestMapping(value = "/item/info", method = RequestMethod.GET)
	public String home(HttpSession session,Model model,int item_num) {
		ItemVo vo=service.getinfo_item(item_num);
		model.addAttribute("vo",vo);
		return ".item_info";
		
	}
	
	/***************************** 관리자 ******************************************/
	
	@RequestMapping(value = "/market/admin/item/list", method = RequestMethod.GET)
	public String item_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,
			@RequestParam(value="category_num",defaultValue="3") int category_num,Model model,
			@RequestParam(value="text",defaultValue="") String text) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("category_num", category_num);
		map.put("text", text);
		int totalRowCount=service.getCount(map);
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<ItemVo> list=service.list_item(map);
		List<CategoryVo> list_cate=service.list_cate_all();
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("text",text);
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
