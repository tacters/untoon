package com.untoon.clss.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.untoon.clss.model.service.ClssService;
import com.untoon.clss.model.vo.Clss;
import com.untoon.member.model.vo.Member;

@Controller
public class ClssController {
	@Autowired
	private ClssService cService;

	// 사용자 클래스 목록조회
	@RequestMapping("clist.do")
	public String clssListMethod(Model model) {

		ArrayList<Clss> list = cService.clssList();

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "clss/clssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 클래스 상세보기
	@RequestMapping("cdetail.do")
	public String selectClssMethod(HttpSession session, @RequestParam("cid") int cid, Model model) {

		Clss clss = cService.selectClss(cid);

		// 조회수 처리
		int result = cService.addViewCount(cid);
		if (clss != null) {
			System.out.println("값있음");
			model.addAttribute("clss", clss);
			return "clss/clssDetailView";
		} else {
			System.out.println("값없음");
			model.addAttribute("msg", "강사 상세보기 실패");
			return "common/errorPage";
		}

	}

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

	// 강사 마이페이지(나중에 지워야함)
	@RequestMapping("teacherInfo.do")
	public String teacherInfoView() {
		return "teacher/teacherPage";
	}

	// 강사 클래스등록 페이지로 이동
	@RequestMapping("tinsert.do")
	public String moveUpdateClss() {
		return "teacher/teacherInsertClss";
	}

	// 강사 클래스 등록하기
	@RequestMapping(value = "tcinsert.do", method = RequestMethod.POST)
	public String insertTclss(Clss clss, HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile, HttpSession session) {

		/*
		 * Member loginUser = (Member) session.getAttribute("loginUser");
		 * System.out.println(loginUser);
		 */
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/clss_files");

		// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
		// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자' 형식으로 바꾸어 저장함
		if (mfile != null) {
			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				clss.setClss_original_filename(fileName); // 원래 파일명 저장하고

				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));

				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
				clss.setClss_rename_filename(renameFileName);
			}
		}
		if (cService.insertTclss(clss) > 0) {
			return "teacher/teacherPage";
		} else {
			model.addAttribute("msg", "클래스 등록 실패");
			return "common/errorPage";
		}
	}

	// 강사 클래스 상세 보기
	@RequestMapping("tcdetail.do")
	public String selectTclssMethod(@RequestParam("cid") int cid, Model model) {
//		HttpSession session
		Clss clss = cService.selectTclss(cid);

		if (clss != null) {
			System.out.println("값있음");
			model.addAttribute("clss", clss);
			return "clss/clssDetailView";
		} else {
			System.out.println("값없음");
			model.addAttribute("msg", "강사 상세보기 실패");
			return "common/errorPage";
		}
	}

	// 강사 클래스 수정하기 페이지로 이동
	@RequestMapping(value = "tupmove.do")
	public String moveUpdateForm(@RequestParam("cid") int cid, Model model) {

		Clss clss = cService.selectClss(cid);

		if (clss != null) {
			model.addAttribute("clss", clss);
			return "teacher/teacherUpdateClss";
		} else {
			model.addAttribute("msg", "수정 페이지 이동 실패");
			return "common/errorPage";
		}

	}

	// 강사 클래스 수정하기
	@RequestMapping(value = "tcupdate.do", method = RequestMethod.POST)
	public String tUpdateClss(Clss clss, Model model, HttpServletRequest request,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

		// 첨부된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/clss_files");
		System.out.println(mfile);
		// 새로운 첨부파일이 있따면
		if (mfile != null) {
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			if (fileName != null && fileName.length() > 0) {
				// 첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())); // System = 자바가 구동되는 컴퓨터
				renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1); // 파일이름의 끝의 그 다음 1자리에

				try {
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송 파일 저장 실패");
					return "common/errorPage";
				}
			} // 첨부된 파일의 파일명 변경에서 폴더에 저장 처리

			// 원래 첨부파일이 있는데 바뀐경우
			if (clss.getClss_original_filename() != null) {
				// 원래 파일을 폴더에서 삭제 처리
				new File(savePath + "\\" + clss.getClss_original_filename()).delete();
			}

			clss.setClss_original_filename(fileName);
			clss.setClss_rename_filename(renameFileName);
		}

		if (cService.tUpdateClss(clss) > 0) {
			System.out.println(clss);
			return "redirect:tclist.do";
		} else {
			model.addAttribute("msg", clss.getCid() + "번 클래스 수정 실패");
			return "common/errorPage";
		}
	}

	// 관리자 미승인 클래스 목록조회
	@RequestMapping("adnclist.do")
	public String adminNlist(Model model) {
		ArrayList<Clss> list = cService.adminNlist();

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "admin/adminNlistView"; // 수정필요
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 승인 클래스 목록조회
	@RequestMapping("adclist.do")
	public String adminYList(Model model) {
		ArrayList<Clss> list = cService.adminYList();

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "admin/adminYlistView"; // 수정필요
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 승인거부 클래스 목록조회
	@RequestMapping("adrclist.do")
	public String adminRlist(Model model) {
		ArrayList<Clss> list = cService.adminRlist();

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "admin/adminRlistView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 기간 지난 클래스 목록조회
	@RequestMapping("adendclist.do")
	public String adminEndList(Model model) {
		ArrayList<Clss> list = cService.adminEndList();

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "admin/adminEndListView"; // 수정필요
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 클래스 상세보기
	@RequestMapping("adcdetail.do")
	public String adminSelectClss(@RequestParam("cid") int cid, Model model) {

		Clss clss = cService.adminSelectClss(cid);

		if (clss != null) {
			System.out.println("조회성공");
			model.addAttribute("clss", clss);
			return "clss/clssDetailView";
		} else {
			model.addAttribute("msg", cid + "번 클래스 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 클래스 승인하기
	@RequestMapping("approve.do")
	public String adminApproveClss(@RequestParam("cid") int cid, Model model) {

		int result = cService.adminApproveClss(cid);
		System.out.println(result);

		if (result > 0) {
			return "redirect:adnclist.do";
		} else {
			model.addAttribute("msg", cid + "번 클래스 승인 실패");
			return "common/errorPage";
		}
	}

	// 관리자 클래스 거부하기
//	@RequestMapping("deny.do")
//	public String adminDenyClss(@RequestParam("cid") int cid, Model model) {
//		
//		int result = cService.adminDenyClss(cid);
//		System.out.println(result);
//		
//		if(result > 0) {
//			return "redirect:adnclist.do";
//		}else {
//			model.addAttribute("msg", cid + "번 클래스 승인 실패");
//			return "common/errorPage";
//		}
//	}
	@RequestMapping("deny.do")
	public String adminDenyClss(Clss clss, Model model) {

		System.out.println(clss);

		if (cService.adminDenyClss(clss) > 0) {
			System.out.println("값o");
			System.out.println(clss);
			return "redirect:adnclist.do";
		} else {
			System.out.println("값x");
			model.addAttribute("msg", "클래스 승인 실패");
			return "common/errorPage";
		}
	}

	// 관리자 클래스 삭제하기
	@RequestMapping("adcdelete.do")
	public String adminDelectClss(Model model, @RequestParam("cid") int cid) {
		if (cService.adminDeleteClss(cid) > 0) {
			return "redirect:adrclist.do";
		} else {
			model.addAttribute("msg", "클래스 삭제 실패");
			return "common/errorPage";
		}
	}

	// 사용자 마이페이지에 본인 클래스 목록 불러오기
	@RequestMapping("mclss.do")
	public String myClssList(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
//			Member loginUser = (Member)session.getAttribute("id");
//			String id = (String)session.getAttribute("id");
		String id = loginUser.getId();
		System.out.println(id);
		ArrayList<Clss> myList = cService.myClssList(id);
		System.out.println("myList : " + myList);

		if (myList.size() > 0) {
			System.out.println("값o");
			model.addAttribute("myList", myList);
			return "member/myClssListView";
		} else {
			model.addAttribute("msg", "나의 클래스 조회 실패");
			return "common/errorPage";
		}
	}

}