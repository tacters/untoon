package com.untoon.save.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.untoon.clss.model.service.ClssService;
import com.untoon.clss.model.vo.Clss;
import com.untoon.save.model.service.SaveClssService;
import com.untoon.save.model.vo.SaveClss;

@Controller
public class SaveController {

	@Autowired
	private SaveClssService scService;
	
	@Autowired
	private ClssService cService;

	// ajax 로 클래스 상세보기에서 loginUser "찜하기 / 좋아요" 조회 요청 처리용
//	@RequestMapping(value = "scCheck.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String scCheck(@RequestParam("cid") int cid, @RequestParam("id") String id,HttpServletResponse response)
//			throws UnsupportedEncodingException {
//
//		// 사용자의 "찜하기 / 좋아요" 목록
//		ArrayList<SaveClss> sclist = scService.selectPersonalSave(cid);
//		System.out.println(" sclist :" + sclist);
//		
//
//		// 전송용 json 객체 준비
//		JSONObject sendJson = new JSONObject();
//		
//		sendJson.put("cid", cid);
//		sendJson.put("id", id);
//		//sendJson.put("category", clss_category);
//		
//	//	response.setContentType("application/json; charset=utf-8");
//
//		return sendJson.toJSONString(); // jsonView 가 리턴됨
//	}

	// ajax 로 클래스 상세보기에서 loginUser "찜하기 / 좋아요" 조회 요청 처리용 from Bo
	@RequestMapping(value = "scCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String scCheck(@RequestParam("cid") int cid, @RequestParam("id") String id)
			throws UnsupportedEncodingException {

		// 사용자의 "찜하기 / 좋아요" 목록
		ArrayList<SaveClss> sclist = scService.selectPersonalSave(id);
		System.out.println(" sclist :" + sclist);

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// 객체 를 jarr 로 옮기기(복사)
		for (SaveClss sc : sclist) {
			//if (sc.getCid() == cid && sc.getId() == id) { // 사용자의 "찜하기 / 좋아요" 목록중에 지금 상세보기의 CID가 있으면

				// SaveClss 의 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				job.put("cid", sc.getCid());
				job.put("id", sc.getId());
				//job.put("clss_category", sc.getClss_category());

				// job 를 jarr 에 저장
				jarr.add(job);
				System.out.println("job : " + job);
			//}
		}
		// 전송용 json 객체에 jarr 담음
		sendJson.put("sclist", jarr);
		System.out.println(sendJson);
		System.out.println(sclist);
		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}
	
	// ajax 로 클래스 상세보기에서 loginUser "찜하기 / 좋아요" 조회 요청 처리용 수정본
//	@RequestMapping(value = "scCheck.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String scCheck(SaveClss sc) throws UnsupportedEncodingException {
//
//		// 사용자의 "찜하기 / 좋아요" 목록
//		ArrayList<SaveClss> sclist = scService.selectPersonalSave(sc);
//		System.out.println(" sclist :" + sclist);
//
//		if(sclist.size() == 0) {
//			
//		}
//		// 전송용 json 객체 준비
//		JSONObject sendJson = new JSONObject();
//		// list 옮길 json 배열 준비
//		//JSONArray jarr = new JSONArray();
//		
//		sendJson.put("cid", cid);
//
//		// 객체 를 jarr 로 옮기기(복사)
//		for (SaveClss sc : sclist) {
//			//if (sc.getCid() == cid && sc.getId() == id) { // 사용자의 "찜하기 / 좋아요" 목록중에 지금 상세보기의 CID가 있으면
//
//				// SaveClss 의 필드값 저장할 json 객체 생성
//				JSONObject job = new JSONObject();
//				job.put("cid", sc.getCid());
//				job.put("id", sc.getId());
//				job.put("clss_category", sc.getClss_category());
//
//				// job 를 jarr 에 저장
//				jarr.add(job);
//				System.out.println("job : " + job);
//			//}
//		}
//		// 전송용 json 객체에 jarr 담음
//		sendJson.put("sclist", jarr);
//		System.out.println(sendJson);
//		System.out.println(sclist);
//		return sendJson.toJSONString(); // jsonView 가 리턴됨
//	}

//	@RequestMapping(value = "scinsert.do", method = RequestMethod.POST)
//	public String scInsert(SaveClss sc, Model model) {
//		if (scService.insertSC(sc) > 0) {
//			return "redirect:cdetail.do?cid="; /* + sc.getCid(); */
//		} else {
//			model.addAttribute("msg", sc.getId() + " 택터즈님의 " + sc.getCid() + " 찜하기 실패");
//			return "common/errorPage";
//		}
//	}
	
	@RequestMapping(value = "scinsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String scInsert(SaveClss sc, Model model)
			throws UnsupportedEncodingException {
		

		int result = scService.insertSC(sc);
		
		System.out.println(result);
		
		int cid = sc.getCid();
		String id = sc.getId();
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		
		
		sendJson.put("cid", sc.getCid());
		sendJson.put("id", sc.getId());

		// 전송용 json 객체에 jarr 담음
		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}
//
//	@RequestMapping("scdelete.do")
//	public String scDelete(SaveClss sc, Model model) {
//		if (scService.deleteSC(sc) > 0) {
//			return "redirect:cdetail.do?cid=" + sc.getCid();
//		} else {
//			model.addAttribute("msg", sc.getId() + " 택터즈님의 " + sc.getCid() + " 찜하기 취소 실패");
//			return "common/errorPage";
//		}
//	}
	
	@RequestMapping(value = "scdelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String scDelete(SaveClss sc, Model model)
			throws UnsupportedEncodingException {
		

		int result = scService.deleteSC(sc);
		
		System.out.println(result);
		
		int cid = sc.getCid();
		String id = sc.getId();
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		
	//	sendJson.addProperty("cid");
		
		sendJson.put("cid", sc.getCid());
		sendJson.put("id", sc.getId());

		// 전송용 json 객체에 jarr 담음
		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}

	
	// ajax 로 좋아요가 가장 많은 8개 CLSS 조회 요청 처리용
	@RequestMapping(value = "scTop8.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectTop8(HttpServletResponse response) throws UnsupportedEncodingException {
		// 좋아요가 가장 많은 8개 CLSS 조회해 옴
		ArrayList<SaveClss> sclist = scService.selectTop8();
		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (SaveClss sc : sclist) {
			
			Clss clss = cService.selectClss(sc.getCid());
			System.out.println("클래스 # : " + clss.getCid());			
			
			// 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("cid", sc.getCid());
			job.put("id", sc.getId());
			job.put("clss_category", sc.getClss_category());
			
			job.put("clss_rename_filename", clss.getClss_rename_filename());               // Clss table join
			System.out.println("클래스 사진파일명 : " + clss.getClss_rename_filename());			
			
			job.put("clss_title", URLEncoder.encode(clss.getClss_title(), "utf-8"));
			System.out.println("클래스 타이틀 : " + clss.getClss_title());			
			
			job.put("tchr_id", clss.getTchr_id());
			System.out.println("클래스 강사명 : " + clss.getTchr_id());	
			

			// job 를 jarr 에 저장
			jarr.add(job);
		}

		// 전송용 json 객체에 jarr 담음
		sendJson.put("sclist", jarr);

		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}

	// ajax 로 찾는 카테고리에 가장 인기 많은 수업 순 조회 요청 처리용
	@RequestMapping(value = "scCategory.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectCategory(@RequestParam("clss_category") String clss_category, HttpServletResponse response)
			throws UnsupportedEncodingException {
		// 좋아요가 가장 많은 8개 CLSS 조회해 옴
		ArrayList<SaveClss> sclist = scService.selectCategory(clss_category);

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (SaveClss sc : sclist) {
			// 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			job.put("cid", sc.getCid());
			job.put("id", sc.getId());
			job.put("clss_category", sc.getClss_category());

			// job 를 jarr 에 저장
			jarr.add(job);
		}

		// 전송용 json 객체에 jarr 담음
		sendJson.put("sclist", jarr);

		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}

	// SELECT ALL 개인이 좋아요한 수업 리스트
//	@RequestMapping("sclist.do")
//	public String selectPersonalSave(@RequestParam("id") int id, Model model) {
//		ArrayList<SaveClss> sclist = scService.selectPersonalSave(id);
//		if (sclist.size() > 0) {
//			model.addAttribute("sclist", sclist);
//			return "member/mySaveClssView";
//		} else {
//			model.addAttribute("msg", "찜한 클래스 목록 조회 실패");
//			return "common/errorPage";
//		}
//	}

}