package com.untoon.clss.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.untoon.clss.model.service.ClssService;
import com.untoon.clss.model.vo.Clss;

@Controller
public class ClssController {
	@Autowired
	private ClssService cService;
	
	// 강사 클래스 목록조회
	@RequestMapping("tclss.do")
	public String tClssList(Model model) {
		
		ArrayList<Clss> list = cService.selectAll();
		
		if(list.size() > 0) {
			model.addAttribute("list",list);
			return "teacher/tacherClssListView";
		}else {
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "error/errorPage";
		}
	}
	
	// 공지사항 메뉴로 이동
	@RequestMapping("myInfo.do")
	public String ClassList() {
		return "member/myPage";
	}
	
}