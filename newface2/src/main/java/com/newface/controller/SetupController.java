package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/setup/basic",method=RequestMethod.GET)
	public String basicForm() {
		return ".basic.setup";
	}
	@RequestMapping(value="/setup/basic",method=RequestMethod.POST)
	public String basic(SetupVo vo,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n=service.menu_update(vo);
		if(n>0) {
			return ".basic.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 카테고리 메뉴수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/basic");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/skin",method=RequestMethod.GET)
	public String skin(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		List<ItemVo> list=service.skin_list(id);
		model.addAttribute("list", list);
		
		//스킨
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		RoomposiVo mine=service.skin_mine_num(hompy_num);
		int item_num=0;
		if(mine!=null) {
			item_num=service.item_num(mine.getMine_num());			
		}
		if(item_num>0) {
			String item_img=service.item_img(item_num);
			session.setAttribute("item_img", item_img);			
		}		
		return ".skin.setup";
	}
	@RequestMapping(value="/setup/hname",method=RequestMethod.POST)
	public String hname(HompyVo vo,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n=service.hname(vo);
		if(n>0) {
			return ".basic.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 홈피명 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/hname");
			return ".code";
		}
	}
	@RequestMapping(value="/setup/profile",method=RequestMethod.GET)
	public String profileForm() {
		return ".profile.setup";
	}
	@RequestMapping(value="/setup/profile_content",method=RequestMethod.POST)
	public String profile_content(String content,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		ProfileVo vo=new ProfileVo(0, null, content, null, null, null, hompy_num);
		int n=service.profile_content(vo);
		if(n>0) {
			return ".profile.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 자기소개 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/profile");
			return ".code";
		}		
	}
	@RequestMapping(value="/setup/profile_todayis",method=RequestMethod.POST)
	public String profile_todayis(ProfileVo vo,HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n=service.profile_todayis(vo);
		if(n>0) {
			return ".profile.setup";			
		}else {
			model.addAttribute("code", "오류로 인하여 기분상태 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/setup/profile");
			return ".code";
		}		
	}
	@RequestMapping(value="/setup/bgm",method=RequestMethod.GET)
	public String bgm() {
		return ".bgm.setup";
	}
	@RequestMapping(value="/setup/iu",method=RequestMethod.GET)
	public String iu(HttpSession session,Model model) {
		String id=(String)session.getAttribute("loginid");
		List<IuVo> iuVo=service.iu_request_list(id);
		model.addAttribute("iuVo", iuVo);
		return ".iu.setup";
	}
	@RequestMapping(value="/setup/iuOk",method=RequestMethod.GET)
	@ResponseBody
	public String iuOk(HttpSession session,String u_id) {
		String i_id=(String)session.getAttribute("loginid");
		IuVo vo=new IuVo(0, null, null, i_id, u_id);
		int n=service.iuOk(vo);
		JSONObject json=new JSONObject();
		json.put("n", n);
		return json.toString();
	}	
	@RequestMapping(value="/setup/miniroom",method=RequestMethod.GET)
	public String miniroom(HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		int mini_num=service.mini_num(hompy_num);
		List<Miniroom_HompyVo> mini=service.miniroom_hompy(mini_num);
		model.addAttribute("mini", mini);
		
		String id=(String)session.getAttribute("loginid");
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
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		MineVo mine=new MineVo(0, 0, 0, item_num, id);
		int mine_num=service.mine_num(mine);
		int mini_num=service.mini_num(hompy_num);
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
	@RequestMapping(value="/setup/skin_update",method=RequestMethod.GET)
	public String skin_update(int item_num,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		MineVo mine=new MineVo(0, 0, 0, item_num, id);
		int mine_num=service.mine_num(mine);
		int mini_num=service.mini_num(hompy_num);
		RoomposiVo posi=new RoomposiVo(0, mini_num, null, 0, 0, mine_num);
		service.skin_delete(mini_num);
		int n=service.skin_insert(posi);
		
		//이미지 불러오기
		String item_img=service.item_img(item_num);
		JSONObject json=new JSONObject();
		json.put("n", n);
		json.put("item_img", item_img);		
		return json.toString();
	}
	@RequestMapping(value="/setup/miniroom_decorate",method=RequestMethod.GET)
	@ResponseBody
	public String miniroom_decorate(HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		List<ItemVo> list=service.miniroom_decorate(id);
		JSONArray arr=new JSONArray();
		for(ItemVo vo:list) {
			JSONObject json=new JSONObject();
			json.put("item_num", vo.getItem_num());
			json.put("item_img", vo.getItem_img());
			arr.add(json);
		}
		return arr.toString();
	}
}
