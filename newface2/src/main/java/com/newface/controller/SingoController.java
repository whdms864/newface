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
import com.newface.service.MemberService;
import com.newface.service.MsgService;
import com.newface.service.PhotoService;
import com.newface.service.SingoService;
import com.newface.vo.AdminMsgVo;
import com.newface.vo.DiarysingoVo;
import com.newface.vo.MemberVo;
import com.newface.vo.PhotosingoVo;
import com.newface.vo.SingoVo;
import com.newface.vo.Singo_getVo;





@Controller
public class SingoController {
	@Autowired private SingoService singoservice;
	@Autowired private MsgService msgservice;
	@Autowired private MemberService memservice;
	
	@RequestMapping(value = "/singoadmin", method = RequestMethod.GET)
	public String main2(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model) {
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
	public String getinfo(Model model,int num2,String tb) {
		if(tb.equals("사진첩")) {
			List<PhotosingoVo> list=singoservice.p_getinfo(num2);
			model.addAttribute("content",list.get(0).getContent());
		}else if(tb.equals("다이어리")) {
			List<DiarysingoVo> list=singoservice.d_getinfo(num2);
			model.addAttribute("content",list.get(0).getContent());
		}
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("num",num2);
		map.put("tb",tb);
		Singo_getVo vo=singoservice.getinfo(map);
		MemberVo mvo=memservice.getinfo(vo.getId());
		model.addAttribute("type",mvo.getType());//회원상태
		model.addAttribute("vo",vo);
		return ".singoadmin_getinfo";
	}
	@RequestMapping(value = "/singo/admin/update", method = RequestMethod.POST)
	public String update(Model model,int num2,String tb,String content,int blind,String writer,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("content",content);
		map.put("blind", blind);
		if(tb.equals("사진첩")) {
			map.put("photo_num",num2);
			singoservice.ps_update(map);
			singoservice.p_blind(map);
			List<PhotosingoVo> list=singoservice.p_getinfo(num2);
			for(PhotosingoVo pvo:list) {
				AdminMsgVo vo=new AdminMsgVo(0, content, null, null, null, id, pvo.getId());//신고자들 메세지보내기
				msgservice.adminmsg_insert(vo);
			}
			AdminMsgVo vo=new AdminMsgVo(0, content, null, null, null, id, writer);//게시글 작성자 메세지 보내기
			msgservice.adminmsg_insert(vo);
			if(blind==0) {
				singoservice.p_delete_all(num2);
			}
		}else if(tb.equals("다이어리")) {
			map.put("diary_num",num2);
			singoservice.ds_update(map);
			singoservice.d_blind(map);
			List<DiarysingoVo> list=singoservice.d_getinfo(num2);
			for(DiarysingoVo dvo:list) {
				AdminMsgVo vo=new AdminMsgVo(0, content, null, null, null, id, dvo.getId());//신고자들 메세지보내기
				msgservice.adminmsg_insert(vo);
			}
			AdminMsgVo vo=new AdminMsgVo(0, content, null, null, null, id, writer);//게시글 작성자 메세지 보내기
			msgservice.adminmsg_insert(vo);
			if(blind==0) {
				singoservice.d_delete_all(num2);
			}
		}
		return "redirect:/singoadmin";
	}
}
