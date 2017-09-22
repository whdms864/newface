package com.jhta.newface;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MiniHomeController {
	
	@RequestMapping(value = "/minihome", method = RequestMethod.GET)
	public String home() {
		return ".minihome";
	}
	@RequestMapping(value = "/photo", method = RequestMethod.GET)
	public String photo() {
		return ".photo";
	}
	@RequestMapping(value = "/guestbook", method = RequestMethod.GET)
	public String guestbook() {
		return ".guestbook";
	}
	@RequestMapping(value = "/setup", method = RequestMethod.GET)
	public String setup() {
		return ".setup";
	}
}
