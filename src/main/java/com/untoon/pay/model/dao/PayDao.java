package com.untoon.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.clss.model.vo.ClssPage;
import com.untoon.pay.model.vo.Pay;
import com.untoon.pay.model.vo.PayClss;

@Repository("payDao")
public class PayDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public PayDao() {}
	
	public ArrayList<PayClss> payList(int currentPage, int limit) {
		//전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit -1;
		int endRow = startRow + limit -1;
		
		List<PayClss> list = sqlSession.selectList("payMapper.payList", new ClssPage(startRow, endRow)); // 매개변수에서 두번째 거는 전달할 객체
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

	public PayClss payMove(int cid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payMapper.payMove", cid);
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("payMapper.getListCount");
	}


}
