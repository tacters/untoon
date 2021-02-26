package com.untoon.clss.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.untoon.clss.model.vo.Clss;
import com.untoon.member.model.vo.Member;

public interface ClssService {

	ArrayList<Clss> tClssList(Member loginUser);	// 강사 강의 목록 조회용

	Clss selectTclss(int cid);	// 강사 클래스 상세보기

	ArrayList<Clss> clssList();		// 사용자 클래스 전체조회

	Clss selectClss(int cid);	// 사용자 클래스 상세보기

	ArrayList<Clss> adminNlist();	// 관리자 미승인 클래스 목록조회

	ArrayList<Clss> adminYList();	// 관리자 승인 클래스 목록조회

	ArrayList<Clss> adminEndList();	// 관리자 기간 지난 클래스 목록조회

	Clss adminSelectClss(int cid);	// 관리자 클래스 상세보기

	ArrayList<Clss> myClssList(String id);	// 사용자 마이페이지에 본인 클래스 내용 불러오기

	int addViewCount(int cid);

	int insertTclss(Clss clss);

	int adminApproveClss(int cid);	//관리자 클래스 승인하기


	ArrayList<Clss> adminRlist();	//관리자 승인거부 클래스 목록조회

	int adminDeleteClss(int cid);	// 관리자 클래스 삭제하기

	int adminDenyClss(Clss clss);	//관리자 클래스 거부하기

	int tUpdateClss(Clss clss);		// 강사 클래스 수정하기


}

