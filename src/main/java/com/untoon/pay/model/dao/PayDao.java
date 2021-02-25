package com.untoon.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.pay.model.vo.Pay;
import com.untoon.pay.model.vo.PayClss;

@Repository("payDao")
public class PayDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public PayDao() {}
	
	public ArrayList<PayClss> payList() {
		List<PayClss> list = sqlSession.selectList("payMapper.payList");
		return (ArrayList<PayClss>)list;
	}

	public PayClss detailPay(int payno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payMapper.detailPay", payno);
	}

	
	public ArrayList<PayClss> selectMyPay(String id) {
		List<PayClss> list = sqlSession.selectList("payMapper.selectMyPay", id);
		return (ArrayList<PayClss>)list;
	}

	public PayClss detailMyPay(int payno) {
		return sqlSession.selectOne("payMapper.detailMyPay", payno);
	}

	public int insertPay(Pay pay) {
		// TODO Auto-generated method stub
		return sqlSession.insert("payMapper.insertPay", pay);
	}

	public int updatePay(int payno) {
		// TODO Auto-generated method stub
		return sqlSession.update("payMapper.updatePay", payno);
	}


}
