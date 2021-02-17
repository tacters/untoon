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
		
		return null;
	}

	@Override
	public Pay detailPay(int payno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Pay> selectMyPay() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pay detailMyPay(int payno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPay(Pay pay) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
