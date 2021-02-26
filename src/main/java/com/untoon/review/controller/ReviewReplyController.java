package com.untoon.review.controller;

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

import com.untoon.review.model.service.ReviewReplyService;
import com.untoon.review.model.vo.Review;
import com.untoon.review.model.vo.ReviewReply;

@Controller
public class ReviewReplyController {
	
	@Autowired
	private ReviewReplyService rrService;
	
	@RequestMapping(value="rrinsert.do", method = RequestMethod.POST)
	public String insertReviewReply(ReviewReply reviewReply, Model model) {
		if (rrService.insertReviewReply(reviewReply) > 0) { 
			return "redirect:cdetail.do?cid=" + reviewReply.getRef_rcid();
		} else {
			model.addAttribute("msg", reviewReply.getRef_rcid() + "번 클래스에 대한 후기 등록 실패.");
			return "common/errorPage";
		}
	}

	@RequestMapping(value="rrupdate.do", method=RequestMethod.POST)
	public String updateReviewReply(ReviewReply reviewReply, @RequestParam("cid") int cid, Model model) {
			if(rrService.updateReviewReply(reviewReply)>0) {
				return "redirect:cdetail.do?cid=" + cid;
			} else {
				model.addAttribute("msg", reviewReply.getRrid() + "번 후기 등록 실패..");
				return "common/errorPage";
			}
	}
	
	@RequestMapping("rrdelete.do")
	public String deleteReviewReply(@RequestParam("rrid") int rrid, 
																@RequestParam("cid") int cid, Model model) {
		if(rrService.deleteReviewReply(rrid) > 0) {
					return "redirect: cdetail.do?cid=" + cid;
		} else {
			model.addAttribute("msg", "후기 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
	// ajax 로 원글에 대한 댓글 조회 요청 처리용
		@RequestMapping(value = "rrlist.do", method = RequestMethod.POST)
		@ResponseBody
		public String selectReviewReplyList(@RequestParam("ref_rid") int ref_rid) throws UnsupportedEncodingException {
			// 원글에 대한 댓글 조회 요청
			ArrayList<ReviewReply> list = rrService.selectReviewReplyList(ref_rid);

			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			// list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();

			// list 를 jarr 로 옮기기(복사)
			for (ReviewReply reviewReply : list) {
				// reviewReply 의 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();

				job.put("rrid", reviewReply.getRrid());
				job.put("ref_rid", reviewReply.getRef_rid());
				job.put("ref_rcid", reviewReply.getRef_rcid());
				job.put("rrwriter", reviewReply.getRrwriter());
				job.put("rrcontent", URLEncoder.encode(reviewReply.getRrcontent(), "utf-8"));
				job.put("rr_modify_date", reviewReply.getRr_modify_date().toString());

				// job 를 jarr 에 저장
				jarr.add(job);
			}

			// 전송용 json 객체에 jarr 담음
			sendJson.put("list", jarr);

			return sendJson.toJSONString(); // jsonView 가 리턴됨
		}
	
		//후기글 상세보기 요청 처리용
		@RequestMapping("rrdetail.do")
		public String selectReview(@RequestParam("rrid") int rrid, Model model) {
			ReviewReply reviewReply = rrService.selectReviewReply(rrid);
			if(reviewReply !=null) {
				model.addAttribute("reviewReply", reviewReply); 
				return "redirect: cdetail.do?cid=" +  reviewReply.getRef_rcid();				
			} else {
				model.addAttribute("msg", rrid + "번 후기 글 조회 실패");
				return "common/errorPage";
			}
		}
}
