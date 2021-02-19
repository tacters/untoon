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
		if(list.size() > 0 && loginUser != null && loginUser.getId().equals("A")) {
			model.addAttribute("list", list);
			return "pay/AdminPayList";
		} else {
			model.addAttribute("msg", "등록된 새 결제내역이 없습니다.");
			return "common/errorPage";
		}
	}
	
	//관리자가 결제목록 상세보기 할 때 
	@RequestMapping("pdetail.do")
	public String detailPay(@RequestParam("payno") int payno, Model model,
				HttpSession session) {
		Pay pay = payService.detailPay(payno);
	}
 
}
