package com.newface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NotiController {
	
	@RequestMapping(value = "/noti/admin/list", method = RequestMethod.GET)
	public String nadmin() {
		return ".notiadmin";
	}
	
	@RequestMapping(value = "/notiadmin_insert", method = RequestMethod.GET)
	public String nadmininsert() {
		
		return ".notiadmin_insert";
	}
}
