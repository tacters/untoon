package com.untoon.member.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.untoon.member.model.service.MemberService;



/*@SessionAttributes({"loginUser","loginAdmin"})*/
@SessionAttributes("loginUser")

@Controller 
public class MemberController {

		@Autowired
		private MemberService mService;
		
		//암호화 처리(spring-security에 bean등록 후) 후 작성
		@Autowired
		private BCryptPasswordEncoder bcryptPasswordEncoder;
		
		//로그인시 추가
		private Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	//로그인 페이지로 이동
	@RequestMapping("loginpage.do")
	public String loginView() {
		return "member/loginPage";
	}
	
	//회원가입페이지로 이동
		
	}
		
