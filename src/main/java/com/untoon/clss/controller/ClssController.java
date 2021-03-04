package com.untoon.clss.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.untoon.common.SearchAndPage;
import com.untoon.member.model.vo.Member;
import com.untoon.member.model.vo.PayMember;
import com.untoon.save.model.vo.SaveClss;

import net.sf.json.JSONArray;

@Controller
public class ClssController {
	@Autowired
	private ClssService cService;

	// 사용자 전체 클래스 목록조회
	@RequestMapping("clist.do")
	public String clssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.clssAList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getAListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/clssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 뷰티/헬스 클래스 목록조회
	@RequestMapping("bclist.do")
	public String aclssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.clssList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/bclssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 미술/공예 클래스 목록조회
	@RequestMapping("aclist.do")
	public String bclssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.aclssList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getArtCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/aclssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 언어 클래스 목록조회
	@RequestMapping("lclist.do")
	public String lclssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.lclssList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getLanguageCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/lclssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 머니 클래스 목록조회
	@RequestMapping("fclist.do")
	public String fclssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.fclssList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getFinanceCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/fclssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 데이터 클래스 목록조회
	@RequestMapping("dclist.do")
	public String dclssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.dclssList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getDataCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/dclssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 사용자 기타 클래스 목록조회
	@RequestMapping("oclist.do")
	public String oclssListMethod(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.oclssList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getOtherCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "clss/oclssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", currentPage + "강의 목록 조회 실패");
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
		System.out.println(loginUser);

		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			return "teacher/teacherClssListView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 강사 마이페이지
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

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/clss_files");

		System.out.println(mfile);
		// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
		// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자' 형식으로 바꾸어 저장함
		if (mfile != null) {
			System.out.println(mfile);
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
				System.out.println(renameFileName);
			}
		}
		if (cService.insertTclss(clss) > 0) {
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "클래스 등록 실패");
			return "common/errorPage";
		}
	}

	// 강사

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

	// 강사 클래스 상세보기에서 본인 회원 수강한 회원 정보 보기
	@RequestMapping("checkEnroll.do")
	public String teacherEnrolled(Model model, @RequestParam("cid") int cid) {
		ArrayList<PayMember> list = cService.teacherEnrolled(cid);
		System.out.println(list);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "teacher/teacherEnroll";
		} else {
			model.addAttribute("msg", "수강한 회원이 없습니다.");
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
	// 관리자 페이지
//	@RequestMapping("adpage.do")
//	public String adminPage() {
//		return "admin/adminPage";
//	}

	// 관리자 미승인 클래스 목록조회
	@RequestMapping("adnclist.do")
	public String adminNlist(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.adminNlist(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getAdminNListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;
		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "admin/adminNlistView"; // 수정필요
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록이 없습니다.");
			return "common/errorPage";
		}
	}

	// 관리자 미승인 클래스 ajax
//	@RequestMapping(value = "adnclist.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String adminNlist(HttpServletResponse response, HttpSession session, Model model)
//			throws UnsupportedEncodingException {
//		ArrayList<Clss> list = cService.adminNlist();
//
//		System.out.println(list);
//
//		JSONObject sendJson = new JSONObject();
//		JSONArray jarr = new JSONArray();
//
//		for (Clss clss : list) {
//
//			JSONObject job = new JSONObject();
//
//			job.put("cid", clss.getCid());
//			job.put("clss_title", URLEncoder.encode(clss.getClss_title(), "utf-8"));
//			job.put("tchr_id", URLEncoder.encode(clss.getTchr_id(), "utf-8"));
//			job.put("clss_start", clss.getClss_start().toString());
//			job.put("clss_end", clss.getClss_end().toString());
//
//			jarr.add(job);
//		}
//
//		sendJson.put("list", jarr);
//
//		return sendJson.toJSONString();
//	}

	// 관리자 승인 클래스 목록조회
	@RequestMapping("adclist.do")
	public String adminYList(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.adminYList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getAdminYListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "admin/adminYlistView"; // 수정필요
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 승인 클래스 목록조회 ajax
//	@RequestMapping(value = "adclist.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String adminYList(HttpServletResponse response, HttpSession session, Model model)
//			throws UnsupportedEncodingException {
//		ArrayList<Clss> list = cService.adminYList();
//
//		System.out.println(list);
//
//		JSONObject sendJson = new JSONObject();
//		JSONArray jarr = new JSONArray();
//
//		for (Clss clss : list) {
//
//			JSONObject job = new JSONObject();
//
//			job.put("cid", clss.getCid());
//			job.put("clss_title", URLEncoder.encode(clss.getClss_title(), "utf-8"));
//			job.put("tchr_id", URLEncoder.encode(clss.getTchr_id(), "utf-8"));
//			job.put("clss_start", clss.getClss_start().toString());
//			job.put("clss_end", clss.getClss_end().toString());
//
//			jarr.add(job);
//		}
//
//		sendJson.put("list", jarr);
//
//		return sendJson.toJSONString();
//	}

	// 관리자 승인거부 클래스 목록조회
	@RequestMapping("adrclist.do")
	public String adminRlist(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.adminRlist(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getAdminRListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "admin/adminRlistView";
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "목록이 없습니다.");
			return "common/errorPage";
		}
	}

	// 관리자 승인거부 목록조회 ajax
//	@RequestMapping(value = "adrclist.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String adminRlist(HttpServletResponse response, HttpSession session, Model model)
//			throws UnsupportedEncodingException {
//		ArrayList<Clss> list = cService.adminRlist();
//
//		System.out.println(list);
//
//		JSONObject sendJson = new JSONObject();
//		JSONArray jarr = new JSONArray();
//
//		for (Clss clss : list) {
//
//			JSONObject job = new JSONObject();
//
//			job.put("cid", clss.getCid());
//			job.put("clss_title", URLEncoder.encode(clss.getClss_title(), "utf-8"));
//			job.put("tchr_id", URLEncoder.encode(clss.getTchr_id(), "utf-8"));
//			job.put("clss_start", clss.getClss_start().toString());
//			job.put("clss_end", clss.getClss_end().toString());
//
//			jarr.add(job);
//		}
//
//		sendJson.put("list", jarr);
//
//		return sendJson.toJSONString();
//	}

	// 관리자 기간 지난 클래스 목록조회
	@RequestMapping("adendclist.do")
	public String adminEndList(@RequestParam("page") int currentPage, Model model) {
		int limit = 10;
		ArrayList<Clss> list = cService.adminEndList(currentPage, limit);

		// 페이지 처리와 관련된 값 처리
		// 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = cService.getAdminEListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		System.out.println(list);
		if (list.size() > 0) {
			System.out.println("목록있음");
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "admin/adminEndListView"; // 수정필요
		} else {
			System.out.println("목록없음");
			model.addAttribute("msg", "강의 목록 조회 실패");
			return "common/errorPage";
		}
	}

	// 관리자 기간 지난 클래스 목록조회 ajax
//	@RequestMapping(value = "adendclist.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String adminEndList(HttpServletResponse response, HttpSession session, Model model)
//			throws UnsupportedEncodingException {
//		ArrayList<Clss> list = cService.adminEndList();
//
//		System.out.println(list);
//
//		JSONObject sendJson = new JSONObject();
//		JSONArray jarr = new JSONArray();
//
//		for (Clss clss : list) {
//
//			JSONObject job = new JSONObject();
//
//			job.put("cid", clss.getCid());
//			job.put("clss_title", URLEncoder.encode(clss.getClss_title(), "utf-8"));
//			job.put("tchr_id", URLEncoder.encode(clss.getTchr_id(), "utf-8"));
//			job.put("clss_start", clss.getClss_start().toString());
//			job.put("clss_end", clss.getClss_end().toString());
//
//			jarr.add(job);
//		}
//
//		sendJson.put("list", jarr);
//
//		return sendJson.toJSONString();
//	}

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
			return "redirect:adnclist.do?page=1";
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
			return "redirect:adnclist.do?page=1";
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
			return "redirect:adnclist.do?page=1";
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
	
	// 사용자 마이페이지에 찜한 목록 불러오기
	@RequestMapping("mlike.do")
	public String mlike(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String id = loginUser.getId();
		System.out.println(id);
		
		ArrayList<> list = cService.mlike(id);
			
		
	}

//	@RequestMapping(value="mclss.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String myClssList(HttpServletResponse response, HttpSession session, Model model) throws UnsupportedEncodingException {
//		Member loginUser = (Member) session.getAttribute("loginUser");
//		String id = loginUser.getId();
//		System.out.println(id);
//		ArrayList<Clss> myList = cService.myClssList(id);
//		
//		System.out.println(myList);
//		
//		JSONObject sendJson = new JSONObject();
//		JSONArray jarr = new JSONArray();
//		
//		for (Clss clss : myList){
//			
//			JSONObject job = new JSONObject();
//			
//			job.put("cid", clss.getCid());
//			job.put("clss_title", URLEncoder.encode(clss.getClss_title(), "utf-8"));
//			job.put("tchr_id", URLEncoder.encode(clss.getTchr_id(), "utf-8"));
//			job.put("clss_start", clss.getClss_start().toString());
//			job.put("clss_end", clss.getClss_end().toString());
//			
//			jarr.add(job);
//		}
//		
//		sendJson.put("myList", jarr);
//		
//		return sendJson.toJSONString();
//	}

	// 제목으로 검색
	@RequestMapping(value = "csearchTitle.do", method = RequestMethod.POST)
	public String csearchTitle(@RequestParam("keyword") String keyword, @RequestParam("page") int currentPage,
			Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Clss> list = cService.searchTitle(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = cService.getSearchTitleListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("keyword", keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "csearchTitle.do");
			model.addAttribute("keyword", keyword);
			return "redirect:clist.do";
		} else {
			model.addAttribute("msg", keyword + "로 검색한 결과가 없습니다.");
			return "common/errorPage";
		}

	}

	// 태그로 검색
	@RequestMapping(value = "csearchTag.do", method = RequestMethod.POST)
	public String cSearchTag(@RequestParam("keyword") String keyword, @RequestParam("page") int currentPage,
			Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Clss> list = cService.searchTag(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = cService.getSearchTagListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("keyword", keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "csearchTag.do");
			model.addAttribute("keyword", keyword);
			return "redirect:clist.do";
		} else {
			model.addAttribute("msg", keyword + "로 검색한 결과가 없습니다.");
			return "common/errorPage";
		}

	}

	// 강사이름으로 검색
	@RequestMapping(value = "csearchTeacher.do", method = RequestMethod.POST)
	public String cSearchTeacher(@RequestParam("keyword") String keyword, @RequestParam("page") int currentPage,
			Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Clss> list = cService.searchTeacher(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = cService.getSearchTeacherListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("keyword", keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "csearchTeacher.do");
			model.addAttribute("keyword", keyword);
			return "redirect:clist.do";
		} else {
			model.addAttribute("msg", keyword + "로 검색한 결과가 없습니다.");
			return "common/errorPage";
		}

	}

	// 카테고리로 검색
	@RequestMapping(value = "csearchCategory.do", method = RequestMethod.POST)
	public String cSearchCategory(@RequestParam("keyword") String keyword, @RequestParam("page") int currentPage,
			Model model) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int limit = 10;
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;

		SearchAndPage searches = new SearchAndPage();
		searches.setKeyword(keyword);
		searches.setStartRow(startRow);
		searches.setEndRow(endRow);

		ArrayList<Clss> list = cService.searchCategory(searches);

		// 페이지 처리와 관련된 값 처리
		// 검색에 대한 총 페이지 계산을 위한 검색결과 총 목록 갯수 조회
		int listCount = cService.getSearchCategoryListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
		// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
		int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
		int endPage = startPage + 9;

		if (maxPage < endPage)
			endPage = maxPage;

		if (list.size() > 0) {
			model.addAttribute("keyword", keyword);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("action", "csearchCategory.do");
			model.addAttribute("keyword", keyword);
			return "redirect:clist.do";
		} else {
			model.addAttribute("msg", keyword + "로 검색한 결과가 없습니다.");
			return "common/errorPage";
		}

	}

	// 클래스 찜하기 1 추가용 ADD
//	@RequestMapping("addClssSave.do")
//	public Clss addClssSave(@RequestParam("cid") int cid, Model model) {
//		Clss clss = cService.selectClss(cid);
//		int result = cService.addClssSave(cid);
//		if (clss != null && result > 0) {
//			model.addAttribute("clss", clss);
//			return clss;
//		} else {
//			return clss;
//		}
//	}

	// 클래스 찜하기 1 추가용 ADD ajax
	@RequestMapping(value = "addClssSave.do", method = RequestMethod.POST)
	@ResponseBody
	public String addClssSave(@RequestParam("cid") int cid, Model model) throws UnsupportedEncodingException {

		int result = cService.addClssSave(cid);
		System.out.println("result : " + result);

		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();

		//sendJson.addProperty("result", result);
		sendJson.put("cid", cid);

		// 전송용 json 객체에 jarr 담음
		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}

	// 클래스 찜하기 1 삭제용 DELETE
//	@RequestMapping("delClssSave.do")
//	public Clss delClssSave(@RequestParam("cid") int cid, Model model) {
//		Clss clss = cService.selectClss(cid);
//		int result = cService.delClssSave(cid);
//		if (clss != null && result > 0) {
//			model.addAttribute("clss", clss);
//			return clss;
//		} else {
//			return clss;
//		}
//	}
	// 클래스 찜하기 1 삭제용
	@RequestMapping(value = "delClssSave.do", method = RequestMethod.POST)
	@ResponseBody
	public String delClssSave(@RequestParam("cid") int cid, Model model) throws UnsupportedEncodingException {

		int result = cService.delClssSave(cid);
		System.out.println("result : " + result);

		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();

		//sendJson.addProperty("result", result);
		sendJson.put("cid", cid);

		// 전송용 json 객체에 jarr 담음
		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}

}