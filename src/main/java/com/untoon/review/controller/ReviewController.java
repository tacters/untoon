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

import com.untoon.review.model.service.ReviewService;
import com.untoon.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	@RequestMapping(value="rinsert.do", method = RequestMethod.POST)
	public String insertReview(Review review, Model model) {
		if (rService.insertReview(review) > 0) { 
			return "redirect:cdetail.do?cid=" + review.getCid();
		} else {
			model.addAttribute("msg", review.getCid() + "번 클래스에 대한 후기 등록 실패.");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="rupdate.do", method=RequestMethod.POST)
	public String updateReview(Review review, @RequestParam("cid") int cid, Model model) {
			if(rService.updateReview(review)>0) {
				return "redirect:cdetail.do?cid=" + cid;
			} else {
				model.addAttribute("msg", review.getRid() + "번 후기 등록 실패..");
				return "common/errorPage";
			}
	}
	
	@RequestMapping("rdelete.do")
	public String deleteReview(@RequestParam("rid") int rid, 
																@RequestParam("cid") int cid, Model model) {
		if(rService.deleteReview(rid) > 0) {
					return "redirect: cdetail.do?cid=" + cid;
		} else {
			model.addAttribute("msg", "후기 삭제 실패.");
			return "common/errorPage";
		}
	}
	
	
	// ajax 로 원글에 대한 댓글 조회 요청 처리용
		@RequestMapping(value = "rlist.do", method = RequestMethod.POST)
		@ResponseBody
		public String selectReviewList(@RequestParam("cid") int cid) throws UnsupportedEncodingException {
			// 원글에 대한 댓글 조회 요청
			ArrayList<Review> list = rService.selectReviewList(cid);

			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			// list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();

			// list 를 jarr 로 옮기기(복사)
			for (Review review : list) {
				// review 의 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();

				job.put("rid", review.getRid());
				job.put("cid", review.getCid());
				job.put("rwriter", review.getRwriter());
				job.put("rcontent", URLEncoder.encode(review.getRcontent(), "utf-8"));
				job.put("r_modify_date", review.getR_modify_date().toString());
				job.put("save_count", review.getSave_count());

				// job 를 jarr 에 저장
				jarr.add(job);
			}

			// 전송용 json 객체에 jarr 담음
			sendJson.put("list", jarr);

			return sendJson.toJSONString(); // jsonView 가 리턴됨
		}
	
		//후기글 상세보기 요청 처리용
		@RequestMapping("rdetail.do")
		public String selectReview(@RequestParam("rid") int rid, Model model) {
			Review review = rService.selectReview(rid);
			if(review !=null) {
				model.addAttribute("review", review); 
				return "redirect: cdetail.do?cid=" +  review.getCid();				
			} else {
				model.addAttribute("msg", rid + "번 후기 글 조회 실패");
				return "common/errorPage";
			}
		}
	
}// ReviewController