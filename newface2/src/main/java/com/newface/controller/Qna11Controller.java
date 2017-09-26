package com.newface.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.newface.service.Qna11Service;
import com.newface.vo.Qna11Vo;

@Controller
public class Qna11Controller {
	@Autowired private Qna11Service service;

	@RequestMapping(value = "/qna11/insert", method = RequestMethod.GET)
	public String insertform() {
		return ".qna11";
	}
	@RequestMapping(value = "/qna11/insertok", method = RequestMethod.POST)
	public String insert(Qna11Vo vo) {
		service.insert(vo);
		return ".qna11";
	}
}
