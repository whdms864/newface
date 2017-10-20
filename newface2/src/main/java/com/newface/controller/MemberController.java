package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.newface.vo.AdminVo;
import com.newface.vo.HompyVo;
import com.newface.vo.MemberVo;
import com.newface.vo.Qna11Vo;

@Controller
public class MemberController {
	@Autowired private MemberService service;
		
	@RequestMapping(value="/idcheck/json",produces="application/json;charset=utf-8")
	@ResponseBody
	public String idcheck(String id) {
		
		JSONObject json=new JSONObject();
		MemberVo vo1=service.getinfo(id);
		AdminVo vo2=service.getadmin(id);
		
		if(vo1==null && vo2==null) {
			json.put("id", "사용하실 수 있습니다.");			
		}else {
			json.put("id", "사용하실 수 없습니다.");
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String member() {
		return ".member";
	}
	
	@RequestMapping(value = "/member/insert", method = RequestMethod.POST)
	public String membergaib(MemberVo vo1,HompyVo vo2) {
		int n1=service.insert(vo1);
		int n2=service.hompyinsert(vo2);
		int hompy_num=service.hompy_num(vo1.getId());
		int n3=service.miniroom(hompy_num);
		int n4=service.setup_insert(hompy_num);
		int n5=service.profile_insert(hompy_num);
		int n6=service.diary_folder_insert(hompy_num);
		int n7=service.photo_folder_insert(hompy_num);
		if(n1>0 && n2>0 && n3>0 && n4>0 && n5>0 && n6>0 && n7>0) {
			return ".main";
		}else {
			return ".member";
		}
	}
	
	@RequestMapping("/member/mypage")
	public String mypage(Model model,String id) {
		MemberVo vo=service.mypage(id);
		model.addAttribute("vo",vo);
		return ".mypage";
	}
	
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String updateform(String id, Model model) {
		MemberVo vo=service.mypage(id);
		model.addAttribute("vo",vo);
		return ".update";
	}
	
	
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String update(MemberVo vo) {
		int n=service.update(vo);
		
		if(n>0) {
			return "redirect:/member/mypage?id=" + vo.getId();
		}else {
			return ".market";
		}
	}
	
	@RequestMapping(value="/member/leave", method=RequestMethod.GET)
	public String leaveform(Model model,String id) {
		MemberVo vo=service.mypage(id);
		model.addAttribute("vo",vo);
		return ".leave";		
	}
	
	@RequestMapping(value="/member/leave", method=RequestMethod.POST)
	public String leave(MemberVo vo,HttpSession session) {
		int n=service.leave(vo);
		if(n>0) {
			session.invalidate();
			return ".bye";
		}else {
			return ".market";
		}
		
	}
	
	@RequestMapping(value="/member/search",method=RequestMethod.GET)
	public String serachform() {
		
		return ".search";
	}
	
	@RequestMapping(value = "/member/searchid", method = RequestMethod.POST)
	public String searchid(HttpServletRequest request,Model model) {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		String id = service.searchid(map);

		if (id!=null) {
			model.addAttribute("idMsg", "검색된 아이디: "+ id);
		} else {
			model.addAttribute("idMsg", "등록된 아이디가 없습니다");
		}
		return ".search";
	}
	
	@RequestMapping(value = "/member/searchpwd", method = RequestMethod.POST)
	public String searchpwd(HttpServletRequest request,Model model) {
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		String pwd = service.searchpwd(map);

		if (pwd!=null) {
			model.addAttribute("pwdMsg", "검색된 비밀번호: "+ pwd);
		} else {
			model.addAttribute("pwdMsg", "입력하신 아이디/이메일을 찾을 수 없습니다.");
		}
		return ".search";
	}
	
	
	@RequestMapping(value = "/fsearch_list", method = RequestMethod.GET)
	public String fsearch(@RequestParam(value="pageNum",defaultValue="1") int pageNum,
		Model model,@RequestParam(value="text",defaultValue="") String text) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("text",text);
		int totalRowCount=service.fsearch_count(map);
		PageUtil pu=new PageUtil(pageNum,3,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MemberVo> fsearch_list=service.fsearch(map);
		model.addAttribute("fsearch_list",fsearch_list);
		model.addAttribute("pu",pu);
		model.addAttribute("text",text);
		return ".fsearch_list";
	}
	
	
	
	
	
	/********* 여기부터 관리자꺼 시작이다!!!!!!!!!!!**************************************/
	@RequestMapping(value = "/memadmin", method = RequestMethod.GET)
	public String admin_member_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,
			Model model,@RequestParam(value="text",defaultValue="") String text) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("text",text);
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum,13,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MemberVo> list=service.listall(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("text",text);
		return ".memadmin";
	}
	@RequestMapping(value = "/memadmin/1", method = RequestMethod.GET)
	public String admin_member_list_1(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,
			@RequestParam(value="text",defaultValue="") String text,
			@RequestParam(value="type",defaultValue="제재") String type) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("text",text);
		map.put("type",type);
		int totalRowCount=service.count_type(map);
		PageUtil pu=new PageUtil(pageNum,13,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MemberVo> list=service.getinfo_type(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("text",text);
		model.addAttribute("type",type);
		return ".memadmin_list_1";
	}
	@RequestMapping(value = "/memadmin/2", method = RequestMethod.GET)
	public String admin_member_list_2(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,
			@RequestParam(value="text",defaultValue="") String text,
			@RequestParam(value="type",defaultValue="탈퇴") String type) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("text",text);
		map.put("type",type);
		int totalRowCount=service.count_type(map);
		PageUtil pu=new PageUtil(pageNum,13,5,totalRowCount);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MemberVo> list=service.getinfo_type(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("text",text);
		model.addAttribute("type",type);
		return ".memadmin_list_2";
	}
	@RequestMapping(value = "/memadmin/getinfo", method = RequestMethod.GET)
	public String admin_member_getinfo(String id,Model model,@RequestParam(value="up",defaultValue="0") int up) {
		MemberVo vo=service.getinfo(id);
		model.addAttribute("vo",vo);
		model.addAttribute("up",up);
		return ".memadmin_getinfo";
	}
	@RequestMapping(value = "/memadmin/getinfo/update", method = RequestMethod.GET)
	public String admin_member_getinfo_update(String id,Model model,String type) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		service.update_type(map);
		return "redirect:/memadmin/getinfo?id="+id;
	}
}
