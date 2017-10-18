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
import com.newface.service.MsgService;
import com.newface.vo.Iu_NameVo;
import com.newface.vo.MsgVo;


@Controller
public class MsgController {
	@Autowired MsgService service;
	
	@RequestMapping(value = "/msgrecv_list", method = RequestMethod.GET)
	public String msgrecv_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,HttpSession session) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		String loginid=(String)session.getAttribute("loginid");
		int totalRowCount=service.msgrecv_count(loginid);
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		map.put("loginid",loginid);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MsgVo> msgrecv_list=service.msgrecv_list(map);
		model.addAttribute("pu",pu);
		model.addAttribute("msgrecv_list",msgrecv_list);
		
		return ".recvlist";
	}
	
	@RequestMapping(value = "/msgsend_list", method = RequestMethod.GET)
	public String msgsend_list(@RequestParam(value="pageNum",defaultValue="1") int pageNum,Model model,HttpSession session) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		String loginid=(String)session.getAttribute("loginid");
		int totalRowCount=service.msgsend_count(loginid);
		PageUtil pu=new PageUtil(pageNum,5,5,totalRowCount);
		map.put("loginid",loginid);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MsgVo> msgsend_list=service.msgsend_list(map);
		model.addAttribute("pu",pu);
		model.addAttribute("msgsend_list",msgsend_list);
				
		return ".sendlist";
	}
	
	@RequestMapping(value = "/msg_send", method = RequestMethod.GET)
	public String msg_sendform(Model model,HttpSession session) {
		String loginid=(String)session.getAttribute("loginid");
		List<Iu_NameVo> iu_list=service.iu_list(loginid);
		session.setAttribute("iu_list", iu_list);
		
		return ".send";
	}
	
	
	
	
	@RequestMapping(value = "/msg_send", method = RequestMethod.POST)
	public String msg_send(Model model,MsgVo vo,HttpSession session) {
		String loginid=(String)session.getAttribute("loginid");
		service.msg_insert(vo);
		return "redirect:/msgsend_list?sender="+loginid;
	}
	
	
	@RequestMapping(value = "/msgrecv_getinfo", method = RequestMethod.GET)
	public String msgrecv_getinfo(Model model, int msg_num) {
		
		int n=service.msgrecv_chk(msg_num);
		
		if(n>0) {
			MsgVo msgrecv_getinfo=service.msgrecv_getinfo(msg_num);
			model.addAttribute("msgrecv_getinfo", msgrecv_getinfo);
		}
			
		return ".recvgetinfo";
	}
	
	@RequestMapping(value = "/msgsend_getinfo", method = RequestMethod.GET)
	public String msgsend_getinfo(Model model, int msg_num) {
		
		MsgVo msgsend_getinfo=service.msgrecv_getinfo(msg_num);
		model.addAttribute("msgsend_getinfo", msgsend_getinfo);
			
		return ".sendgetinfo";
	}
	
	@RequestMapping(value = "/msgrecv_delete", method = RequestMethod.GET)
	public String msgrecv_delete(Model model, int msg_num,HttpSession session) {
		String loginid=(String)session.getAttribute("loginid");
		service.msgrecv_delete(msg_num);
			
		return "redirect:/msgrecv_list?receiver="+loginid;
	}
	
	@RequestMapping(value = "/msgsend_delete", method = RequestMethod.GET)
	public String msgsend_delete(Model model, int msg_num,HttpSession session) {
		String loginid=(String)session.getAttribute("loginid");
		service.msgsend_delete(msg_num);
			
		return "redirect:/msgsend_list?sender="+loginid;
	}
	
	@RequestMapping(value = "/send_clx", method = RequestMethod.GET)
	public String send_clx(Model model, int msg_num,HttpSession session) {
		String loginid=(String)session.getAttribute("loginid");
		service.send_clx(msg_num);
			
		return "redirect:/msgsend_list?sender="+loginid;
	}
	
	@RequestMapping(value = "/msg_reply", method = RequestMethod.GET)
	public String msg_replyform(Model model, int msg_num) {
		MsgVo msgrecv_getinfo=service.msgrecv_getinfo(msg_num);
		model.addAttribute("msgrecv_getinfo", msgrecv_getinfo);
		return ".reply";
	}
	
	
	
}
