package com.untoon.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenubarController {

	@RequestMapping("menubar.do")
	public String menubar() {
		return "common/menubar";
	}

	@RequestMapping("errorpage.do")
	public String errorpage() {
		return "common/errorPage";
	}

}
