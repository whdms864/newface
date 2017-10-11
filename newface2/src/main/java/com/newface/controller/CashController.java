package com.newface.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CashController {
	@RequestMapping(value = "/cash", method = RequestMethod.GET)
	public String home() {
		return ".cash";
	}
	@RequestMapping(value = "/cash/insert", method = RequestMethod.POST)
	public String insert() {
		return ".cash_insert";
	}
}