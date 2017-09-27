package com.newface.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newface.calendar.AfterCalendar;
import com.newface.calendar.AutoCalendar;
import com.newface.calendar.BeforeCalendar;
import com.newface.service.DiaryService;
import com.newface.vo.DiaryVo;
import com.newface.vo.DiarycomVo;
import com.newface.vo.DiaryfolderVo;
import com.newface.vo.HompyVo;

@Controller
public class DiaryController {
	@Autowired
	DiaryService service;

	// 해당 날짜
	@RequestMapping(value = "/calendar_auto")
	@ResponseBody
	public String auto(String regdate, HttpSession session) {
		AutoCalendar auto = new AutoCalendar(regdate);
		int year = auto.getYear();
		int month = auto.getMonth();
		int date = auto.getDate();
		int lastdate = auto.getLastdate();
		String week = auto.getWeek();

		JSONObject json = new JSONObject();
		json.put("year", year);
		json.put("month", month);
		json.put("date", date);
		json.put("lastdate", lastdate);
		json.put("week", week);
		return json.toString();
	}

	// 이전날짜
	@RequestMapping(value = "/calendar_before")
	@ResponseBody
	public String before(String regdate) {
		BeforeCalendar before = new BeforeCalendar(regdate);
		int year = before.getYear();
		int month = before.getMonth();
		int date = before.getDate();
		int lastdate = before.getLastdate();
		String week = before.getWeek();

		JSONObject json = new JSONObject();
		json.put("year", year);
		json.put("month", month);
		json.put("date", date);
		json.put("lastdate", lastdate);
		json.put("week", week);
		return json.toString();
	}

	// 다음 날짜
	@RequestMapping(value = "/calendar_after")
	@ResponseBody
	public String after(String regdate) {
		AfterCalendar after = new AfterCalendar(regdate);
		int year = after.getYear();
		int month = after.getMonth();
		int date = after.getDate();
		int lastdate = after.getLastdate();
		String week = after.getWeek();

		JSONObject json = new JSONObject();
		json.put("year", year);
		json.put("month", month);
		json.put("date", date);
		json.put("lastdate", lastdate);
		json.put("week", week);
		return json.toString();
	}

	///////////// 다이어리목록 /////////////
	@RequestMapping(value = "/diary/folder_all_list", method = RequestMethod.GET)
	public String folder_all_list(Model model, HttpSession session) {
		session.setAttribute("diary_folder_num", null);
		String id = (String) session.getAttribute("loginid");
		int hompy_num = (Integer) session.getAttribute("hompy_num");
		HompyVo vo = new HompyVo(hompy_num, 0, null, id);
		int n = service.hompy_is(vo);
		List<DiaryVo> list = null;
		if (n > 0) {
			list = service.folder_all_list(hompy_num);
		} else {
			list = service.folder_basic_list(hompy_num);
		}
		if (list != null) {
			model.addAttribute("list", list);
			return ".all_list.diary";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 요청작업이 실패했습니다");
			model.addAttribute("url", "/minihome");
			return ".code";
		}
	}

	///////////// 해당폴더목록 /////////////
	@RequestMapping(value = "/diary/list", method = RequestMethod.GET)
	public String diary_list(int diary_folder_num, HttpSession session, Model model) {
		session.setAttribute("diary_folder_num", diary_folder_num);
		List<DiaryVo> list = service.folder_list(diary_folder_num);
		int hompy_num = (Integer) session.getAttribute("hompy_num");
		if (list != null) {
			List<DiaryfolderVo> folder = service.fname(hompy_num);
			String id = service.id(hompy_num);
			String name = service.name(id);
			model.addAttribute("diary_folder_num", diary_folder_num);
			model.addAttribute("list", list);
			model.addAttribute("folder", folder);
			model.addAttribute("name", name);
			return ".list.diary";
		} else {
			model.addAttribute("code", "오류로 인하여 해당폴더 이동 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 다이어리 폼수정이동 /////////////
	@RequestMapping(value = "/diary/update", method = RequestMethod.GET)
	public String updateForm(int diary_num, Model model) {
		DiaryVo vo = service.content(diary_num);
		if (vo != null) {
			model.addAttribute("vo", vo);
			return ".update.diary";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 수정폼이동 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + diary_num);
			return ".code";
		}
	}

	///////////// 다이어리 수정 /////////////
	@RequestMapping(value = "/diary/update", method = RequestMethod.POST)
	public String update(DiaryVo vo, Model model) {
		int n = service.update(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 등록 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + vo.getDiary_num());
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + vo.getDiary_folder_num());
			return ".code";
		}
	}

	///////////// 다이어리 등록이동 /////////////
	@RequestMapping(value = "/diary/insert", method = RequestMethod.GET)
	public String insertForm(String diary_folder_num, Model model) {
		model.addAttribute("diary_folder_num", diary_folder_num);
		return ".insert.diary";
	}

	///////////// 다이어리 등록 /////////////
	@RequestMapping(value = "/diary/insert", method = RequestMethod.POST)
	public String insert(DiaryVo vo, Model model) {
		int n = service.insert(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 등록 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + vo.getDiary_folder_num());
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 등록 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 다이어리 삭제 /////////////
	@RequestMapping(value = "/diary/delete", method = RequestMethod.GET)
	public String delete(int diary_num, int diary_folder_num, Model model) {
		int n = service.delete(diary_num);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 삭제 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + diary_folder_num);
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 삭제 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + diary_folder_num);
			return ".code";
		}
	}

	///////////// 다이어리 다중 삭제 /////////////
	@RequestMapping(value = "/diary/deletes", method = RequestMethod.GET)
	public String deletes(int[] diary_nums, int diary_folder_num, Model model) {
		int n = 0;
		for (int diary_num : diary_nums) {
			n = service.delete(diary_num);
		}
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 삭제 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + diary_folder_num);
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 삭제 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + diary_folder_num);
			return ".code";
		}
	}

	///////////// 다이어리 댓글 등록 /////////////
	@RequestMapping(value = "/diary/com_insert", method = RequestMethod.POST)
	public String com_insert(DiarycomVo vo, HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginid");
		vo.setId(id);
		int n = service.com_insert(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 댓글등록 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + vo.getDiary_num());
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 댓글등록 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + vo.getDiary_num());
			return ".code";
		}
	}

	///////////// 다이어리 댓글 삭제 /////////////
	@RequestMapping(value = "/diary/com_delete", method = RequestMethod.GET)
	public String com_delete(int diary_com_num, int diary_num, Model model) {
		int n = service.com_delete(diary_com_num);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 댓글삭제 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + diary_num);
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 댓글삭제 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + diary_num);
			return ".code";
		}
	}

	///////////// 다이어리 댓글수정 /////////////
	@RequestMapping(value = "/diary/com_update", method = RequestMethod.POST)
	public String com_update(DiarycomVo vo, Model model) {
		int n = service.com_update(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 다이어리 댓글수정 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + vo.getDiary_num());
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 다이어리 댓글수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/content?diary_num=" + vo.getDiary_num());
			return ".code";
		}
	}

	///////////// 폴더관리 /////////////
	@RequestMapping(value = "/diary/folder", method = RequestMethod.GET)
	public String folder(Model model, HttpSession session) {
		int hompy_num = (Integer) session.getAttribute("hompy_num");
		List<DiaryfolderVo> list = service.fname(hompy_num);
		model.addAttribute("list", list);
		return ".folder.diary";
	}

	///////////// 폴더생성 /////////////
	@RequestMapping(value = "/diary/folder_insert", method = RequestMethod.POST)
	public String folder_insert(DiaryfolderVo vo, HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginid");
		int hompy_num = service.hompy_num(id);
		vo.setHompy_num(hompy_num);
		int n = service.folder_insert(vo);
		if (n > 0) {
			return ".folder.diary";
		} else {
			model.addAttribute("code", "오류로 인하여 폴더생성 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 폴더검색 ajax /////////////
	@RequestMapping(value = "/folder_list")
	@ResponseBody
	public String folder_list(HttpSession session) {
		int hompy_num = (Integer) session.getAttribute("hompy_num");
		List<DiaryfolderVo> list = service.fname(hompy_num);

		JSONArray arr = new JSONArray();
		for (DiaryfolderVo vo : list) {
			JSONObject json = new JSONObject();
			json.put("diary_folder_num", vo.getDiary_folder_num());
			json.put("fname", vo.getFname());
			arr.add(json);
		}
		return arr.toString();
	}

	///////////// 폴더이동 수정폼 /////////////
	@RequestMapping(value = "/diary/folder_move", method = RequestMethod.GET)
	public String folder_moveForm(int diary_num, int diary_folder_num, Model model, HttpSession session) {
		int hompy_num = (Integer) session.getAttribute("hompy_num");
		List<DiaryfolderVo> list = service.fname(hompy_num);
		String fname = service.fname_select(diary_folder_num);
		model.addAttribute("diary_num", diary_num);
		model.addAttribute("fname", fname);
		model.addAttribute("list", list);
		return ".folder_move.diary";
	}

	///////////// 폴더이동 수정 /////////////
	@RequestMapping(value = "/diary/folder_move", method = RequestMethod.POST)
	public String folder_moveForm(DiaryVo vo, Model model) {
		int n = service.folder_move(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 폴더이동 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + vo.getDiary_folder_num());
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 폴더이동 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 폴더이동 다중 수정 /////////////
	@RequestMapping(value = "/diary/folder_moves", method = RequestMethod.GET)
	public String folder_moves(DiaryVo vo, int[] diary_nums, Model model) {
		int n = 0;
		for (int diary_num : diary_nums) {
			vo.setDiary_num(diary_num);
			n = service.folder_move(vo);
		}
		if (n > 0) {
			model.addAttribute("code", "성공적으로 폴더이동 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/list?diary_folder_num=" + vo.getDiary_folder_num());
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 폴더이동 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 폴더이름 수정 /////////////
	@RequestMapping(value = "/diary/folder_update", method = RequestMethod.POST)
	public String folder_update(DiaryfolderVo vo, Model model) {
		int n = service.folder_update(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 폴더수정 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 폴더수정 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 폴더삭제 /////////////
	@RequestMapping(value = "/diary/folder_delete", method = RequestMethod.POST)
	public String folder_delete(DiaryfolderVo vo, HttpSession session, Model model) {
		int hompy_num = (Integer) session.getAttribute("hompy_num");
		vo.setHompy_num(hompy_num);
		int n = service.folder_delete(vo);
		if (n > 0) {
			model.addAttribute("code", "성공적으로 폴더삭제 요청작업이 성공했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		} else {
			model.addAttribute("code", "오류로 인하여 폴더삭제 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}

	///////////// 상세보기 /////////////
	@RequestMapping(value = "/diary/content", method = RequestMethod.GET)
	public String content(int diary_num, Model model) {
		DiaryVo vo = service.content(diary_num);
		List<DiarycomVo> com_list = service.com_list(diary_num);
		if (vo != null) {
			model.addAttribute("vo", vo);
			model.addAttribute("com_list", com_list);
			return ".content.diary";
		} else {
			model.addAttribute("code", "오류로 인하여 상세보기 요청작업이 실패했습니다");
			model.addAttribute("url", "/diary/folder_all_list");
			return ".code";
		}
	}
}
