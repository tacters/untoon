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

import com.untoon.qa.model.service.QaReplyService;
import com.untoon.qa.model.vo.QA;
import com.untoon.qa.model.vo.QaReply;

@Controller
public class QaReplyController {
	@Autowired
	private QaReplyService qaReplyService;

	@RequestMapping(value = "qainsert.do", method = RequestMethod.POST) // cid 도 추가?
	public String insertQaReply(QaReply qaReply, Model model) {
		
		if (qaReplyService.insertQaReply(qaReply) > 0) {
			return "redirect:{ pageContext.request.contextPath }/clist.do";
			//return "redirect:cdetail.do?cid=" + QA.getCid();		// QA private static int cid; 게터 세터 다 static으로 바꿔줬음
		} else {
			model.addAttribute("msg", qaReply.getRef_qid() + "번 글에 대한 댓글달기 실패.");
			return "common/errorPage";
		}
	}

	// ajax 로 원글에 대한 댓글 조회 요청 처리용
	@RequestMapping(value = "qalist.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectQaReplyList(@RequestParam("ref_qid") int ref_qid) throws UnsupportedEncodingException {
		// 원글에 대한 댓글 조회 요청
		ArrayList<QaReply> list = qaReplyService.selectQaReplyList(ref_qid);

		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();

		// list 를 jarr 로 옮기기(복사)
		for (QaReply qaReply : list) {
			// qaReply 의 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("qaid", qaReply.getQaid());
			job.put("qawriter", qaReply.getQawriter());
			job.put("qacontent", URLEncoder.encode(qaReply.getQacontent(), "utf-8"));
			job.put("qa_modify_date", qaReply.getQa_modify_date().toString());
			job.put("ref_qid", qaReply.getRef_qid());

			// job 를 jarr 에 저장
			jarr.add(job);
		}

		// 전송용 json 객체에 jarr 담음
		sendJson.put("list", jarr);

		return sendJson.toJSONString(); // jsonView 가 리턴됨
	}
	
	
	@RequestMapping("qadelete.do")
	public String deleteQaReply(@RequestParam("qaid") int qaid, 
													 @RequestParam("cid") int cid, Model model) {
		if(qaReplyService.deleteQaReply(qaid) > 0) {
					return "redirect:cdetail.do?cid=" + cid;
		} else {
			model.addAttribute("msg", "댓글 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="qaupdate.do", method=RequestMethod.POST)
	public String updateQaReply(QaReply qaReply,
																@RequestParam("cid") int cid, Model model) { //cid? or qid?
			if(qaReplyService.updateQaReply(qaReply)>0) {
				return "redirect:cdetail.do?cid=" + cid;
			} else {
				model.addAttribute("msg", qaReply.getQaid() + "번 댓글 수정 실패.");
				return "common/errorPage";
			}
	}
	
	
	
}
