package com.newface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SetupController {
	@RequestMapping(value="/setup/menu",method=RequestMethod.GET)
	public String menu() {
		return ".menu.setup";
	}
}
