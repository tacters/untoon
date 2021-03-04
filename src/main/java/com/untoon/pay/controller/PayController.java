package com.untoon.pay.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.untoon.member.model.vo.Member;
import com.untoon.pay.model.service.PayService;
import com.untoon.pay.model.vo.Pay;
import com.untoon.pay.model.vo.PayClss;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	//클래스 상세에서 구매하기 누르면 결제페이지로 클래스 정보 값 넘겨줘
	@RequestMapping("paymove.do")
	public String clssPayMove(HttpSession session, Model model, @RequestParam("cid") int cid) {
		
		 PayClss pay = payService.payMove(cid);
		 
		 Member loginUser = (Member) session.getAttribute("loginUser");
		 
		 if(pay != null && loginUser.getUser_lv().equals("S")) { 
			 System.out.println("clsspaymove값있음");
			 model.addAttribute("clss", pay);
			 return "pay/PayPage"; 
		} else {
			 System.out.println("clsspaymove값없음");
			 model.addAttribute("msg","결제페이지 이동이 실패하였습니다.");
			 return "common/errorPage"; 
		}
		
	}
	
	//결제페이지에서 카카오페이결제로 넘어가기 
	@RequestMapping("movekakao.do")
	public String kakaoPay(Model model, @RequestParam("cid") int cid) {
		
		PayClss pay = payService.payMove(cid);
		 
		 if(pay != null) { 
			 System.out.println("movekakao값있음");
			 model.addAttribute("clss", pay);
			 return "pay/kakaopay";
			 } 
		 else {
			 System.out.println("movekakao값없음");
			 model.addAttribute("msg","결제페이지 이동이 실패하였습니다.");
			 return "common/errorPage"; 
			 }
	}
	
	// 카카오페이결제완료되면 결제피니쉬페이지로 넘어가기
	@RequestMapping("pfinish.do")
	public String payFinish(Model model) {
		return "pay/PayFinishPage";
//				, @RequestParam("cid") int cid
//				PayClss pay = payService.payMove(cid);
//				
//				if (pay != null) {
//					System.out.println("결제완료후 페이지 넘어감");
//					model.addAttribute("clss", pay);
//					return "pay/PayFinishPage";
//				} else {
//					System.out.println("페이지 넘어가지 않고 있음..오류");
//					model.addAttribute("msg", "결제가 정상적으로 처리되지 않았습니다.");
//					return "common/errorPage";
//				}
	}
	
	
	//카카오 결제 실패했을 때 페이지 이동
	@RequestMapping("kakaofail.do")
	public String kakaoFail(Model model) {
		
		model.addAttribute("msg", "결제가 실패되었습니다.");
		return "common/errorPage";
	}
	
	//관리자가 전체 결제 목록 보기 요청 할 때 
	@RequestMapping("plist.do")
	public String payList(Model model) {
		ArrayList<PayClss> list = payService.payList();
		System.out.println("list : " + list );
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "pay/AdminPayList";
		} else {
			model.addAttribute("msg", "결제내역 목록을 조회할 수 없습니다.");
			return "common/errorPage";
		}
	}
	
	//관리자가 결제목록 상세보기 할 때 
	@RequestMapping("pdetail.do")
	public String detailPay(@RequestParam("payno") int payno, Model model) {
		PayClss pay = payService.detailPay(payno);
			
		if (pay !=null){
			model.addAttribute("pay", pay);
			return "pay/AdminPayDetail";
		} else {
			model.addAttribute("msg", payno + "번 결제내역 상세보기를 할 수 없습니다.");
			return "common/errorPage";
		}}
	
	//사용자가 마이페이지에서 결제내역 목록을 조회할 때 
	@RequestMapping("pmselect.do")
	public String selectMyPay(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String id = loginUser.getId();
		System.out.println(id);
		ArrayList<PayClss> list = payService.selectMyPay(id);
		System.out.println("list : " + list );
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "pay/MyPagePayList";
		} else {
			model.addAttribute("msg", "결제내역 목록을 조회할 수 없습니다.");
			return "common/errorPage";
		}
	}
	//사용자가 마이페이지에서 결제목록 상세보기 할 때 
		@RequestMapping("pmdetail.do")
		public String detailMyPay(@RequestParam("payno") int payno, Model model) {
			PayClss pay = payService.detailMyPay(payno);
				System.out.println("pay : " + pay);
				
			if (pay !=null ){
				model.addAttribute("pay", pay);
				return "pay/MyPagePayDetail";
			} else {
				model.addAttribute("msg", payno + "번 결제내역 상세보기를 할 수 없습니다.");
				return "common/errorPage";
			}	
		}

		
		
	// 결제목록 추가하기(결제완료 페이지에서 결제완료 버튼 누르면  → 마이페이지 결제목록에서 새로운 결제 내역이 추가된다.) → 메인페이지 다시나와
		@RequestMapping("pinsert.do")
		public void insertPay(Pay pay, Model model) {
			int p = payService.insertPay(pay);
			
			}

	// 결제목록 결제상태(결제승인여부) 업데이트 -- 결제취소하기
		@RequestMapping("pupdate.do")
		public String updatePay(@RequestParam("payno") int payno, Model model, HttpSession session) {
			int p = payService.updatePay(payno);
			System.out.println("p : " + p);
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			String id = loginUser.getId();
			System.out.println(id);
			ArrayList<PayClss> list = payService.selectMyPay(id);
			System.out.println("list : " + list );
			
			if(p > 0 ) {
				model.addAttribute("msg", "결제가 취소되었습니다.");
				model.addAttribute("list", list);
				return "pay/MyPagePayList";
			}
			else {
				model.addAttribute("msg", "결제취소가 실패되었습니다. ");
				return "common/errorPage";
			}	
		} 
}
