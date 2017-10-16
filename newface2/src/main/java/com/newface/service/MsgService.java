package com.newface.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MsgDao;

@Service
public class MsgService {
	@Autowired MsgDao dao;
	
}
