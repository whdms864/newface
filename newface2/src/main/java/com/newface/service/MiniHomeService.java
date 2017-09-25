package com.newface.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newface.dao.MiniHomeDao;


@Service
public class MiniHomeService {
	@Autowired public MiniHomeDao dao;

	public int hompy_num(String id) {
		return dao.hompy_num(id);
	}
}
