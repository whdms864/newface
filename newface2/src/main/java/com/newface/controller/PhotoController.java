package com.newface.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class PhotoController {
	@RequestMapping(value = "/photo", method = RequestMethod.GET)
	public String photo() {
		return ".photo";
	}
	@RequestMapping(value = "/pwrite", method = RequestMethod.GET)
	public String write() {
		return ".pwrite";
	}
}
