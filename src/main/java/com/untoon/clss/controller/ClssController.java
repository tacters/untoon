package com.untoon.clss.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.untoon.clss.model.service.ClssService;
import com.untoon.clss.model.vo.Clss;
import com.untoon.member.model.vo.Member;

@Controller
public class ClssController {
	@Autowired
	private ClssService cService;

//	// 강사 클래스 목록조회
//	@RequestMapping("tclist.do")
//	public String tClssListMethod(Model model) {
//		
//		ArrayList<Clss> list = cService.tClssList();
//		
//		if(list.size() > 0) {
//			System.out.println("목록있음");
//			model.addAttribute("list",list);
//			return "clss/teacherPage";
//		}else {
//			System.out.println("목록없음");
//			model.addAttribute("msg", "강의 목록 조회 실패");
//			return "common/errorPage";
//		}
//	}

	// 강사 클래스 목록조회
	@RequestMapping("tclist.do")
	public String tClssListMethod(Model model, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		ArrayList<Clss> list = cService.tClssList(loginUser);
		System.out.println(list);
//		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println(loginUser);
		if (list.size() > 0 && loginUser != null) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "teacher/teacherClssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	/*
	 * //강사 마이페이지(나중에 지워야함)
	 * 
	 * @RequestMapping("teacherInfo.do") public String teacherInfoView() { return
	 * "teacher/teacherPage"; }
	 */

	// 강사 클래스등록 페이지로 이동
	@RequestMapping("cupmove.do")
	public String moveUpdateClss() {
		return "clss/clssInsertForm";
	}

	// 강사 클래스 상세 보기
	@RequestMapping("tcdetail.do")
	public String selectTclssMethod(@RequestParam("cid") int cid, Model model) {
//		HttpSession session
		Clss clss = cService.selectTclss(cid);

		if (clss != null) {
			System.out.println("값있음");
			model.addAttribute("clss", clss);
			return "clss/teacherDetailView";
		} else {
			System.out.println("값없음");
			model.addAttribute("msg", "강사 상세보기 실패");
			return "common/errorPage";
		}
	}

}