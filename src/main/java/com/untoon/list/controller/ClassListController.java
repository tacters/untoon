package com.untoon.list.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ClassListController {

	// 공지사항 메뉴로 이동
	@RequestMapping("classList.do")
	public String ClassList() {
		return "classlist/list";
	}

}