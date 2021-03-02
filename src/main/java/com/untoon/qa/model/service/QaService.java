package com.untoon.qa.model.service;

import java.util.ArrayList;

import com.untoon.qa.model.vo.QA;

public interface QaService {
	ArrayList<QA> selectQaList(int cid);
	int insertQa(QA qa);
	int updateQa(QA qa);
	int deleteQa(int qid);
	ArrayList<QA> myQa(String id);	// 마이페이지에서 1:1문의 내역 가져오기
	
}
