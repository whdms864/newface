package com.newface.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ManagerController {
	
	@RequestMapping(value = "/adadmin", method = RequestMethod.GET)
	public String ad() {
		return ".adadmin";
	}

	
	@RequestMapping(value = "/singoadmin", method = RequestMethod.GET)
	public String singo() {
		return ".singoadmin";
	}
	
	
}
