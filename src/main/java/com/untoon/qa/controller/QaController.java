package com.untoon.qa.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.untoon.qa.model.service.QaService;
import com.untoon.qa.model.vo.QA;

@Controller
public class QaController {
	@Autowired
	private QaService qaService;
	
	@RequestMapping(value="qinsert.do", method = RequestMethod.POST)
	public String insertQa(QA qa, Model model) {
		if (qaService.insertQa(qa) > 0) {
			return "redirect:cdetail.do?cid=" + qa.getCid();
		} else {
			model.addAttribute("msg", qa.getCid() + "번 클래스에 대한  문의사항 등록 실패.");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="qupdate.do", method=RequestMethod.POST)
	public String updateQa(QA qa, @RequestParam("cid") int cid, Model model) {
			if(qaService.updateQa(qa)>0) {
				return "redirect:cdetail.do?cid=" + cid;
			} else {
				model.addAttribute("msg", qa.getQid() + "번 문의사항 등록 실패..");
				return "common/errorPage";
			}
	}
	
	@RequestMapping("qdelete.do")
	public String deleteQa(@RequestParam("qid") int qid, 
																@RequestParam("cid") int cid, Model model) {
		if(qaService.deleteQa(qid) > 0) {
					return "redirect: cdetail.do?cid=" + cid;
		} else {
			model.addAttribute("msg", "문의사항 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
	// ajax 로 원글에 대한 댓글 조회 요청 처리용
		@RequestMapping(value = "qlist.do", method = RequestMethod.POST)
		@ResponseBody
		public String replyListMethod(@RequestParam("cid") int cid) throws UnsupportedEncodingException {
			// 원글에 대한 댓글 조회 요청
			ArrayList<QA> list = qaService.selectQaList(cid);

			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			// list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();

			// list 를 jarr 로 옮기기(복사)
			for (QA qa : list) {
				// qa 의 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();

				job.put("qid", qa.getQid());
				job.put("qwriter", qa.getQwriter());
				job.put("qcontent", URLEncoder.encode(qa.getQcontent(), "utf-8"));
				job.put("q_modify_date", qa.getQ_modify_date().toString());
				job.put("cid", qa.getCid());

				// job 를 jarr 에 저장
				jarr.add(job);
			}

			// 전송용 json 객체에 jarr 담음
			sendJson.put("list", jarr);

			return sendJson.toJSONString(); // jsonView 가 리턴됨
		}
	
	
	
}// QaController
