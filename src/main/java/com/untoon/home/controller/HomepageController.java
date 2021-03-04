package com.untoon.home.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.untoon.home.model.service.AdService;
import com.untoon.home.model.service.HomeService;
import com.untoon.home.model.service.HomeUpfileService;
import com.untoon.home.model.vo.Ad;
import com.untoon.home.model.vo.Home;
import com.untoon.home.model.vo.HomeUpfile;

@Controller
public class HomepageController {
	private static final Logger logger = LoggerFactory.getLogger("HomeController.class");

	@Autowired
	private HomeService homeService;
	@Autowired
	private AdService adService;
	@Autowired
	private HomeUpfileService huService;
	
	
//			@RequestMapping("hdmove.do") //	home detail move
//			public String homeDetailMove() {
//				return "redirect:hdetail.do";
//			}
	
	// 모든 홈피 관리 페이지
	@RequestMapping("hdetail.do") 
	public String homeDetailView( //@RequestParam("hid") int hid, 
													Model model) {
		
//		ArrayList<Ad> adlist = adService.selectAllAd(); 		// 광고 전체 목록보기 요청 처리용 = adlist.do 역할
//		System.out.println(adlist);
		
		Home home = homeService.selectHome();	//홈 상세보기도 불러오고
		System.out.println(home);
		
		int hid = home.getHid();
		System.out.println("현재 홈페이지 버전 : "+ hid);
		
//		HomeUpfile hupfile = huService.selectHomeUpfile(); //홈 관련 첨부파일들도
//		System.out.println(hupfile);
		
		
		if (home != null/* || adlist.size() >0 */) { // 광고들과 홈페이지에서 수정할것들이 1개라도 있다면
//			model.addAttribute("adlist", adlist);
			model.addAttribute("home", home);
//			model.addAttribute("hupfile", hupfile);
			
			return "home/homeDetailView";			
		} else {
			model.addAttribute("msg", "홈페이지 관리용 뷰가 생성되지 않고 있습니다ㅠㅜㅠ 오류를 잡아주세요.");
			return "common/errorPage";  
		}
	}

	// adlist 광고 리스트 조회
	// A_STATUS DESC, AD_END DESC
	@RequestMapping("alist.do")
	public String adListView(@RequestParam("page") int currentPage, Model model) {
		
		int limit = 10;
		ArrayList<Ad> adlist = adService.selectAllAd(currentPage, limit);
		int listCount = adService.getListCount();
		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = ((int) ((double) currentPage / 10)) *10 + 1;
		int endPage = startPage + 9;
		
		if(maxPage<endPage)
			endPage = maxPage;
		
		if ( adlist.size() >0) { // 광고들 수정할것들이 1개라도 있다면
			model.addAttribute("adlist", adlist);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			return "home/adListView";			
		} else {
			model.addAttribute("msg", "홈페이지 관리용 뷰가 생성되지 않고 있습니다ㅠㅜㅠ 오류를 잡아주세요.");
			return "common/errorPage";  
		}

	}
	
	// 홈페이지 수정 = insert.do 즉, HID = 저장본 버젼 아이디 
	@RequestMapping(value = "hinsert.do", method  = RequestMethod.POST)
	public String insertHome(Home home, HttpServletRequest request, Model model) {
		
	
		if (homeService.insertHome(home) > 0) {
			return "redirect:humove.do";  // 홈페이지 글정보가 insert 완료되면 첨부파일 넣는 것을 실행해라 
															// CREATED VIEW PAGE TO UPLOAD FILES
		} else {
			model.addAttribute("msg", "공지글 등록 실패.");
			return "common/errorPage";
		}
	}

	
	// 홈페이지 수정 후 첨부파일 올리는 페이지로 이동하기
	@RequestMapping("humove.do") // home upload move
	public String homeUploadView( //@RequestParam("hid") int hid,
													Model model) {
		//HomeUpfile hupfile = huService.selectHomeUpfile(); // (hid)		
			return "home/homeUploadView";
	}
	
	// 홈페이지 수정 후 첨부파일 올리기
		@RequestMapping(value = "hupload.do", method  = RequestMethod.POST)
		public String insertHomeFiles(HomeUpfile hupfile, // HomeUpfile 추가
														HttpServletRequest request, Model model,
														@RequestParam(name = "banner1_img", required=false) MultipartFile mfile0,
														@RequestParam(name = "logo_cat1", required=false) MultipartFile mfile1,
														@RequestParam(name = "logo_cat2", required=false) MultipartFile mfile2,
														@RequestParam(name = "logo_cat3", required=false) MultipartFile mfile3,
														@RequestParam(name = "logo_cat4", required=false) MultipartFile mfile4,
														@RequestParam(name = "logo_cat5", required=false) MultipartFile mfile5,
														@RequestParam(name = "logo_cat6", required=false) MultipartFile mfile6,
														@RequestParam(name = "howto_file", required=false) MultipartFile mfile7,
														@RequestParam(name = "banner2_img", required=false) MultipartFile mfile8
														) {
			
			// 업로드된 파일 저장 폴더 지정하기
			String savePath = request.getSession().getServletContext().getRealPath("resources/home/homepage");
			
			// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
			if (mfile0 != null) {		//		banner1_img
				String fileName = mfile0.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile0.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setBanner1_img(mfile0.getOriginalFilename());
				}
			}
			if (mfile1 != null) {		//		logo_cat1
				String fileName = mfile1.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile1.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setLogo_cat1(mfile1.getOriginalFilename());
				}
			}
			if (mfile2 != null) {		//		logo_cat2
				String fileName = mfile2.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile2.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setLogo_cat2(mfile2.getOriginalFilename());
				}
			}
			if (mfile3 != null) {		//		logo_cat3
				String fileName = mfile3.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile3.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setLogo_cat3(mfile3.getOriginalFilename());
				}
			}
			if (mfile4 != null) {		//		logo_cat4
				String fileName = mfile4.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile4.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setLogo_cat4(mfile4.getOriginalFilename());
				}
			}
			if (mfile5 != null) {		//		logo_cat5
				String fileName = mfile5.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile5.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setLogo_cat5(mfile5.getOriginalFilename());
				}
			}
			if (mfile6 != null) {		//		logo_cat6
				String fileName = mfile6.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile6.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setLogo_cat6(mfile6.getOriginalFilename());
				}
			}			
			if (mfile7 != null) {		//		howto_file
				String fileName = mfile7.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile7.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setHowto_file(mfile7.getOriginalFilename());
				}
			}
			if (mfile8 != null) {		//		banner2_img
				String fileName = mfile8.getOriginalFilename();
				if (fileName != null && fileName.length() >0 ) {
					try {
						mfile8.transferTo(new File(savePath + "\\" + fileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
					hupfile.setBanner2_img(mfile8.getOriginalFilename());
				}
			}
			
			// 파일들 다 확인 후 최종 hupfile 로그에 출력해보기
			logger.info("hupload.do : " + hupfile);
			
			if (huService.insertHomeFiles(hupfile) > 0) { //huService = HomeUpfile 홈페이지 업로드용 메소드
				return "redirect:hdetail.do";
			} else {
				model.addAttribute("msg", "공지글 등록 실패.");
				return "common/errorPage";
			}
		}
	
	
	
	
	

		
		// 광고관리용 상세보기 페이지
		@RequestMapping("adetail.do")
		public String adDetailView(@RequestParam("adid") int adid,
													@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
													Model model) {
			
			Ad ad = adService.selectAd(adid); // 광고 상세보기
			
			if (ad != null) { //광고 값이 있으면
				model.addAttribute("page", currentPage);
				model.addAttribute("ad", ad); //광고 객체				
				return "home/adDetailView"; 
			} else {
				// 값이 없다면 오류
				model.addAttribute("msg", adid + "번 광고 상세보기 실패.");
				return "common/errorPage";
			}
		}
		
		
		//UPDATE
		@RequestMapping(value = "aupdate.do" , method = RequestMethod.POST)
		public String updateAd(Ad ad , HttpServletRequest request, Model model,
											@RequestParam("page") int currentPage, 
											@RequestParam(name = "delFlag", required = false) String delFlag,
											@RequestParam(name = "ad_file", required = false) MultipartFile mfile ) {
			// 업로드된 파일 저장 폴더 지정하기
			String savePath = request.getSession().getServletContext().getRealPath("resources/home/ad");
			
			// 원래 첨부파일이 있는데, 삭제를 선택한 경우
			if (ad.getAd_file() != null && delFlag != null && delFlag.equals("yes")) {
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "\\" + ad.getAd_file()).delete();
				ad.setAd_file(null);
				ad.setAd_file_r(null);
			}
			
			// 첨부파일이 없었는데, 새로 추가한 경우
			if (mfile != null) {
				String fileName = mfile.getOriginalFilename();
				System.out.println("update : " + fileName);
				String renameFileName = null;
				
				if (fileName != null && fileName.length() > 0) {
					//첨부된 파일의 파일명 바꾸기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
					
					// 업로드된 파일을 지정 폴더로 옮기기
					try {
						mfile.transferTo(new File(savePath + "\\" + renameFileName));
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("msg", "전송파일 저장 실패.");
						return "common/errorPage";
					}
				}
				
				if(ad.getAd_file() != null) {
					new File(savePath  + "\\" + ad.getAd_file_r()).delete();
				}
				
				ad.setAd_file(fileName);
				ad.setAd_file_r(renameFileName);
			}
			if (adService.updateAd(ad) > 0 ) {
				return "redirect:hdetail.do";
			} else {
				model.addAttribute("msg", "광고 수정 실패.");
				return "common/errorPage";
			}

		}

		
		
		// 광고 새로 추가하기로 이동하기
		@RequestMapping("aimove.do") //	ad insert move
		public String adInsertView() {
			return "home/adInsertView";
		}
	
		
		// 광고 새로 추가하기
		@RequestMapping(value="ainsert.do", method = RequestMethod.POST)
		public String insertAd(Ad ad, HttpServletRequest request, Model model,
											@RequestParam(name="upfile", required = false) MultipartFile mfile){
			
			String savePath = request.getSession().getServletContext()
					.getRealPath("resources/home/ad");
			
			if (mfile != null) {
				String fileName = mfile.getOriginalFilename();			
				if (fileName != null && fileName.length() > 0) {
					ad.setAd_file(fileName); //원래 파일명 vo 에 저장함
					
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
					ad.setAd_file_r(renameFileName);
				}
			}
			
						
			if (adService.insertAd(ad)>0) {
				model.addAttribute("ad", ad); //광고 객체
				System.out.println("입력된 광고 정보 : " + ad);
				return "redirect:hdetail.do"; 
			} else {
				model.addAttribute("msg", "광고 등록 실패");
				return "common/errorPage";
			}
		}
		
	
		
		// 광고 삭제하기 + 첨부파일도 같이 삭제
		@RequestMapping("adelete.do")
		public String deleteAd(@RequestParam("adid") int adid, 
											@RequestParam(name="ad_file_r", required = false) String fileName,
											HttpServletRequest request, Model model) {
			if (adService.deleteAd(adid)>0) {
				//첨부파일이 있는 글일 때, 저장폴더에 있는 파일도 삭제함
				if(fileName != null) {
					new File( request.getSession().getServletContext()
							.getRealPath("resources/home/ad") + "\\" + fileName).delete();
				}
				return "redirect:hdetail.do";
			} else {
				model.addAttribute("msg", adid + "번 광고 삭제 실패");
				return "common/errorPage";
			}
		}
											
				
		
}
