package com.untoon.qa.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.qa.model.dao.QaDao;
import com.untoon.qa.model.vo.QA;

@Service("qaService")
public class QaServiceImpl implements QaService{
	@Autowired
	private QaDao qaDao;

	/**
	 *		문의 전체목록조회
	 */
	@Override
	public ArrayList<QA> selectQaList(int cid) {
		return qaDao.selectQaList(cid);
	}

	/**
	 *		문의 작성
	 */
	@Override
	public int insertQa(QA qa) {
		return qaDao.insertQa(qa);
	}

	/**
	 *		문의 수정
	 */
	@Override
	public int updateQa(QA qa) {
		return qaDao.updateQa(qa);
	}

	/**
	 * 		문의 삭제
	 */
	@Override
	public int deleteQa(int qid) {
		return qaDao.deleteQa(qid);
	}

	// 마이페이지에서 1:1문의 내역 가져오기
	@Override
	public ArrayList<QA> myQa(String id) {
		return qaDao.myQa(id);
	}
	
}
