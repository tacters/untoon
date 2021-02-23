package com.untoon.pay.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.pay.model.dao.PayDao;
import com.untoon.pay.model.vo.Pay;

@Service("payService")
public class PayServiceImpl implements PayService{
	@Autowired
	private PayDao payDao;
	
	@Override
	public ArrayList<Pay> payList() {
		return payDao.payList();
	}

	@Override
	public Pay detailPay(int payno) {
		// TODO Auto-generated method stub
		return payDao.detailPay(payno);
	}
	

	@Override
	public ArrayList<Pay> selectMyPay(String id) {
		// TODO Auto-generated method stub
		return payDao.selectMyPay(id);
	}

	@Override
	public Pay detailMyPay(int payno) {
		// TODO Auto-generated method stub
		return payDao.detailMyPay(payno);
	}

	@Override
	public int insertPay(Pay pay) {
		// TODO Auto-generated method stub
		return payDao.insertPay(pay);
	}

	@Override
	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		return payDao.updatePay(pay);
	}
	
	
}
