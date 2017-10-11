package com.newface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class AdController {
	
	
	@RequestMapping(value = "/adimg_list", method = RequestMethod.GET)
	public String adimg_list(Model model) {
		
		return ".adimg_list";
	}
	
	@RequestMapping(value = "/adimg_getinfo", method = RequestMethod.GET)
	public String adimg_getinfo(Model model) {
		
		return ".adimg_getinfo";
	}
	
	@RequestMapping(value = "/adimg_insert", method = RequestMethod.GET)
	public String adimg_insert(Model model) {
		
		return ".adimg_insert";
	}
	
	@RequestMapping(value = "/ad_list", method = RequestMethod.GET)
	public String ad_list(Model model) {
		
		return ".ad_list";
	}
	
	@RequestMapping(value = "/ad_getinfo", method = RequestMethod.GET)
	public String ad_getinfo(Model model) {
		
		return ".ad_getinfo";
	}
	
	@RequestMapping(value = "/ad_insert", method = RequestMethod.GET)
	public String ad_insert(Model model) {
		
		return ".ad_insert";
	}
	
	@RequestMapping(value = "/ader_list", method = RequestMethod.GET)
	public String ader_list(Model model) {
		
		return ".ader_list";
	}
	
	@RequestMapping(value = "/ader_getinfo", method = RequestMethod.GET)
	public String ader_getinfo(Model model) {
		
		return ".ader_getinfo";
	}
	
	@RequestMapping(value = "/ader_insert", method = RequestMethod.GET)
	public String ader_insert(Model model) {
		
		return ".ader_insert";
	}
}
