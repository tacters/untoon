package com.untoon.pay.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.untoon.member.model.vo.Member;
import com.untoon.pay.model.service.PayService;
import com.untoon.pay.model.vo.Pay;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	//관리자가 전체 결제 목록 보기 요청 할 때 
	@RequestMapping("plist.do")
	public String payList(Model model, HttpSession session) {
		
		ArrayList<Pay> list = payService.payList();
		Member loginUser = (Member) session.getAttribute("loginUser");
		if(list.size() > 0 && loginUser != null && loginUser.getUser_lv().equals("A")) {
			model.addAttribute("list", list);
			return "pay/AdminPayList";
		} else {
			model.addAttribute("msg", "결제내역 목록을 조회할 수 없습니다.");
			return "common/errorPage";
		}
	}
	
	//관리자가 결제목록 상세보기 할 때 
	@RequestMapping("pdetail.do")
	public String detailPay(@RequestParam("payno") int payno, Model model,
				HttpSession session) {
		Pay pay = payService.detailPay(payno);
			
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (pay !=null && loginUser != null && loginUser.getUser_lv().equals("A")){
			model.addAttribute("pay", pay);
			return "pay/AdminPayDetail";
		} else {
			model.addAttribute("msg", payno + "번 결제내역 상세보기를 할 수 없습니다.");
			return "common/errorPage";
		}	
	}
	
	//사용자가 마이페이지에서 결제내역 목록을 조회할 때 
	@RequestMapping("pmselect.do")
	public String selectMyPay(Model model, HttpSession session) {
		
		ArrayList<Pay> list = payService.selectMyPay();
		Member loginUser = (Member) session.getAttribute("loginUser");
		if(list.size() > 0 && loginUser != null && loginUser.getUser_lv().equals("S")) {
			model.addAttribute("list", list);
			return "pay/MyPagePayList";
		} else {
			model.addAttribute("msg", "결제내역 목록을 조회할 수 없습니다.");
			return "common/errorPage";
		}
	}
 
	//사용자가 마이페이지에서 결제목록 상세보기 할 때 
		@RequestMapping("pmdetail.do")
		public String detailMyPay(@RequestParam("payno") int payno, Model model,
					HttpSession session) {
			Pay pay = payService.detailPay(payno);
				
			Member loginUser = (Member) session.getAttribute("loginUser");
			if (pay !=null && loginUser != null && loginUser.getUser_lv().equals("S")){
				model.addAttribute("pay", pay);
				return "pay/MyPagePayDetail";
			} else {
				model.addAttribute("msg", payno + "번 결제내역 상세보기를 할 수 없습니다.");
				return "common/errorPage";
			}	
		}
	
	// 결제목록 추가하기 
		@RequestMapping("pinsert.do")
		public String insertPay(Pay pay, Model model, int payno) {
			if(payService.insertPay(pay) > 0) {
				ArrayList<Pay> list =payService.selectMyPay(payno)
				model.addAttribute("msg", "결제주문 성공");
				return "pay/PayFinishPage";
				
			} else {
				model.attribute("msg", "결제주문등록 실패 ");
				return "common/errorPage";
			
			}
}
	// 결제목록 결제상태(결제승인여부) 업데이트
		@RequestMapping("pupdate.do")
		public String updatePay(Pay pay, Model model) {
			if(payService.insertPay(pay) > 0)
				return "pay/MyPayPageDetail";
			} else {
				model.attribute("msg", "결제업데이트 실패 ");
				return "common/errorPage";
				
			}	
} 
