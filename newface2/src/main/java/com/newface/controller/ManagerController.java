package com.newface.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ManagerController {
	
	@RequestMapping(value = "/notiadmin", method = RequestMethod.GET)
	public String noti() {
		return ".notiadmin";
	}
	
	@RequestMapping(value = "/adadmin", method = RequestMethod.GET)
	public String ad() {
		return ".adadmin";
	}
	
	@RequestMapping(value = "/marketadmin", method = RequestMethod.GET)
	public String manmarket() {
		return ".marketadmin";
	}
	
	@RequestMapping(value = "/memadmin", method = RequestMethod.GET)
	public String mems() {
		return ".memadmin";
	}
	
	@RequestMapping(value = "/singoadmin", method = RequestMethod.GET)
	public String singo() {
		return ".singoadmin";
	}
	
	
}
