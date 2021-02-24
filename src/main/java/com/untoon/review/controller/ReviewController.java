package com.untoon.review.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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

import com.untoon.review.model.service.ReviewService;
import com.untoon.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	

	/**
	 * 후기 글쓰기 페이지 이동 요청 처리용
	 * @return
	 */
	@RequestMapping("irfmove.do")						
	public String irfMove() {
		return "review/insertReviewForm"; 				//이동용 created
	}
	
	/**
	 * 	후기 작성 function insertReview()  
	 * 실습 했을때 binsert.do ("redirect:blist.do?page=1";) 이랑 같음
	 * @return
	 */
	@RequestMapping(value = "rinsert.do", method = RequestMethod.POST)
	public String insertReview(Review review, HttpServletRequest request, Model model, 
													@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/reviewClss_files");
	
		// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
		// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자' 형식으로 바꾸어 저장함
		if (mfile != null) {
			String fileName = mfile.getOriginalFilename();			
			if (fileName != null && fileName.length() > 0) {
				review.setOfile_r(fileName); //원래 파일명 vo 에 저장함
				
				//첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String rfile_r = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				rfile_r += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				
				try {
					mfile.transferTo(new File(savePath + "\\" + rfile_r));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송파일 저장 실패.");
					return "common/errorPage";
				}
				review.setRfile_r(rfile_r);
			}
		}
		//넣을 후기글이 (1개) 있으면
		if (reviewService.insertReview(review)>0) {
			return "redirect:rlist.do?page=1";						// CHECK     rlist.do
		} else {
			model.addAttribute("msg", "후기글 등록 실패.");
			return "common/errorPage";
		}
	}
	
	

	/**
	 * 후기 글 수정페이지로 이동 요청 처리용
	 * @param rid
	 * @param currentPage
	 * @param model
	 * @return
	 */
	public String urfMove(@RequestParam("rid") int rid, @RequestParam("page") int currentPage, Model model) {
		Review review = reviewService.selectReview(rid);
		if(review !=null) {
			model.addAttribute("review", review);
			model.addAttribute("page", currentPage);
			return "review/updateReviewForm";				//이동용 created
		} else {
			model.addAttribute("msg", rid + "번 후기글 수정페이지로 이동 실패.");
			return "common/errorPage";
		}		
	}
	
	/**
	 * 후기글 수정 요청 처리용
	 * @param rid
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("rupdate.do")
	public String rupdate(Review review, @RequestParam("page") int currentPage, 
			@RequestParam(name="delFlag", required=false) String delFlag,
			HttpServletRequest request, Model model,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/reviewClss_files");
		
		//원래 첨부파일이 있는데, 삭제를 선택한 경우
		if(review.getOfile_r() != null 
				&& delFlag != null && delFlag.equals("yes")) {
			//저장 폴더에서 파일 삭제함
			new File(savePath + "\\" + review.getRfile_r()).delete();
			review.setOfile_r(null);
			review.setRfile_r(null);
		}
		
		//새로운 첨부파일이 있다면
		if (mfile != null) {
			String fileName = mfile.getOriginalFilename();	
			String rfile_r= null;
			
			if (fileName != null && fileName.length() > 0) {				
				//첨부된 파일의 파일명 바꾸기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				rfile_r = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				rfile_r += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				
				try {
					mfile.transferTo(new File(savePath + "\\" + rfile_r));
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "전송파일 저장 실패.");
					return "common/errorPage";
				}
			}//첨부된 파일의 파일명 변경에서 폴더에 저장 처리
			
			//원래 첨부파일이 있는데 바뀐 경우
			if(review.getOfile_r() != null) {
				//원래 파일을 폴더에서 삭제 처리
				new File(savePath + "\\" + review.getRfile_r()).delete();
			}
			
			review.setOfile_r(fileName);
			review.setRfile_r(rfile_r);
		}  // mfile != null
		
		if(reviewService.updateReview(review)>0) {
			return "redirect:rlist.do?page=" + currentPage;
		} else {
			model.addAttribute("msg", review.getRid() + "번 후기글 수정 실패.");
			return "common/errorPage";
		}
	}
	
	
	/**
	 * 후기글 삭제 요청 처리용
	 * @param rid
	 * @param model
	 * @return
	 */
	@RequestMapping("rdelete.do")
	public String deleteReview(@RequestParam("rid") int rid, Model model) {
		if(reviewService.deleteReview(rid)> 0) {
			return "redirect:rlist.do?page=1";	
		} else {
			model.addAttribute("msg", rid + "번 후기글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
	
//	// 게시글 페이지별 목록 조회 요청 처리용
//		@RequestMapping("rlist.do")
//		public String selectReviewList(@RequestParam("page") int currentPage, 
//											 @RequestParam("cid") int cid, // SHOULD I INCLUDE cid?
//											 Model model) { 
//			int limit = 10;
//			ArrayList<Review> list = reviewService.selectReviewList(currentPage, limit, cid); // 클래스 상세보기에서 cid를 전달받아옴
//			
//
//		// 페이지 처리와 관련된 값 처리
//			// 총 페이지 계산을 위한 총 목록 갯수 조회
//			int listCount = reviewService.getListCount();
//			int maxPage = (int) ((double) listCount / limit + 0.9);
//			// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
//			// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
//			int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
//			int endPage = startPage + 9;
//
//			if (maxPage < endPage)
//				endPage = maxPage;
//
//			if (list.size() > 0) {
//				model.addAttribute("list", list);
//				model.addAttribute("currentPage", currentPage);
//				model.addAttribute("maxPage", maxPage);
//				model.addAttribute("startPage", startPage);
//				model.addAttribute("endPage", endPage);
//
//				return "review/reviewListView"; // 위치전송
//			} else {
//				model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
//				return "common/errorPage";
//			}
//		}
		

		// BoardController의 방식대로 blist 작성방법 + ReplyController의 rlist.do 방식 합성	
			// 게시글 페이지별 목록 조회 요청 처리용
			// ajax 로 <수업 클래스>에 대한 후기 조회 요청 처리용
					@RequestMapping( value = "rlist.do", method = RequestMethod.POST)
					@ResponseBody
					public String selectReviewList(@RequestParam("page") int currentPage, 
														 @RequestParam("cid") int cid, // SHOULD I INCLUDE cid?
														 Model model) throws UnsupportedEncodingException { 
						// 페이징 끝행 지정
						int limit = 10;
						//<수업 클래스>에 대한 후기 조회 요청
						ArrayList<Review> list = reviewService.selectReviewList(currentPage, limit, cid); // 클래스 상세보기에서 cid를 전달받아옴
						
						// 전송용 json 객체 준비
						JSONObject sendJson = new JSONObject();
						// list 옮길 json 배열 준비
						JSONArray jarr = new JSONArray();
						
						// list 를 jarr 로 옮기기(복사)
						for(Review review : list) {
							// reply 의 필드값 저장할 json 객체 생성
							JSONObject rev = new JSONObject();
							
							rev.put("rid", review.getRid());
							rev.put("rwriter", review.getRwriter());
							rev.put("rcontent", URLEncoder.encode(review.getRcontent(), "utf-8"));
							rev.put("r_create_date", review.getR_create_date().toString());
							rev.put("cid", review.getCid());
							
							// job 를 jarr 에 저장
							jarr.add(rev);
						}
						// 전송용 json 객체에 jarr 담음
						sendJson.put("list", jarr);
						
					
					// 페이지 처리와 관련된 값 처리
						// 총 페이지 계산을 위한 총 목록 갯수 조회
						int listCount = reviewService.getListCount();
						int maxPage = (int) ((double) listCount / limit + 0.9);
						// 현재 페이지가 속한 페이지그룹의 시작페이지 값 설정
						// 예 : 현재 페이지가 35이면, 시작페이지를 31로 지정(페이지 갯수를 10개 표시할 경우)
						int startPage = ((int) ((double) currentPage / 10)) * 10 + 1;
						int endPage = startPage + 9;

						if (maxPage < endPage)
							endPage = maxPage;

						if (list.size() > 0) {
							model.addAttribute("list", list);
							model.addAttribute("currentPage", currentPage);
							model.addAttribute("maxPage", maxPage);
							model.addAttribute("startPage", startPage);
							model.addAttribute("endPage", endPage);

							// return "review/reviewListView"; // 위치전송
							return sendJson.toJSONString(); // jsonView 가 리턴됨
						} else {
							model.addAttribute("msg", currentPage + "페이지 출력 목록 조회 실패.");
							return "common/errorPage";
						}
					}
		

	}


