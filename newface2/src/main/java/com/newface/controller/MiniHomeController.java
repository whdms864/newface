package com.newface.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.MiniHomeService;
import com.newface.vo.HompyVo;
import com.newface.vo.IuVo;
import com.newface.vo.IucomVo;
import com.newface.vo.MemberVo;
import com.newface.vo.Miniroom_HompyVo;
import com.newface.vo.NowVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.RoomposiVo;
import com.newface.vo.SetupVo;

@Controller
public class MiniHomeController {
	@Autowired MiniHomeService service;
	
	@RequestMapping(value = "/minihome", method = RequestMethod.GET)
	public String home(@RequestParam(value="hompy_num",defaultValue="0")int hompy_num,HttpSession session,Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		session.setAttribute("fid", id);
		if(id == null) {
			id=(String)session.getAttribute("loginid");
			hompy_num=service.hompy_num(id);
		}else {
			hompy_num=Integer.parseInt(request.getParameter("hompy_num"));
		}
		session.setAttribute("hompy_num", hompy_num);
		System.out.println("id : " + id);
		System.out.println("hompy_num : " + hompy_num);
		
		//홈피명,총방문자
		HompyVo hompy=service.hompy(id);
		session.setAttribute("hname", hompy.getHname());
		session.setAttribute("total", hompy.getTotal());
		session.setAttribute("hompyid", hompy.getId());
		
		//메뉴설정
		SetupVo vo=service.setup_list(hompy_num);	
		session.setAttribute("diary", vo.getDiary());
		session.setAttribute("photo", vo.getPhoto());
		session.setAttribute("guest", vo.getGuest());
		
		//프로필사진
		ProfileVo profile=service.profile(hompy_num);
		model.addAttribute("vo", profile);
		
		//최신글
		List<NowVo> now=service.now(hompy_num);
		model.addAttribute("now", now);
		
		//게시판 현황
		int diary_count=service.diary_count(hompy_num);
		int diary_now=service.diary_now(hompy_num);
		int photo_count=service.photo_count(hompy_num);
		int photo_now=service.photo_now(hompy_num);
		int guest_count=service.guest_count(hompy_num);
		int guest_now=service.guest_now(hompy_num);
		model.addAttribute("diary_count", diary_count);
		model.addAttribute("diary_now", diary_now);
		model.addAttribute("photo_count", photo_count);
		model.addAttribute("photo_now", photo_now);
		model.addAttribute("guest_count", guest_count);
		model.addAttribute("guest_now", guest_now);
		
		//미니홈피 이름
		MemberVo member=service.profile_member(hompy_num);
		model.addAttribute("member", member);	
		
		//미니룸
		int mini_num=service.mini_num(hompy_num);
		List<Miniroom_HompyVo> mini=service.miniroom_hompy(mini_num);
		model.addAttribute("mini", mini);
		
		//스킨
		RoomposiVo mine=service.mine_num(mini_num);
		int item_num=0;
		if(mine!=null) {
			item_num=service.item_num(mine.getMine_num());			
		}
		if(item_num>0) {
			String item_img=service.item_img(item_num);
			session.setAttribute("item_img", item_img);						
		}
		
		return ".minihome";
	}
	@RequestMapping(value="/minihome/iu_request",method=RequestMethod.GET)
	@ResponseBody
	public String iu_request(HttpSession session) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		String i_id=service.id(hompy_num);
		String u_id=(String)session.getAttribute("loginid");
		IuVo vo=new IuVo(0, null, null, i_id, u_id);
		IuVo iu=service.iu_before(vo);
		int n=0;
		if(iu==null) {
			service.iu_request(vo);			
		}
		JSONObject json=new JSONObject();
		json.put("n", n);
		return json.toString();
	}
	@RequestMapping(value="/minihome/iu_com",method=RequestMethod.GET)
	@ResponseBody
	public String iu_com(HttpSession session,String content) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		String i_id=service.id(hompy_num);
		String u_id=(String)session.getAttribute("loginid");
		IuVo iu=new IuVo(0, null, null, i_id, u_id);
		int n1=service.iu_is(iu);
		int n2=0;
		if(n1>0) {
			IucomVo vo=new IucomVo(0, content, null, hompy_num, u_id);
			n2=service.iu_com(vo);		
		}
		JSONObject json=new JSONObject();
		json.put("n", n2);
		return json.toString();
	}
	@RequestMapping(value="/minihome/iu_com_list",method=RequestMethod.GET)
	@ResponseBody
	public String iu_com_list(HttpSession session) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		List<IucomVo> list=service.iu_com_list(hompy_num);
		JSONArray arr=new JSONArray();
		for(IucomVo vo:list) {
			JSONObject json=new JSONObject();
			String name=service.name(vo.getId());
			json.put("name", name);
			json.put("content", vo.getContent());
			arr.add(json);
		}		
		return arr.toString();
	}
}