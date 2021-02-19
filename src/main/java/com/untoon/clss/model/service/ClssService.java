package com.untoon.clss.model.service;

import java.util.ArrayList;

import com.untoon.clss.model.vo.Clss;

public interface ClssService {

	ArrayList<Clss> tClssList();	// 강사 강의 목록 조회용

	Clss selectTclss(int cid);	// 클래스 상세보기

}

