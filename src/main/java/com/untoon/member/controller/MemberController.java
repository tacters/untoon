package com.untoon.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.untoon.member.model.service.MemberService;
import com.untoon.member.model.vo.Member;

/*@SessionAttributes({"loginUser","loginAdmin"})*/
@SessionAttributes("loginUser")

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	// 암호화 처리(spring-security에 bean등록 후) 후 작성
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 로그인시 추가
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(@ModelAttribute Member m, Model model) {
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

		if (loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);

			return "redirect:home.do";

		} else {
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

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		// 로그아웃을 처리를 위해서 커맨드 객체로 세션의 상태를 관리할 수있는 SessionStatus 객체가 필요하다.

		// 세션의 상태를 확정지어주는 메소드 호출
		status.setComplete();

		return "redirect:home.do";
	}

	// 로그인 페이지로 이동
	@RequestMapping("loginpage.do")
	public String loginView() {
		return "member/loginPage";
	}

	// 회원가입페이지로 이동
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberInsertForm";
	}

	// 마이페이지로 이동
	@RequestMapping("myInfo.do")
	public String myInfo() {
		return "member/myPageheader";
	}

	// 회원수정페이지로 이동
	@RequestMapping("myUpdateView.do")
	public String myUpdateView() {
		return "member/myInfoView";
	}

	// 강사 정보 변경 페이지로 이동(비밀번호 바꾸기, 휴대폰 번호바꾸기)
	@RequestMapping("tup.do")
	public String tupMethod() {
		return "teacher/teacherUpdatePage";
	}

	// 회원 탈퇴페이지로 이동
	@RequestMapping("myDeleteView.do")
	public String myDeleteView() {
		return "member/myDeleteView";
	}

	// 아이디 찾는 페이지로 이동
	@RequestMapping("findidview.do")
	public String idfindView() {
		return "member/findIdView";
	}

	// 비밀번호 찾는 페이지로 이동
	@RequestMapping("findpwdview.do")
	public String pwdfindView() {
		return "member/findPwdView";
	}
	
	// 일반회원 -> 강사로 지원하기
	@RequestMapping("insertTeacher.do")
	public String insertTeacher() {
		return "member/teacherInsertForm";
	}
	
	//관리자 -> 일반회원 목로페이지
	@RequestMapping("mlist.do")
	public String memberlist(@RequestParam("page") int currentPage, Model model) {
		int limit= 10;
		ArrayList<Member> list = mService.selectList(currentPage, limit);
		
		//페이지 처리와 관련된 값 처리
		//총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = mService.getListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
	    // 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
	    int startPage = ((int) (double) currentPage / 10) * 10 + 1;
	    int endPage = startPage + 9;
	    
	    if (maxPage < endPage)
	         endPage = maxPage;
	    
	    if(list.size()>0) {
	    	 model.addAttribute("list", list);
	         model.addAttribute("currentPage", currentPage);
	         model.addAttribute("maxPage", maxPage);
	         model.addAttribute("startPage", startPage);
	         model.addAttribute("endPage", endPage);
	         
	         return "member/memberListView";
	    }else {
	    	 model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
	         return "common/errorPage";
	    }
	}
	
	//회원정보 상세 보기
	@RequestMapping("mdetail.do")
	public String memberDetailVeiw(@RequestParam("id") int id,
					@RequestParam(name="page", required = false, defaultValue="1") int currentPage, Model model) {
		Member member = mService.selectMember(id); 
		
		if(member != null ) {
			model.addAttribute("page", currentPage);
			model.addAttribute("member", member);
			return "member/memberDetailView";
		}else {
			model.addAttribute("msg", id + "정보가 없습니다.");
			return "common/errorPage";
		}
	}

	// 회원가입
	@RequestMapping(value = "minsert.do", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute Member m, Model model, HttpServletRequest request,
			@RequestParam(name = "afile", required = false) MultipartFile afile,
			@RequestParam(name = "rfile", required = false) MultipartFile rfile) {

		// 프로필 사진
		// 업로드된 파일 저장 폴더 지정하기
		String saveAvatar = request.getSession().getServletContext().getRealPath("resources/images/profilePics");
		System.out.println(afile);
		System.out.println(rfile);
		// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자' 형식으로 바꾸어 저장함
		if (afile != null) {
			String fileName = afile.getOriginalFilename();
			System.out.println(fileName);
			if (fileName != null && fileName.length() > 0) {
				m.setAvatar(fileName); // 원래 파일명 vo 에 저장하고

				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())); // System = 자바가 구동되는
																									// 컴퓨터
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

				try {
					afile.transferTo(new File(saveAvatar + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
				System.out.println(renameFileName);
				m.setRename_avatar(renameFileName);
			}
		}

		// 이력서
		// 업로드된 파일 저장 폴더 지정하기
		String saveResume = request.getSession().getServletContext().getRealPath("resources/resume_files");

		// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자' 형식으로 바꾸어 저장함
		if (rfile != null) {
			String fileName = rfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				m.setOriginal_resume(fileName);// 원래 파일명 vo 에 저장하고

				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())); // System = 자바가 구동되는
																									// 컴퓨터
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

				try {
					rfile.transferTo(new File(saveResume + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
				m.setRename_resume(renameFileName);
			}
		}

		// 기존의 평문을 암호문으로 바꿔서 m객체에 담기
		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());

		// setter를 통해서 Member객체의 pwd 변경
		m.setPwd(encPwd);
		// 회원가입 서비스 호출
		int result = mService.insertMember(m);

		if (result > 0) {
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "회원가입 실패");
			return "common/errorPage";
		}

	}

	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping("idCheck.do")
	public String idCheck(String id) {
		int result = mService.idCheck(id);

		if (result > 0) {
			return "fail";
		} else {
			return "ok";
		}
	}

	// 강사 개인정보 수정하기
	@RequestMapping("tupdate.do")
	public String tUpdate(@ModelAttribute Member m, Model model, HttpServletRequest request,
			@RequestParam(name = "afile", required = false) MultipartFile afile,
			@RequestParam(name = "rfile", required = false) MultipartFile rfile) {

		// 첨부된 파일 저장 폴더 지정하기(이력서 저장)
		String saveAvatar = request.getSession().getServletContext().getRealPath("resources/images/profilePics");
		System.out.println(afile);
		// 새로운 첨부파일이 있따면
		if (afile != null) {
			String fileName = afile.getOriginalFilename();
			String renameFileName = null;
			if (fileName != null && fileName.length() > 0) {
				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())); // System = 자바가 구동되는 컴퓨터
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

				try {
					afile.transferTo(new File(saveAvatar + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
			} // 첨부된 파일의 파일명 변경에서 폴더에 저장 처리

			// 원래 첨부파일이 있는데 바뀐경우
			if (m.getAvatar() != null) {
				// 원래 파일을 폴더에서 삭제 처리
				new File(saveAvatar + "\\" + m.getAvatar()).delete();
			}

			m.setAvatar(fileName);
			m.setRename_avatar(renameFileName);
		}
		
		// 첨부된 파일 저장 폴더 지정하기(이력서 저장)
				String saveRfile= request.getSession().getServletContext().getRealPath("resources/resume_files");
				System.out.println(rfile);
				// 새로운 첨부파일이 있따면
				if (rfile != null) {
					String fileName = rfile.getOriginalFilename();
					String renameFileName = null;
					if (fileName != null && fileName.length() > 0) {
						// 첨부된 파일의 파일명 바꾸기
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())); // System = 자바가 구동되는 컴퓨터
						renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

						try {
							rfile.transferTo(new File(saveRfile + "\\" + renameFileName));
						} catch (Exception e) {
							e.printStackTrace();
							model.addAttribute("msg", "전송 파일 저장 실패");
							return "common/errorPage";
						}
					} // 첨부된 파일의 파일명 변경에서 폴더에 저장 처리

					// 원래 첨부파일이 있는데 바뀐경우
					if (m.getOriginal_resume() != null) {
						// 원래 파일을 폴더에서 삭제 처리
						new File(saveRfile + "\\" + m.getOriginal_resume()).delete();
					}

					m.setOriginal_resume(fileName);
					m.setRename_resume(renameFileName);
				}

		System.out.println("Member : " + m);

		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());

		// setter를 통해서 Member객체의 pwd를 변경
		m.setPwd(encPwd);

		int result = mService.updateMember(m);

		System.out.println("CMember : " + m);

		if (result > 0) {
			System.out.println("성공");
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패");
			return "common/errorPage";
		}
	}

	// 일반회원정보 수정하기
	@RequestMapping("mupdate.do")
	public String memberUpdate(@ModelAttribute Member m, Model model, HttpServletRequest request,
			@RequestParam(name = "afile", required = false) MultipartFile afile) {
		// 첨부된 파일 저장 폴더 지정하기
		String saveNewAvatar = request.getSession().getServletContext().getRealPath("resources/images/profilePics");
		System.out.println(afile);
		// 새로운 첨부파일이 있따면
		if (afile != null) {
			String fileName = afile.getOriginalFilename();
			String renameFileName = null;
			if (fileName != null && fileName.length() > 0) {
				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())); // System = 자바가 구동되는 컴퓨터
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

				try {
					afile.transferTo(new File(saveNewAvatar + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
			} // 첨부된 파일의 파일명 변경에서 폴더에 저장 처리

			// 원래 첨부파일이 있는데 바뀐경우
			if (m.getAvatar() != null) {
				// 원래 파일을 폴더에서 삭제 처리
				new File(saveNewAvatar + "\\" + m.getAvatar()).delete();
			}

			m.setAvatar(fileName);
			m.setRename_avatar(renameFileName);
		}

		System.out.println("Member :" + m);

		String encPwd = bcryptPasswordEncoder.encode(m.getPwd());

		// setter를 통해서 Member객체의 pwd를 변경
		m.setPwd(encPwd);

		int result = mService.updateMember(m);

		if (result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "회원정보 수정 실패!");
			return "common/errorPage";
		}
	}

	// 탈퇴하기
	@RequestMapping("mdelete.do")
	public String memeberDelete(SessionStatus status, @RequestParam("id") String id, Model model) {

		int result = mService.deleteMember(id);

		if (result > 0) {
			return "redirect:logout.do";
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}

	}

	// 아이디 찾기
	@RequestMapping(value = "findid.do", method = RequestMethod.POST)
	public ModelAndView memberFindId(Model model, @RequestParam("email") String email) {
		ModelAndView mav = new ModelAndView();
		String memberid = mService.findId(email);
		System.out.println(memberid);

		if (memberid != null) {
			mav.addObject("id", memberid);
			mav.setViewName("member/findIdForm");

		} else {
			mav.setViewName("common/errorPage");
			mav.addObject("msg", "이메일이 존재하지 않습니다.");

		}
		return mav;
	}
}
