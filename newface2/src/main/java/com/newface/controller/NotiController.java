package com.newface.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.newface.service.NotiService;
import com.newface.vo.NotiVo;

@Controller
public class NotiController {
	@Autowired private NotiService service;
	
	@RequestMapping(value = "/noti/list", method = RequestMethod.GET)
	public String notilist() {
		return ".notilist";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.GET)
	public String ndmininsertform() {
		return ".notiadmin_insert";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.POST)
	public String nadmininsert(NotiVo vo) {
		service.insert(vo);
		return ".notiadmin";
	}
}
