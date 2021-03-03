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

import com.untoon.save.model.service.SaveClssService;
import com.untoon.save.model.vo.SaveClss;

@Controller
public class SaveController {
	
	@Autowired
	private SaveClssService scService;
	
	// ajax 로 클래스 상세보기에서 loginUser "찜하기 / 좋아요" 조회 요청 처리용
	@RequestMapping(value="scCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String scCheck(@RequestParam("cid") int cid, 
									  @RequestParam("id") int id) 
									throws UnsupportedEncodingException {
		
		// 사용자의  "찜하기 / 좋아요" 목록
		ArrayList<SaveClss> sclist = scService.selectPersonalSave(id);
		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// 객체 를 jarr 로 옮기기(복사)
		for (SaveClss sc : sclist ) {
			if (sc.getCid() == cid) { // 사용자의 "찜하기 / 좋아요" 목록중에 지금 상세보기의 CID가 있으면
				
				// SaveClss 의 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				job.put("cid", sc.getCid());
				job.put("id", sc.getId());
				job.put("clss_category", sc.getClss_category());
				
				// job 를 jarr 에 저장
				jarr.add(job);
			}
		}
		// 전송용 json 객체에 jarr 담음
		sendJson.put("sclist", jarr);
		return sendJson.toJSONString(); // jsonView 가 리턴됨
		}
		
	
	
	@RequestMapping(value="scinsert.do", method = RequestMethod.POST)
	public String scInsert(SaveClss sc , Model model) {
		if(scService.insertSC(sc)>0) {
			return "redirect:cdetail.do?cid="+sc.getCid();
		} else {
			model.addAttribute("msg", sc.getId() + " 택터즈님의 "+ sc.getCid()+" 찜하기 실패");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("scdelete.do")
	public String scDelete( SaveClss sc, Model model) {
				if(scService.deleteSC(sc)>0) {
					return "redirect:cdetail.do?cid="+sc.getCid();
				} else {
					model.addAttribute("msg", sc.getId() + " 택터즈님의 "+ sc.getCid()+" 찜하기 취소 실패");
					return "common/errorPage";
				}
		}



	
	
	
	
	//ajax 로		좋아요가 가장 많은 8개 CLSS		 조회 요청 처리용
		@RequestMapping(value="scTop8.do", method=RequestMethod.POST)
		@ResponseBody
		public String selectTop8(HttpServletResponse response) throws UnsupportedEncodingException {
			//좋아요가 가장 많은 8개 CLSS 조회해 옴
			ArrayList<SaveClss> sclist = scService.selectTop8();
			
			//전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			//list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();
			
			//list 를 jarr 로 옮기기(복사)
			for(SaveClss sc : sclist) {
				// 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				job.put("cid", sc.getCid());
				job.put("id", sc.getId());
				job.put("clss_category", sc.getClss_category());
				
				//job 를 jarr 에 저장
				jarr.add(job);
			}
			
			//전송용 json 객체에 jarr 담음
			sendJson.put("sclist", jarr);
			
			return sendJson.toJSONString();  //jsonView 가 리턴됨
		}	
		
	
		
		//ajax 로		찾는 카테고리에 가장 인기 많은 수업 순		 조회 요청 처리용
		@RequestMapping(value="scCategory.do", method=RequestMethod.POST)
		@ResponseBody
		public String selectCategory(@RequestParam("clss_category") String clss_category,
													HttpServletResponse response) throws UnsupportedEncodingException {
			//좋아요가 가장 많은 8개 CLSS 조회해 옴
			ArrayList<SaveClss> sclist = scService.selectCategory(clss_category);
			
			//전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			//list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();
			
			//list 를 jarr 로 옮기기(복사)
			for(SaveClss sc : sclist) {
				// 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				job.put("cid", sc.getCid());
				job.put("id", sc.getId());
				job.put("clss_category", sc.getClss_category());
				
				//job 를 jarr 에 저장
				jarr.add(job);
			}
			
			//전송용 json 객체에 jarr 담음
			sendJson.put("sclist", jarr);
			
			return sendJson.toJSONString();  //jsonView 가 리턴됨
		}	
		
		
		
		
	//	SELECT ALL 개인이 좋아요한 수업 리스트
		@RequestMapping ("sclist.do")
		public String selectPersonalSave(@RequestParam("id") int id, Model model) {
			ArrayList<SaveClss> sclist = scService.selectPersonalSave(id);
			if (sclist.size()>0) {
				model.addAttribute("sclist", sclist);
				return "member/mySaveClssView";
			} else {
				model.addAttribute("msg", "찜한 클래스 목록 조회 실패");
				return "common/errorPage";
			}
		}
	
	
	
}