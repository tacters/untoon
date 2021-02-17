package com.untoon.pay.model.service;

import java.util.ArrayList;

import com.untoon.pay.model.vo.Pay;

public interface PayService {
	ArrayList<Pay> payList(); //관리자용 결제목록조회
	Pay detailPay(int payno); //관리자용 결제 상세보기
	ArrayList<Pay> selectMyPay(); //마이페이지에서 사용자가 결제내역보기
	Pay detailMyPay(int payno);
	int insertPay(Pay pay);
	int updatePay(Pay pay);
	
}
