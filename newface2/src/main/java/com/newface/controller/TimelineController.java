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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.service.ComService;
import com.newface.service.DiaryService;
import com.newface.service.LoveService;
import com.newface.service.MiniHomeService;
import com.newface.service.PhotoService;
import com.newface.service.SingoService;
import com.newface.service.TimelineService;
import com.newface.vo.ComVo;
import com.newface.vo.DiaryVo;
import com.newface.vo.Diary_loveVo;
import com.newface.vo.DiarycomVo;
import com.newface.vo.DiaryfolderVo;
import com.newface.vo.DiarysingoVo;
import com.newface.vo.PhotoVo;
import com.newface.vo.Photo_loveVo;
import com.newface.vo.PhotocomVo;
import com.newface.vo.PhotofolderVo;
import com.newface.vo.PhotosingoVo;
import com.newface.vo.TimelineVo;





@Controller
public class TimelineController {
	@Autowired private TimelineService timelineservice;
	@Autowired private LoveService loveservice;
	@Autowired private SingoService singoservice;
	@Autowired private MiniHomeService minihomeservice;
	@Autowired private PhotoService photoservice;
	@Autowired private DiaryService diaryservice;
	@Autowired private ComService comservice;
	
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
		ArrayList<HashMap<String, Object>> singolist=new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> cntlist=new ArrayList<HashMap<String,Object>>();
		for(TimelineVo vo:list) {
			if(vo.getTb().equals("photo")) {
				map.put("photo_num", vo.getNum());
				map.put("id", id);
				PhotosingoVo plist=singoservice.p_list(map);
				if(plist!=null) {
					HashMap<String,Object> map1=new HashMap<String, Object>();
					map1.put("num", vo.getNum());
					map1.put("tb", "photo");
					singolist.add(map1);
				}
				
				int cnt=comservice.p_c_list_all(vo.getNum());
				HashMap<String,Object> cntmap=new HashMap<String, Object>();
				cntmap.put("num", vo.getNum());
				cntmap.put("tb", "photo");
				cntmap.put("cnt", cnt);
				cntlist.add(cntmap);
				
			}else if(vo.getTb().equals("diary")) {
				map.put("diary_num", vo.getNum());
				map.put("id", id);
				DiarysingoVo dlist=singoservice.d_list(map);
				if(dlist!=null) {
					HashMap<String,Object> map1=new HashMap<String, Object>();
					map1.put("num", vo.getNum());
					map1.put("tb", "diary");
					singolist.add(map1);
				}
				int cnt=comservice.d_c_list_all(vo.getNum());
				HashMap<String,Object> cntmap=new HashMap<String, Object>();
				cntmap.put("num", vo.getNum());
				cntmap.put("tb", "diary");
				cntmap.put("cnt", cnt);
				cntlist.add(cntmap);
			}
		}
		model.addAttribute("list",list);
		model.addAttribute("lovelist",lovelist);
		model.addAttribute("singolist",singolist);
		model.addAttribute("cntlist",cntlist);
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
		ArrayList<HashMap<String, Object>> singolist=new ArrayList<HashMap<String,Object>>();
		ArrayList<HashMap<String, Object>> cntlist=new ArrayList<HashMap<String,Object>>();
		for(TimelineVo vo:list) {
			if(vo.getTb().equals("photo")) {
				map.put("photo_num", vo.getNum());
				map.put("id", id);
				PhotosingoVo plist=singoservice.p_list(map);
				if(plist!=null) {
					HashMap<String,Object> map1=new HashMap<String, Object>();
					map1.put("num", vo.getNum());
					map1.put("tb", "photo");
					singolist.add(map1);
				}
				
				int cnt=comservice.p_c_list_all(vo.getNum());
				HashMap<String,Object> cntmap=new HashMap<String, Object>();
				cntmap.put("num", vo.getNum());
				cntmap.put("tb", "photo");
				cntmap.put("cnt", cnt);
				cntlist.add(cntmap);
				
			}else if(vo.getTb().equals("diary")) {
				map.put("diary_num", vo.getNum());
				map.put("id", id);
				DiarysingoVo dlist=singoservice.d_list(map);
				if(dlist!=null) {
					HashMap<String,Object> map1=new HashMap<String, Object>();
					map1.put("num", vo.getNum());
					map1.put("tb", "diary");
					singolist.add(map1);
				}
				int cnt=comservice.d_c_list_all(vo.getNum());
				HashMap<String,Object> cntmap=new HashMap<String, Object>();
				cntmap.put("num", vo.getNum());
				cntmap.put("tb", "diary");
				cntmap.put("cnt", cnt);
				cntlist.add(cntmap);
			}
		}
		map.put("list",list);
		map.put("lovelist",lovelist);
		map.put("singolist",singolist);
		map.put("cntlist",cntlist);
		map.put("pro_img",pro_img);
		return map;
	}
	@RequestMapping(value = "/main2/gongU", method = RequestMethod.POST)
	public String main2_gongU(Model model,int num,int fnum,String tb
			,String title1,String title2,String add_con,String secret) {
		String title=title1+"<br>"+title2;
		if(tb.equals("photo")) {
			PhotoVo v=photoservice.photo_update(num);
			String content=add_con+"<hr>"+v.getContent();
			PhotoVo vo=new PhotoVo(0, title, content, 0, secret, 0, null, "»çÁø", fnum);
			photoservice.photo_insert(vo);
		}else if(tb.equals("diary")) {
			DiaryVo v=diaryservice.content(num);
			String content=add_con+"<hr>"+v.getContent();
			DiaryVo vo=new DiaryVo(0, secret, title, content,0, 0, null, fnum,null);
			diaryservice.insert(vo);
		}
		return "redirect:/main2";
	}
	
	@RequestMapping("/main2/hompynum")
	@ResponseBody
	public int main2_hompynum(String id){
		int hompy_num=minihomeservice.hompy_num(id);
		return hompy_num;
	}
	
	@RequestMapping("/main2/com/list")
	@ResponseBody
	public HashMap<String, Object> main2_com_list(@RequestParam(value="startrow_com",defaultValue="0") int startrow_com,
			@RequestParam(value="endrow_com",defaultValue="5") int endrow_com,int num2,String tb){
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> map_save=new HashMap<String, Object>();
		List<ComVo> list=null;
		map.put("startrow", startrow_com);
		map.put("endrow", endrow_com);
		map.put("num2", num2);
		int n=0;
		String add="";
		if(tb.equals("photo")) {
			list=comservice.p_c_list(map);
			n=comservice.p_c_list_all(num2);
			if(n>startrow_com+endrow_com) {
				add="yes";
			}else {
				add="no";
			}
		}else if(tb.equals("diary")) {
			list=comservice.d_c_list(map);
			n=comservice.d_c_list_all(num2);
			if(n>startrow_com+endrow_com) {
				add="yes";
			}else {
				add="no";
			}
		}
		map_save.put("list", list);
		map_save.put("add", add);
		return map_save;
	}
	@RequestMapping("/main2/com/insert")
	@ResponseBody
	public HashMap<String, Object> main2_com_insert(int startrow_com,int endrow_com,int num2,String tb,String content,HttpSession session){
		String id=(String)session.getAttribute("loginid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> map_save=new HashMap<String, Object>();
		List<ComVo> list=null;
		map.put("startrow", startrow_com);
		map.put("endrow", endrow_com);
		map.put("num2", num2);
		String add="";
		if(tb.equals("photo")) {
			PhotocomVo vo=new PhotocomVo(0, null, content, null, num2, id);
			photoservice.com_insert(vo);
			list=comservice.p_c_list(map);
			int n=comservice.p_c_list_all(num2);
			if(n>startrow_com+endrow_com) {
				add="yes";
			}else {
				add="no";
			}
		}else if(tb.equals("diary")) {
			DiarycomVo vo=new DiarycomVo(0, content, null, null, num2, id, null);
			diaryservice.com_insert(vo);
			list=comservice.d_c_list(map);
			int n=comservice.d_c_list_all(num2);
			if(n>startrow_com+endrow_com) {
				add="yes";
			}else {
				add="no";
			}
		
		}
		map_save.put("list", list);
		map_save.put("add", add);
		return map_save;
	}
	@RequestMapping("/main2/com/delete")
	@ResponseBody
	public HashMap<String, Object> main2_com_delete(int startrow_com,int endrow_com,int num2,String tb,int num){
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> map_save=new HashMap<String, Object>();
		List<ComVo> list=null;
		map.put("startrow", startrow_com);
		map.put("endrow", endrow_com);
		map.put("num2", num2);
		String add="";
		if(tb.equals("photo")) {
			photoservice.com_delete(num);
			list=comservice.p_c_list(map);
			int n=comservice.p_c_list_all(num2);
			if(n>startrow_com+endrow_com) {
				add="yes";
			}else {
				add="no";
			}
		}else if(tb.equals("diary")) {
			diaryservice.com_delete(num);
			list=comservice.d_c_list(map);
			int n=comservice.d_c_list_all(num2);
			if(n>startrow_com+endrow_com) {
				add="yes";
			}else {
				add="no";
			}
		}
		map_save.put("list", list);
		map_save.put("add", add);
		return map_save;
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
	
	@RequestMapping("/main2/singo")
	@ResponseBody
	public HashMap<String, Object> main2_singo(String tb ,int num,int singo,HttpSession session){
		HashMap<String, Object> map=new HashMap<String, Object>();
		String id=(String)session.getAttribute("loginid");
		map.put("id", id);
		if(tb.equals("photo")) {
			map.put("photo_num", num);
			PhotosingoVo vo=singoservice.p_list(map);
			if(vo!=null) {
				singoservice.p_delete(map);
				singo -=1;
				map.put("photo_num", num);
				map.put("singo", singo);
				singoservice.p_update(map);
			}else {
				PhotosingoVo vo1=new PhotosingoVo(0,null,num,id);
				singoservice.p_insert(vo1);
				singo +=1;
				map.put("photo_num", num);
				map.put("singo", singo);
				singoservice.p_update(map);
			}
		}else if(tb.equals("diary")) {
			map.put("diary_num", num);
			DiarysingoVo vo=singoservice.d_list(map);
			if(vo!=null) {
				singoservice.d_delete(map);
				singo -=1;
				map.put("diary_num", num);
				map.put("singo", singo);
				singoservice.d_update(map);
			}else {
				DiarysingoVo vo1=new DiarysingoVo(0,null,num,id);
				singoservice.d_insert(vo1);
				singo +=1;
				map.put("diary_num", num);
				map.put("singo", singo);
				singoservice.d_update(map);
			}
		}
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
