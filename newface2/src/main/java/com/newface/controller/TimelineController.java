package com.newface.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.LoveService;
import com.newface.service.TimelineService;
import com.newface.vo.Diary_loveVo;
import com.newface.vo.PhotoVo;
import com.newface.vo.Photo_loveVo;
import com.newface.vo.TimelineVo;





@Controller
public class TimelineController {
	@Autowired private TimelineService timelineservice;
	@Autowired private LoveService loveservice;
	
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String main2(Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		String pro_img=timelineservice.pro_img(id);
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("startrow", 0);
		map.put("endrow", 20);
		List<TimelineVo> list=timelineservice.list(map);
		model.addAttribute("list",list);
		model.addAttribute("pro_img",pro_img);
		return ".main2";
	}
	
	@RequestMapping("/main2/list")
	@ResponseBody
	public HashMap<String, Object> main2_list(int startrow,int endrow,HttpSession session){
		String id=(String)session.getAttribute("loginid");
		String pro_img=timelineservice.pro_img(id);
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		List<TimelineVo> list=timelineservice.list(map);
		map.put("list",list);
		map.put("pro_img",pro_img);
		return map;
	}
	
	@RequestMapping("/main2/love")
	@ResponseBody
	public HashMap<String, Object> main2_love(String tb ,int num,int love,HttpSession session){
		HashMap<String, Object> map=new HashMap<String, Object>();
		String id=(String)session.getAttribute("loginid");
		map.put("num", num);
		map.put("id", id);
		if(tb=="photo") {
			Photo_loveVo vo=loveservice.p_list(map);
			if(vo!=null) {
				loveservice.p_delete(map);
				love -=1;
				map.put("photo_num", num);
				map.put("love", love);
				loveservice.p_update(map);
			}else {
				Photo_loveVo vo1=new Photo_loveVo(0, id, num);
				loveservice.p_insert(vo1);
				love +=1;
				map.put("photo_num", num);
				map.put("love", love);
				loveservice.p_update(map);
			}
		}else if(tb=="diary") {
			Diary_loveVo vo=loveservice.d_list(map);
			if(vo!=null) {
				loveservice.d_delete(map);
				love -=1;
				map.put("diary_num", num);
				map.put("love", love);
				loveservice.d_update(map);
			}else {
				Diary_loveVo vo1=new Diary_loveVo(0, id, num);
				loveservice.d_insert(vo1);
				love +=1;
				map.put("diary_num", num);
				map.put("love", love);
				loveservice.d_update(map);
			}
		}
		map.put("love",love);
		return map;
	}
}
