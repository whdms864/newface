package com.newface.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.newface.service.SetupService;
import com.newface.vo.ProfileVo;

@Controller
public class FileUpdateController {
	@Autowired private SetupService service;
	
	@RequestMapping(value="/setup/profile_photo",method=RequestMethod.POST)
	public String update(MultipartFile file1,HttpSession session) {
		int hompy_num=(Integer)session.getAttribute("hompy_num");
		// 기존파일 삭제
		String path=session.getServletContext().getRealPath("resources/upload");
		ProfileVo delvo=service.profile(hompy_num);
		if(!delvo.getSave_name().isEmpty()) {
			File f=new File(path + "\\" + delvo.getSave_name());
			f.delete();			
		}
		// 파일 업로드
		String orgfilename=file1.getOriginalFilename();
		//(중복되지 않는)저장할 파일명 만들기
		String savefilename=UUID.randomUUID() + "_" + orgfilename;
		try {
			//파일업로드(파일복사)하기
			InputStream is=file1.getInputStream();
			FileOutputStream fos=new FileOutputStream(path + "\\" + savefilename);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();			
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return "file/error";
		}
		// DB수정
		ProfileVo vo=service.profile(hompy_num);
		ProfileVo profile=new ProfileVo(vo.getPro_num(), vo.getTodayis(), vo.getContent(), null, orgfilename, savefilename, hompy_num);
		service.profile_insert(profile);
		return ".profile.setup";		
	}
}
