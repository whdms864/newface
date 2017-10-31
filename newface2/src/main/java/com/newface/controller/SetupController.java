package com.newface.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.MemberService;
import com.newface.service.SetupService;
import com.newface.vo.HompyVo;
import com.newface.vo.ItemVo;
import com.newface.vo.IuVo;
import com.newface.vo.MineVo;
import com.newface.vo.Miniroom_HompyVo;
import com.newface.vo.Miniroom_listVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.RoomposiVo;
import com.newface.vo.SetupVo;

@Controller
public class SetupController {
	@Autowired SetupService service;
	@Autowired MemberService member;
	
	@RequestMapping(value="/setup/basic",method=RequestMethod.GET)
	public String basicForm(Model model,HttpSession session) {
		session.setAttribute("choice", "set");
		session.setAttribute("set_menu", "set_basic");
		String id=(String)session.getAttribute("loginid");
		String hname=service.hname_select(id);
		int hompy_num=service.hompy_num(id);
		SetupVo vo=service.setup_list(hompy_num);
		
		model.addAttribute("id", id);
		model.addAttribute("vo", vo);
		model.addAttribute("hname", hname);
		return ".basic.setup";
	}
	@RequestMapping(value="/setup/menu",method=RequestMethod.POST)
	public String basic(SetupVo vo,HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		vo.setHompy_num(hompy_num);
		int n=service.menu_update(vo);
		if(n>0) {
			SetupVo menu=service.setup_list(hompy_num);	
			model.addAttribute("vo", menu);
			session.setAttribute("diary", menu.getDiary());
			session.setAttribute("photo", menu.getPhoto());
			session.setAttribute("guest", menu.getGuest());
			session.setAttribute("jukebox", menu.getJukebox());
			return ".basic.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 카테고리 메뉴수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/basic");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/skin",method=RequestMethod.GET)
	public String skin(HttpSession session,Model model) {
		session.setAttribute("set_menu", "set_skin");
		String id=(String)session.getAttribute("loginid");
		List<ItemVo> list=service.skin_list(id);
		model.addAttribute("list", list);
		
		//스킨
		MineVo vo=service.skin_info(id);
		if(vo!=null) {
			int item_num=vo.getItem_num();
			model.addAttribute("skin_num", item_num);			
		}
		return ".skin.setup";
	}
	@RequestMapping(value="/setup/hname",method=RequestMethod.POST)
	public String hname(HompyVo vo,HttpSession session,Model model) {
		session.setAttribute("set_menu", "set_profile");
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		vo.setHompy_num(hompy_num);
		int n=service.hname(vo);
		if(n>0) {
			HompyVo hompy=service.hompy(id);
			session.setAttribute("hname", hompy.getHname());
			
			SetupVo setup=service.setup_list(hompy_num);
			model.addAttribute("vo", setup);
			model.addAttribute("hname", vo.getHname());
			return ".basic.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 홈피명 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/hname");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/profile",method=RequestMethod.GET)
	public String profileForm(HttpSession session,Model model) {
		session.setAttribute("set_menu", "set_profile");
		session.setAttribute("choice", "set");
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		ProfileVo vo=service.profile(hompy_num);
		model.addAttribute("vo", vo);
		return ".profile.setup";
	}
	@RequestMapping(value="/setup/profile_content",method=RequestMethod.POST)
	public String profile_content(String content,HttpSession session,Model model) {
		session.setAttribute("set_menu", "set_profile");
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		ProfileVo vo=service.profile(hompy_num);
		ProfileVo profile=new ProfileVo(vo.getPro_num(), vo.getTodayis(), content, null, vo.getOrg_name(), vo.getSave_name(), hompy_num);
		int n=service.profile_insert(profile);
		if(n>0) {
			return ".profile.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 자기소개 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/profile");
			return ".code";
		}		
	}
	@RequestMapping(value="/setup/profile_todayis",method=RequestMethod.POST)
	public String profile_todayis(String todayis,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		ProfileVo vo=service.profile(hompy_num);
		ProfileVo profile=new ProfileVo(vo.getPro_num(), todayis, vo.getContent(), null, vo.getOrg_name(), vo.getSave_name(), hompy_num);
		int n=service.profile_insert(profile);
		if(n>0) {
			model.addAttribute("vo", profile);
			return ".profile.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 기분상태 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/profile");
			return ".code";
		}		
	}
	@RequestMapping(value="/setup/iu",method=RequestMethod.GET)
	public String iu(HttpSession session,Model model,
			@RequestParam(value="getid",defaultValue="") String getid) {
		session.setAttribute("set_menu", "set_iu");
		String id="";
		if(getid.equals("")) {
			id=(String)session.getAttribute("loginid");
		}else {
			id=getid;
		}
		List<IuVo> iuVo=service.iu_request_list(id);
		model.addAttribute("iuVo", iuVo);
		return ".iu.setup";
	}
	@RequestMapping(value="/setup/iuOk",method=RequestMethod.GET)
	@ResponseBody
	public String iuOk(HttpSession session,String u_id) {
		String i_id=(String)session.getAttribute("loginid");
		//서로 일촌을 맺기 때문
		IuVo vo=new IuVo(0, null, null, i_id, u_id);
		int n=service.iuOk(vo);
		service.iu_insert(vo);
		int iu_request_now=member.iu_request_list(i_id);
		session.setAttribute("iu_request_now", iu_request_now);
		JSONObject json=new JSONObject();
		json.put("n", n);
		return json.toString();
	}	
	@RequestMapping(value="/setup/miniroom",method=RequestMethod.GET)
	public String miniroom(HttpSession session,Model model) {
		session.setAttribute("set_menu", "set_miniroom");
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		int mini_num=service.mini_num(hompy_num);
		List<Miniroom_HompyVo> mini=service.miniroom_hompy(mini_num);
		model.addAttribute("mini", mini);
		
		Miniroom_listVo vo=new Miniroom_listVo(0, 0, 0, 0, id, 6, null, null);
		List<Miniroom_listVo> wallpaper=service.miniroom_wallpaper(vo);
		model.addAttribute("wallpaper", wallpaper);

		return ".miniroom.setup";
	}
	@RequestMapping(value="/setup/item_img",method=RequestMethod.GET)
	@ResponseBody
	public String item_img(int item_num) {
		String item_img=service.item_img(item_num);
		JSONObject json=new JSONObject();
		json.put("item_img", item_img);
		return json.toString();
	}
	@RequestMapping(value="/setup/room_posi",method=RequestMethod.GET)
	@ResponseBody
	public String room_posi(int item_num,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		HashMap<String,Object> map=new HashMap<String, Object>();
		int hompy_num=service.hompy_num(id);
		MineVo mine=new MineVo(0, 0, 0, item_num, id);
		int mine_num=service.mine_num(mine);
		int mini_num=service.mini_num(hompy_num);
		map.put("mine_num",mine_num);
		map.put("mini_num",mini_num);
		service.wall_delete(map);
		RoomposiVo posi=new RoomposiVo(0, mini_num, null, 0, 0, mine_num);
		RoomposiVo test=service.mine_num_is(posi);
		int n2=0;
		if(test==null) {
			n2=service.position_insert(posi);			
		}
		
		JSONObject json=new JSONObject();
		json.put("n", n2);
		return json.toString();
	}
	@RequestMapping(value="/setup/skin_update",method=RequestMethod.POST)
	public String skin_update(int item_num,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		if(item_num==-1) {
			int mini_num=service.mini_num(hompy_num);
			service.basic_skin(mini_num);
			session.setAttribute("item_img", null);
		}else {
			MineVo mine=new MineVo(0, 0, 0, item_num, id);
			int mine_num=service.mine_num(mine);
			int mini_num=service.mini_num(hompy_num);
			RoomposiVo posi=new RoomposiVo(0, mini_num, null, 0, 0, mine_num);
			service.skin_delete(mini_num);
			int n=service.skin_insert(posi);			
			//이미지 불러오기
			if(n>0) {
				String item_img=service.item_img(item_num);
				session.setAttribute("skin_img", item_img);													
			}
		}
		
		return "redirect:/setup/skin";
	}
	@RequestMapping(value="/setup/miniroom_decorate",method=RequestMethod.GET)
	public String miniroom_decorate(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		List<ItemVo> list=service.miniroom_decorate(id);
		if(list!=null) {
			model.addAttribute("list",list);
			return ".item";
		}else {
			model.addAttribute("code","오류");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/minime",method=RequestMethod.GET)
	public String minime(Model model,HttpSession session) {
		session.setAttribute("set_menu", "set_minime");
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		int mini_num=service.mini_num(hompy_num);
		String minime_img=service.minime_img(mini_num);
		model.addAttribute("minime_img", minime_img);
		MineVo vo=service.minime_info(id);
		List<ItemVo> list=service.minime_list(id);
		model.addAttribute("list", list);
		model.addAttribute("id", id);
		if(vo!=null) {
			model.addAttribute("item_num", vo.getItem_num());			
		}
		return ".minime.setup";
	}
	@RequestMapping(value="/setup/minime_update",method=RequestMethod.POST)
	public String minime_update(int item_num,Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("item_num", item_num);
		int mine_num=service.minime_mine_num(map);
		int hompy_num=service.hompy_num(id);
		int mini_num=service.mini_num(hompy_num);
		map.put("mine_num", mine_num);
		map.put("mini_num", mini_num);
		RoomposiVo vo=service.minime_is(mini_num);
		if(vo!=null) {
			service.minime_delete(mini_num);
		}
		service.minime_insert(map);
		
		String minime_img=service.minime_img(mini_num);
		session.setAttribute("minime_img", minime_img);
		List<ItemVo> list=service.minime_list(id);
		model.addAttribute("list", list);
		model.addAttribute("id", id);
		return ".minime.setup";
	}	
	@RequestMapping(value="/setup/bgm",method=RequestMethod.GET)
	public String bgm(HttpSession session,Model model) {
		session.setAttribute("set_menu", "set_bgm");
		String id=(String)session.getAttribute("loginid");
		List<ItemVo> list=service.bgm_list(id);
		model.addAttribute("list", list);
		return ".bgm.setup";
	}
	@RequestMapping(value="/setup/bgm_insert",method=RequestMethod.GET)
	public String bgm_insert(int[] mine_nums,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		int mini_num=service.mini_num(hompy_num);
		service.bgm_delete(mini_num);
		for(int mine_num:mine_nums) {
			RoomposiVo vo=new RoomposiVo(0, mini_num, null, 0, 0, mine_num);
			service.bgm_insert(vo);
		}
		List<ItemVo> bgm_start=service.bgm_start(mini_num);
		session.setAttribute("bgm_start", bgm_start);
		
		String id=(String)session.getAttribute("loginid");
		List<ItemVo> list=service.bgm_list(id);
		model.addAttribute("list", list);
		return ".bgm.setup";
	}
	@RequestMapping(value="/setup/miniroom_insert",method=RequestMethod.POST)
	@ResponseBody
	public String miniroom_insert(@RequestBody Map<Object, Object> map,Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=service.hompy_num(id);
		int mini_num=service.mini_num(hompy_num);
		service.miniroom_delete(mini_num);
		ArrayList item_num=(ArrayList) map.get("item_num");
		String[] item=new String[item_num.size()];
		ArrayList x=(ArrayList) map.get("x");
		String[] x1=new String[x.size()];
		ArrayList y=(ArrayList) map.get("y");
		String[] y1=new String[y.size()];
		ArrayList mine_num=(ArrayList) map.get("mine_num");
		String[] mine=new String[mine_num.size()];
		for(int i=0;i<item_num.size();i++) {
			item[i] = item_num.get(i).toString();
			x1[i] = x.get(i).toString();
			y1[i] = y.get(i).toString();
			mine[i] = mine_num.get(i).toString();
			
			Double x2=Double.parseDouble(x1[i]);
			Double y2=Double.parseDouble(y1[i]);
			int mine2=Integer.parseInt(mine[i]);
			
			RoomposiVo vo1=new RoomposiVo(0, mini_num, null, x2, y2, mine2);
			service.miniroom_insert(vo1);
		}
		return "result";
	}
	@RequestMapping(value="/setup/bgm/test",method=RequestMethod.GET)
	public String bgm_test() {
		return "minihome/bgm";
	}
}
