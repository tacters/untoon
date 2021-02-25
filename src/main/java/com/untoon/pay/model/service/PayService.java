package com.untoon.pay.model.service;

import java.util.ArrayList;

import com.untoon.pay.model.vo.Pay;
import com.untoon.pay.model.vo.PayClss;

public interface PayService {
	ArrayList<PayClss> payList(); //관리자용 결제목록조회
	PayClss detailPay(int payno); //관리자용 결제 상세보기
	ArrayList<PayClss> selectMyPay(String id); //마이페이지에서 사용자가 결제내역보기
	PayClss detailMyPay(int payno);
	int insertPay(Pay pay);
	int updatePay(int payno);
	
}
