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
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.page.PageUtil;
import com.newface.service.MsgService;
import com.newface.vo.AdminMsgVo;
import com.newface.vo.Iu_NameVo;
import com.newface.vo.MemberVo;
import com.newface.vo.MsgVo;

@Controller
public class MsgController {
	@Autowired
	MsgService service;

	// 받은쪽지함 목록
	@RequestMapping(value = "/msgrecv_list", method = RequestMethod.GET)
	public String msgrecv_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginid = (String) session.getAttribute("loginid");
		int totalRowCount = service.msgrecv_count(loginid);
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
		map.put("loginid", loginid);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<MsgVo> msgrecv_list = service.msgrecv_list(map);
		int msgnorecv_count = service.msgnorecv_count(loginid);
		session.setAttribute("msgnorecv_count", msgnorecv_count);
		model.addAttribute("pu", pu);
		model.addAttribute("msgrecv_list", msgrecv_list);

		return ".recvlist";
	}

	// 보낸쪽지함 목록
	@RequestMapping(value = "/msgsend_list", method = RequestMethod.GET)
	public String msgsend_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginid = (String) session.getAttribute("loginid");
		int totalRowCount = service.msgsend_count(loginid);
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
		map.put("loginid", loginid);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<MsgVo> msgsend_list = service.msgsend_list(map);
		int msgnorecv_count = service.msgnorecv_count(loginid);
		int adminmsgno_count = service.adminmsgno_count(loginid);
		session.setAttribute("adminmsgno_count", adminmsgno_count);
		session.setAttribute("msgnorecv_count", msgnorecv_count);
		model.addAttribute("pu", pu);
		model.addAttribute("msgsend_list", msgsend_list);

		return ".sendlist";
	}
	//header count
	@RequestMapping("/msg/msgnorecv_count")
	@ResponseBody
	public int msgnorecv_count(HttpSession session){
		String loginid = (String) session.getAttribute("loginid");
		int msgnorecv_count = service.msgnorecv_count(loginid);
		return msgnorecv_count;
	}
	// 쪽지보내기 페이지
	@RequestMapping(value = "/msg_send", method = RequestMethod.GET)
	public String msg_sendform(Model model, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		List<Iu_NameVo> iu_list = service.iu_list(loginid);
		int msgnorecv_count = service.msgnorecv_count(loginid);
		session.setAttribute("msgnorecv_count", msgnorecv_count);
		session.setAttribute("iu_list", iu_list);

		return ".send";
	}

	// 쪽지보내기
	@RequestMapping(value = "/msg_send", method = RequestMethod.POST)
	public String msg_send(Model model, MsgVo vo, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		int msgnorecv_count = service.msgnorecv_count(loginid);
		service.msg_insert(vo);

		session.setAttribute("msgnorecv_count", msgnorecv_count);

		return "redirect:/msgsend_list?sender=" + loginid;
	}

	// 받은쪽지 상세보기
	@RequestMapping(value = "/msgrecv_getinfo", method = RequestMethod.GET)
	public String msgrecv_getinfo(Model model, int msg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		int n = service.msgrecv_chk(msg_num);

		if (n > 0) {
			int msgnorecv_count = service.msgnorecv_count(loginid);
			MsgVo msgrecv_getinfo = service.msgrecv_getinfo(msg_num);

			session.setAttribute("msgnorecv_count", msgnorecv_count);
			model.addAttribute("msgrecv_getinfo", msgrecv_getinfo);
		}

		return ".recvgetinfo";
	}

	// 보낸쪽지 상세보기
	@RequestMapping(value = "/msgsend_getinfo", method = RequestMethod.GET)
	public String msgsend_getinfo(Model model, int msg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");

		MsgVo msgsend_getinfo = service.msgrecv_getinfo(msg_num);
		int msgnorecv_count = service.msgnorecv_count(loginid);

		model.addAttribute("msgsend_getinfo", msgsend_getinfo);
		session.setAttribute("msgnorecv_count", msgnorecv_count);

		return ".sendgetinfo";
	}
	
	// 받은쪽지 삭제
	@RequestMapping(value = "/msgrecv_delete", method = RequestMethod.GET)
	public String msgrecv_delete(Model model, int msg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		
		service.msgrecv_delete(msg_num);

		return "redirect:/msgrecv_list?receiver=" + loginid;
	}
	
	// 보낸쪽지 삭제
	@RequestMapping(value = "/msgsend_delete", method = RequestMethod.GET)
	public String msgsend_delete(Model model, int msg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		
		service.msgsend_delete(msg_num);

		return "redirect:/msgsend_list?sender=" + loginid;
	}
	
	// 발송취소
	@RequestMapping(value = "/send_clx", method = RequestMethod.GET)
	public String send_clx(Model model, int msg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		
		service.send_clx(msg_num);

		return "redirect:/msgsend_list?sender=" + loginid;
	}
	
	// 답장보내기 페이지
	@RequestMapping(value = "/msg_reply", method = RequestMethod.GET)
	public String msg_replyform(Model model, 
			@RequestParam(value = "msg_num", defaultValue = "0") int msg_num,
			HttpSession session,@RequestParam(value = "id", defaultValue = "") String id) {
		String loginid = (String) session.getAttribute("loginid");
		int msgnorecv_count = service.msgnorecv_count(loginid);
		if(id.equals("")) {
			MsgVo msgrecv_getinfo = service.msgrecv_getinfo(msg_num);
			model.addAttribute("sender", msgrecv_getinfo.getSender());
		}else {
			model.addAttribute("sender", id);
		}
		session.setAttribute("msgnorecv_count", msgnorecv_count);
		
		return ".reply";
	}
	
	@RequestMapping(value = "/adminmsg_list", method = RequestMethod.GET)
	public String adminmsg_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,
			HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String loginid = (String) session.getAttribute("loginid");
		int totalRowCount = service.adminmsg_count(loginid);
		PageUtil pu = new PageUtil(pageNum, 5, 5, totalRowCount);
		map.put("loginid", loginid);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AdminMsgVo> adminmsg_list = service.adminmsg_list(map);
		int adminmsgno_count = service.adminmsgno_count(loginid);
		session.setAttribute("adminmsgno_count", adminmsgno_count);
		
		model.addAttribute("pu", pu);
		model.addAttribute("adminmsg_list", adminmsg_list);

		return ".adminmsg_list";
	}
	
	@RequestMapping(value = "/adminmsg_getinfo", method = RequestMethod.GET)
	public String adminmsg_getinfo(Model model, int adminmsg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		AdminMsgVo adminmsg_getinfo = service.adminmsg_getinfo(adminmsg_num);
		int adminmsgno_count = service.adminmsgno_count(loginid);
		session.setAttribute("adminmsgno_count", adminmsgno_count);
		model.addAttribute("adminmsg_getinfo", adminmsg_getinfo);

		return ".adminmsg_getinfo";
	}
	
	@RequestMapping(value = "/adminmsg_delete", method = RequestMethod.GET)
	public String adminmsg_delete(Model model, int adminmsg_num, HttpSession session) {
		String loginid = (String) session.getAttribute("loginid");
		
		service.adminmsg_delete(adminmsg_num);

		return "redirect:/adminmsg_list?sender=" + loginid;
	}

}
