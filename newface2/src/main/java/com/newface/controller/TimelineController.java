package com.newface.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.DiaryService;
import com.newface.service.LoveService;
import com.newface.service.MiniHomeService;
import com.newface.service.PhotoService;
import com.newface.service.TimelineService;
import com.newface.vo.Diary_loveVo;
import com.newface.vo.DiaryfolderVo;
import com.newface.vo.Photo_loveVo;
import com.newface.vo.PhotofolderVo;
import com.newface.vo.TimelineVo;





@Controller
public class TimelineController {
	@Autowired private TimelineService timelineservice;
	@Autowired private LoveService loveservice;
	@Autowired private MiniHomeService minihomeservice;
	@Autowired private PhotoService photoservice;
	@Autowired private DiaryService diaryservice;
	
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String main2(Model model,HttpSession session) {
		String id=(String)session.getAttribute("loginid");
		String pro_img=timelineservice.pro_img(id);
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("startrow", 0);
		map.put("endrow", 20);
		List<TimelineVo> list=timelineservice.list(map);
		ArrayList<HashMap<String, Object>> lovelist=new ArrayList<HashMap<String,Object>>();
		for(TimelineVo vo:list) {
			if(vo.getTb().equals("photo")) {
				map.put("photo_num", vo.getNum());
				map.put("id", id);
				Photo_loveVo plist=loveservice.p_list(map);
				if(plist!=null) {
					HashMap<String,Object> map1=new HashMap<String, Object>();
					map1.put("num", vo.getNum());
					map1.put("tb", "photo");
					lovelist.add(map1);
				}
			}else if(vo.getTb().equals("diary")) {
				map.put("diary_num", vo.getNum());
				map.put("id", id);
				Diary_loveVo dlist=loveservice.d_list(map);
				if(dlist!=null) {
					HashMap<String,Object> map1=new HashMap<String, Object>();
					map1.put("num", vo.getNum());
					map1.put("tb", "diary");
					lovelist.add(map1);
				}
			}
		}
		model.addAttribute("list",list);
		model.addAttribute("lovelist",lovelist);
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
		map.put("id", id);
		if(tb.equals("photo")) {
			map.put("photo_num", num);
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
		}else if(tb.equals("diary")) {
			map.put("diary_num", num);
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
	@RequestMapping("/main2/folder/plist")
	@ResponseBody
	public List<PhotofolderVo> main2_folder_plist(String tb,HttpSession session){
		String id=(String)session.getAttribute("loginid");
		int hnum=minihomeservice.hompy_num(id);
		List<PhotofolderVo> list=photoservice.folder_list(hnum);
		return list;
	}
	
	@RequestMapping("/main2/folder/dlist")
	@ResponseBody
	public List<DiaryfolderVo> main2_folder_dlist(String tb,HttpSession session){
		String id=(String)session.getAttribute("loginid");
		int hnum=minihomeservice.hompy_num(id);
		List<DiaryfolderVo> list=diaryservice.fname(hnum);
		return list;
	}
}
