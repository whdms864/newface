package com.newface.controller;

import java.util.HashMap;
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

import com.newface.page.PageUtil;
import com.newface.service.MemberService;
import com.newface.service.MiniHomeService;
import com.newface.service.SetupService;
import com.newface.vo.HompyVo;
import com.newface.vo.ItemVo;
import com.newface.vo.IuVo;
import com.newface.vo.Iu_NameVo;
import com.newface.vo.IucomVo;
import com.newface.vo.MemberVo;
import com.newface.vo.Miniroom_HompyVo;
import com.newface.vo.NowVo;
import com.newface.vo.ProfileVo;
import com.newface.vo.RoomposiVo;
import com.newface.vo.SetupVo;
import com.newface.vo.TodayVo;

@Controller
public class MiniHomeController {
	@Autowired MiniHomeService service;
	@Autowired MemberService member;
	
	@RequestMapping(value = "/minihome", method = RequestMethod.GET)
	public String home(@RequestParam(value="hompy_num",defaultValue="0")int hompy_num,HttpSession session,
			Model model,HttpServletRequest request,
			@RequestParam(value="getid",defaultValue="") String getid) {
		session.setAttribute("choice", "home");
		//아이디 구분 (주인인지 아닌지)
		String loginid=(String)session.getAttribute("loginid");
		String id;
		if(hompy_num<1) { 
			//홈주인
			session.setAttribute("hompy_admin", "1");
			id=loginid;
			hompy_num=service.hompy_num(id);
		}else { 
			//방문자
			session.setAttribute("hompy_admin", "2");
			HashMap<String, Object> map=new HashMap<String, Object>();
			id=service.id(hompy_num);
			IuVo iu=new IuVo(0, null, null, loginid, id);
			IuVo iu_is=service.iu_is(iu);
			session.setAttribute("iu", iu_is);
			map.put("id", loginid);
			map.put("hompy_num",hompy_num);
			List<TodayVo> today=service.today_is(map);
			if(today.isEmpty()) {
				service.today_insert(map);				
			}
		}

		session.setAttribute("hompy_num", hompy_num);
		model.addAttribute("id", id);
		
		//홈피명
		HompyVo hompy=service.hompy(id);
		session.setAttribute("hname", hompy.getHname());
		session.setAttribute("hompyid", hompy.getId());
		
		//방문자
		int today=service.today_today(hompy_num);
		session.setAttribute("today", today);
		int total=service.today_total(hompy_num);
		session.setAttribute("total", total);
		
		//메뉴설정
		SetupVo vo=service.setup_list(hompy_num);	
		session.setAttribute("diary", vo.getDiary());
		session.setAttribute("photo", vo.getPhoto());
		session.setAttribute("guest", vo.getGuest());
		session.setAttribute("jukebox", vo.getJukebox());		
		
		//프로필사진
		ProfileVo profile=service.profile(hompy_num);
		session.setAttribute("vo", profile);
		
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
		session.setAttribute("member", member);	
		
		//스킨
		int mini_num=service.mini_num(hompy_num);
		RoomposiVo mine=service.mine_num(mini_num);
		int item_num=0;
		if(mine!=null) {
			item_num=service.item_num(mine.getMine_num());			
		}
		if(item_num>0) {
			String item_img=service.item_img(item_num);
			session.setAttribute("skin_img", item_img);						
		}else {
			session.setAttribute("skin_img", null);									
		}
		
		//일촌목록
		List<Iu_NameVo> iu_list=service.iu_list(loginid);
		session.setAttribute("iu_list", iu_list);
		if(getid.equals("")) {
			return ".minihome";
		}else {
			return "redirect:/setup/iu?getid="+getid;
		}
	}
	//미니룸
	@RequestMapping(value="/minihome/miniroom",method=RequestMethod.GET)
	@ResponseBody
	public String miniroom(HttpSession session) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		int mini_num=service.mini_num(hompy_num);
		List<Miniroom_HompyVo> mini=service.miniroom_hompy(mini_num);
		JSONArray arr=new JSONArray();
		for(Miniroom_HompyVo vo:mini) {
			JSONObject json=new JSONObject();
			json.put("item_img", vo.getItem_img());
			json.put("mine_num", vo.getMine_num());
			json.put("category_num", vo.getCategory_num());
			json.put("x", vo.getX());
			json.put("y", vo.getY());
			arr.add(json);
		}
		return arr.toString();
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
			int iu_request_now=member.iu_request_list(i_id);
			session.setAttribute("iu_request_now", iu_request_now);
		}
		JSONObject json=new JSONObject();
		json.put("n", n);
		return json.toString();
	}
	//일촌평 댓글등록
	@RequestMapping(value="/minihome/iu_com",method=RequestMethod.GET)
	@ResponseBody
	public String iu_com(HttpSession session,String content) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		String i_id=service.id(hompy_num);
		String u_id=(String)session.getAttribute("loginid");
		IuVo iu=new IuVo(0, null, null, i_id, u_id);
		IuVo iu_is=service.iu_is(iu);
		int n=0;
		if(iu_is!=null) {
			IucomVo vo=new IucomVo(0, content, null, hompy_num, u_id,0);
			n=service.iu_com(vo);		
		}
		JSONObject json=new JSONObject();
		json.put("n", n);
		return json.toString();
	}
	//일촌평 댓글목록
	@RequestMapping(value="/minihome/iu_com_list",method=RequestMethod.GET)
	@ResponseBody
	public String iu_com_list(HttpSession session) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		List<IucomVo> list=service.iu_com_list(hompy_num);
		JSONArray arr=new JSONArray();
		for(IucomVo vo:list) {
			JSONObject json=new JSONObject();
			String name=service.name(vo.getId());
			json.put("id", vo.getId());
			json.put("hompy_num", vo.getIu_hompy_num());
			json.put("name", name);
			json.put("content", vo.getContent());
			arr.add(json);
		}		
		return arr.toString();
	}
	@RequestMapping(value="/minihome/profile_history",method=RequestMethod.GET)
	public String profile_list(HttpSession session,Model model) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		List<ProfileVo> profile_list=service.profile_list(hompy_num);
		model.addAttribute("profile_list", profile_list);
		return "minihome/profile";
	}
	@RequestMapping(value="/minihome/iu_history",method=RequestMethod.GET)
	public String iu_history(@RequestParam(value="pageNum",defaultValue="1") int pageNum,String id,int hompy_num,HttpSession session,Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("hompy_num", hompy_num);
		map.put("id", id);
		int totalRowCount=service.iu_com_count(map);
		// 페이지번호, 한 페이지에 보여질 글의 갯수, 한 페이지에 보여질 페이지 갯수, 전체갯수		
		PageUtil page=new PageUtil(pageNum, 5, 5, totalRowCount);
		map.put("startRow", page.getStartRow());
		map.put("startRow", 0);
		List<IucomVo> list=service.iu_history(map);
		model.addAttribute("list", list);
		
		String name=service.name(id);
		model.addAttribute("name", name);
		return "minihome/iu_com";
	}
	@RequestMapping(value="/minihome/iu_delete",method=RequestMethod.GET)
	@ResponseBody
	public String iu_delete(HttpSession session) {
		String i_id=(String)session.getAttribute("loginid");
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		String u_id=service.id(hompy_num);
		IuVo vo1=new IuVo(0, null, null, i_id, u_id);
		IuVo vo2=new IuVo(0, null, null, u_id, i_id);
		int n1=service.iu_delete(vo1);
		int n2=service.iu_delete(vo2);
		JSONObject json=new JSONObject();
		json.put("n1", n1);
		json.put("n2", n2);
		return json.toString();
	}
	@RequestMapping(value="/minihome/id",method=RequestMethod.GET)
	@ResponseBody
	public String id(int hompy_num) {
		String id=service.id(hompy_num);
		JSONObject json=new JSONObject();
		json.put("id", id);
		return json.toString();
	}
}