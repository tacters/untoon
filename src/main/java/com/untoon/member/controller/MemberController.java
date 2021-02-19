package com.untoon.member.controller;



import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.untoon.member.model.service.MemberService;
import com.untoon.member.model.vo.Member;

 

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
		 
	//로그인 	  
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m , Model model) {
		Member loginUser = mService.loginMember(m);
		
		
		/*
		 * String bcrypt = bcryptPasswordEncoder.encode(m.getPwd()); 
		 * System.out.println("loginUser" + loginUser); System.out.println("Member" +
		 * m); System.out.println( bcryptPasswordEncoder.matches(m.getPwd(),
		 * loginUser.getPwd()));
		 * 
		 * System.out.println(bcrypt.length()+","+m.getPwd().length());
		 * System.out.println(loginUser.getPwd().length());
		 * 
		 * logger.info("암호화 " + bcrypt +"글자수"+ m.getPwd().length());
		 */
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			
			return "redirect:home.do";
			
			
		}else {
			model.addAttribute("msg", "로그인 실패");
			return "common/errorPage";
		}
	}
	
	//사용자 마이페이지 보내기
    @RequestMapping("myInfo.do")
    public String myInfoView() {
       return "member/myPage";
    }
    
	//강사 마이페이지(나중에 지워야함)
	@RequestMapping("teacherInfo.do")
	public String teacherInfoView() {
		return "teacher/teacherPage";
	}
	
		
	//로그인 페이지로 이동
	@RequestMapping("loginpage.do")
	public String loginView() {
		return "member/loginPage";
	}
	
	//회원가입페이지로 이동
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}
	/*
	 * //강사 회원가입페이지로 이동
	 * 
	 * @RequestMapping("teenrollView.do") public String adenrollView() { return
	 * "member/memberTeInsertForm"; }
	 */
	 
		
	//회원가입
	@RequestMapping(value="minsert.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member m, Model model,
								HttpServletRequest request) {
	
		// 기존의 평문을 암호문으로 바꿔서 m객체에 담기
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		//setter를 통해서 Member객체의 pwd 변경
		m.setPwd(encPwd);
		//회원가입 서비스 호출
		int result = mService.insertMember(m);
		
		if(result >0 ) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원가입 실패");
			return "common/errorPage";
		}
	}	
	//아이디 중복 확인
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		int result = mService.idCheck(id);
		
		if(result>0) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
}





