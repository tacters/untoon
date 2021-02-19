package com.untoon.clss.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.untoon.clss.model.vo.Clss;
import com.untoon.member.model.vo.Member;

public interface ClssService {

	ArrayList<Clss> tClssList(Member loginUser);	// 강사 강의 목록 조회용

	Clss selectTclss(int cid);	// 클래스 상세보기

	ArrayList<Clss> clssList();

}

