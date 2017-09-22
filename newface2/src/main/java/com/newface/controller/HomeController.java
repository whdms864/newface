package com.newface.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".main";
	}
	
	@RequestMapping(value = "/market", method = RequestMethod.GET)
	public String market() {
		return ".market";
	}
	
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String manager() {
		return ".admin";
	}
	
	@RequestMapping(value = "/noti", method = RequestMethod.GET)
	public String noti() {
		return ".noti";
	}
	
	
}
