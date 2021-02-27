package com.untoon.review.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger logger = LoggerFactory.getLogger("ReviewController.class");
	
	@Autowired
	private ReviewService rService;
	
	@RequestMapping(value="rinsert.do", method = RequestMethod.POST)
	public String insertReview(Review review, HttpServletRequest request, Model model, 
												@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		// 업로드된 파일 저장 폴더 지정하기
				String savePath = request.getSession().getServletContext()
						.getRealPath("resources/reviewClss_files");
				
				//System.out.println(mfile.getOriginalFilename());	// JUST TO CHECK 확인용
				
				// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
				// 단, 첨부된 파일의 이름을 'yyyyMMddHHmmss.확장자' 형식으로 바꾸어 저장함
				if (mfile != null) {
					String fileName = mfile.getOriginalFilename();	
					System.out.println(fileName);	// JUST TO CHECK 확인용
					
					if (fileName != null && fileName.length() > 0) {
						review.setOfile_r(fileName); //원래 파일명 vo 에 저장함
						System.out.println(review.getOfile_r());	// JUST TO CHECK 확인용
						
						//첨부된 파일의 파일명 바꾸기
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
						renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
						
						try {
							mfile.transferTo(new File(savePath + "\\" + renameFileName));
						} catch (Exception e) {
							e.printStackTrace();
							model.addAttribute("msg", "전송파일 저장 실패.");
							return "common/errorPage";
						}
						review.setRfile_r(renameFileName);
						logger.info("rinsert.do : " + review);
					}
				}
				
				
		if (rService.insertReview(review) > 0) { 
			return "redirect:cdetail.do?cid=" + review.getCid();
		} else {
			model.addAttribute("msg", review.getCid() + "번 클래스에 대한 후기 등록 실패.");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping(value="rupdate.do", method=RequestMethod.POST)
	public String updateReview(Review review, @RequestParam("cid") int cid, 
													@RequestParam(name="delFlag", required=false) String delFlag,
													HttpServletRequest request, Model model,
													@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		
		//첨부된 파일 저장 폴더 지정하기
				String savePath = request.getSession().getServletContext()
						.getRealPath("resources/reviewClss_files");
				
				//원래 첨부파일이 있는데, 삭제를 선택한 경우
				if(review.getOfile_r() != null 
						&& delFlag != null && delFlag.equals("yes")) {
					//저장 폴더에서 파일 삭제함
					new File(savePath + "\\" + review.getRfile_r()).delete();
					review.setOfile_r(null);
					review.setRfile_r(null);
				}
				
				//새로운 첨부파일이 있다면
				if(mfile != null) {
					String fileName = mfile.getOriginalFilename();	
					String renameFileName = null;
					if (fileName != null && fileName.length() > 0) {				
						//첨부된 파일의 파일명 바꾸기
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
						renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
						
						try {
							mfile.transferTo(new File(savePath + "\\" + renameFileName));
						} catch (Exception e) {
							e.printStackTrace();
							model.addAttribute("msg", "전송파일 저장 실패.");
							return "common/errorPage";
						}				
					}  //첨부된 파일의 파일명 변경에서 폴더에 저장 처리
								
					//원래 첨부파일이 있는데 바뀐 경우
					if(review.getOfile_r() != null) {
						//원래 파일을 폴더에서 삭제 처리
						new File(savePath + "\\" + review.getRfile_r()).delete();
					}
					
					review.setOfile_r(fileName);
					review.setRfile_r(renameFileName);
				}  // mfile != null
				
				
				
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
			ArrayList<Review> reviewList = rService.selectReviewList(cid);

			// 전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			// list 옮길 json 배열 준비
			JSONArray jarr = new JSONArray();

			// list 를 jarr 로 옮기기(복사)
			for (Review review : reviewList) {
				// review 의 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();

				job.put("rid", review.getRid());
				job.put("cid", review.getCid());
				job.put("rwriter", URLEncoder.encode(review.getRwriter(), "utf-8"));
				job.put("rcontent", URLEncoder.encode(review.getRcontent(), "utf-8"));
				job.put("r_create_date", review.getR_create_date().toString());
				job.put("r_modify_date", review.getR_modify_date().toString());
				job.put("save_count", review.getSave_count());

				// job 를 jarr 에 저장
				jarr.add(job);
			}

			// 전송용 json 객체에 jarr 담음
			sendJson.put("reviewList", jarr);

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