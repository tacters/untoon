package com.untoon.pay.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.untoon.clss.model.service.ClssService;
import com.untoon.clss.model.vo.Clss;
import com.untoon.member.model.vo.Member;
import com.untoon.pay.model.service.PayService;
import com.untoon.pay.model.vo.Pay;
import com.untoon.pay.model.vo.PayClss;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@RequestMapping("kakaopay.do")
	public String kakaoPay() {
		return "pay/kakaopay";
	}
	
	//클래스 상세정보 가져오기 ..그 중에서 필요한 정보들 호출할거야 뷰페이지(결제하는페이지)에서
	//클래스 상세에서 구매하기 누르면 결제페이지로 클래스 정보 값 넘겨줘
	@RequestMapping("paymove.do")
	public String clssPayMove(Model model, @RequestParam("cid") int cid) {
		PayClss pay = payService.payMove(cid);
		
		if(pay != null) {
			System.out.println("clsspaymove값있음");
			model.addAttribute("clss", pay);
			return "pay/PayPage";
		} else {
			System.out.println("clsspaymove값없음");
			model.addAttribute("msg", "결제페이지 이동이 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	//카카오페이 결제가 끝나고 결제완료페이지로 넘어갈 때 값 넘겨주기
	@RequestMapping("kakaomove.do")
	public String kakaoMove(Model model, @RequestParam("cid") int cid) {
		PayClss pay = payService.payMove(cid);
		
		if(pay != null) {
			System.out.println("kakaomove값있음");
			model.addAttribute("clss", pay);
			return "pay/PayFinishPage";
		} else {
			System.out.println("kakaomove값없음");
			model.addAttribute("msg", "결제페이지 이동이 실패하였습니다.");
			return "common/errorPage";
		}
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
		}}
	
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
	
	// 결제목록 추가하기(결제가 완료되었다고 페이지에 뜨고  → 마이페이지 결제목록에서 새로운 결제 내역이 추가된다.) 
		@RequestMapping("pinsert.do")
		public String insertPay(Pay pay, Model model, HttpSession session) {
			int p = payService.insertPay(pay);
			
			if(p > 0 ) {
				return "redirect: home.do";
			}else {
				model.addAttribute("msg", "결제가 실패되었습니다.");
				return "common/errorPage";
			
			}
}
	// 결제목록 결제상태(결제승인여부) 업데이트
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
