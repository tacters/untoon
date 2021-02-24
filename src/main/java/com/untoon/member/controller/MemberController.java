package com.untoon.member.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	public String memberLogin(@ModelAttribute Member m , Model  model) {
		Member loginUser = mService.loginMember(m);
		
		/*
		 * //네이버로 로그인 SNSLogin snsLogin = new SNSLogin(naverSns);
		 * model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		 */
			
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
	
	
	/*
	 * //네이버 로그인
	 * 
	 * @RequestMapping(value="naverLogin.do{service}", method= { RequestMethod.GET,
	 * RequestMethod.POST}) public String snsLoginCallback(Model model,
	 * 
	 * @RequestParam String code) throws Exception{ SnsValue sns = null;
	 * if(StringUtils.equals("naver",service)) sns = naverSns;
	 * 
	 * //1. code를 이용해서 acces_token받기 //2. access_token을 이용해서 사용자 profile 정보 가져오기
	 * SNSLogin snsLogin = new SNSLogin(sns); Member snsMember =
	 * snsLogin.getUserProfile(code);
	 * 
	 * return "loginResult"; }
	 */
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// 로그아웃을 처리를 위해서 커맨드 객체로 세션의 상태를 관리할 수있는 SessionStatus 객체가 필요하다.
		
		// 세션의 상태를 확정지어주는 메소드 호출
		status.setComplete();
		
		return "redirect:home.do";
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
	
	// 강사회원가입페이지로 이동
	@RequestMapping("tenrollview.do")
	public String tenrollview() {
		return "member/teacherInsertForm";
	}
	
	
	//마이페이지로 이동
	@RequestMapping("myInfo.do")
	public String myInfo() {
		return "member/myPageheader";
	}
	
	//회원수정페이지로 이동
	@RequestMapping("myUpdateView.do")
	public String myUpdateView() {
		return "member/myInfoView";
	}
	
	//회원 탈퇴페이지로 이동
	@RequestMapping("myDeleteView.do")
	public String myDeleteView() {
		return "member/myDeleteView";
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
	
	@RequestMapping("mupdate.do")
	public String memberUpdate(@ModelAttribute Member m, Model model) {
		System.out.println("Member :" + m);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
		
		// setter를 통해서 Member객체의 pwd를 변경
		m.setPwd(encPwd);
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		}else {
			model.addAttribute("msg","회원정보 수정 실패!");
			return "common/errorPage";
		}
	}
	@RequestMapping("mdelete.do")
	public String memeberDelete(SessionStatus status,
								@RequestParam("id") String id,
								Model model) {
		
		int result = mService.deleteMember(id);
		
		if(result > 0) {
			return "redirect:logout.do";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
		
	}
}





