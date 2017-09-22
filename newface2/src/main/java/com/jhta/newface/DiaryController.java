package com.jhta.newface;

import java.util.Calendar;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DiaryController {
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary() {
		return ".diary";
	}
	@RequestMapping(value="/now")
	@ResponseBody
	public String now() {	
		Calendar today=Calendar.getInstance();
		int y=today.get(Calendar.YEAR);
		int m=(today.get(Calendar.MONTH)+1);
		int lastday=today.getActualMaximum(Calendar.DATE);
		int w=today.get(Calendar.DAY_OF_WEEK);
		String week=null;
		switch (w) {
			case 1:week="일요일";break;
			case 2:week="월요일";break;
			case 3:week="화요일";break;
			case 4:week="수요일";break;
			case 5:week="목요일";break;
			case 6:week="금요일";break;
			case 7:week="토요일";break;
		}
		JSONObject json=new JSONObject();
		json.put("y", y);
		json.put("m", m);
		json.put("lastday", lastday);
		json.put("week", week);
		return json.toString();
	}
	@RequestMapping(value="/before")
	@ResponseBody
	public String before(String year,String month) {	
		Calendar cd=Calendar.getInstance();
		cd.set(Calendar.YEAR, Integer.parseInt(year));
		cd.set(Calendar.MONTH, (Integer.parseInt(month)-2));
		int y=cd.get(Calendar.YEAR);
		int m=(cd.get(Calendar.MONTH)+1);
		int lastday=cd.getActualMaximum(Calendar.DATE);
		int w=cd.get(Calendar.DAY_OF_WEEK);
		String week=null;
		switch (w) {
			case 1:week="일요일";break;
			case 2:week="월요일";break;
			case 3:week="화요일";break;
			case 4:week="수요일";break;
			case 5:week="목요일";break;
			case 6:week="금요일";break;
			case 7:week="토요일";break;
		}
		JSONObject json=new JSONObject();
		json.put("y", y);
		json.put("m", m);
		json.put("lastday", lastday);
		json.put("week", week);
		return json.toString();
	}
	
	@RequestMapping(value="/after")
	@ResponseBody
	public String after(String year,String month) {	
		Calendar cd=Calendar.getInstance();	
		if(month.equals("12")) {
			cd.set(Calendar.YEAR,(Integer.parseInt(year)+1));
			cd.set(Calendar.MONTH,0);
		}else {
			cd.set(Calendar.YEAR, Integer.parseInt(year));
			cd.set(Calendar.MONTH, (Integer.parseInt(month)));
		}
		int y=cd.get(Calendar.YEAR);
		int m=(cd.get(Calendar.MONTH)+1);
		int lastday=cd.getActualMaximum(Calendar.DATE);
		int w=cd.get(Calendar.DAY_OF_WEEK);
		String week=null;
		switch (w) {
			case 1:week="일요일";break;
			case 2:week="월요일";break;
			case 3:week="화요일";break;
			case 4:week="수요일";break;
			case 5:week="목요일";break;
			case 6:week="금요일";break;
			case 7:week="토요일";break;
		}
		JSONObject json=new JSONObject();
		json.put("y", y);
		json.put("m", m);
		json.put("lastday", lastday);
		json.put("week", week);
		return json.toString();
	}
}
