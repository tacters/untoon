package com.untoon.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.pay.model.vo.Pay;

@Repository("payDao")
public class PayDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public PayDao() {}
	
	public ArrayList<Pay> payList() {
		List<Pay> list = sqlSession.selectList("payMapper.payList");
		return (ArrayList<Pay>)list;
	}

	public Pay detailPay(int payno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payMapper.detailPay", payno);
	}

	
	public ArrayList<Pay> selectMyPay(String id) {
		List<Pay> list = sqlSession.selectList("payMapper.selectMyPay", id);
		return (ArrayList<Pay>)list;
	}

	public Pay detailMyPay(int payno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payMapper.detailMyPay", payno);
	}

	public int insertPay(Pay pay) {
		// TODO Auto-generated method stub
		return sqlSession.insert("payMapper.insertPay", pay);
	}

	public int updatePay(Pay pay) {
		// TODO Auto-generated method stub
		return sqlSession.update("payMapper.updatePay", pay);
	}


}
