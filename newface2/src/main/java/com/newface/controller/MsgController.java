package com.newface.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.MsgService;


@Controller
public class MsgController {
	@Autowired MsgService service;
	
	@RequestMapping(value = "/msg", method = RequestMethod.GET)
	public String msg_recvlist(Model model) {
		
		return ".msg";
	}
	
	@RequestMapping(value = "/msg_sendlist", method = RequestMethod.GET)
	public String msg_sendlist(Model model) {
		
		return ".sendlist";
	}
	
	@RequestMapping(value = "/msg_send", method = RequestMethod.GET)
	public String msg_send(Model model) {
		
		return ".send";
	}
}
