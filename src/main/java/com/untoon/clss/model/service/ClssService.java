package com.untoon.clss.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.untoon.clss.model.vo.Clss;
import com.untoon.common.SearchAndPage;
import com.untoon.member.model.vo.Member;

public interface ClssService {

	ArrayList<Clss> tClssList(Member loginUser);	// 강사 강의 목록 조회용

	Clss selectTclss(int cid);	// 강사 클래스 상세보기

	ArrayList<Clss> clssList(int currentPage, int limit);		// 사용자 뷰티/헬스 클래스 전체조회
	
	int getListCount();	//사용자 뷰티/헬스 페이징 처리
	
	int getArtCount();

	int getLanguageCount();

	int getFinanceCount();

	int getDataCount();
	
	int getOtherCount();

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

	int getSearchTitleListCount(String keyword);	//제목검색 페이징처리
	
	int getSearchTagListCount(String keyword);
	
	int getSearchTeacherListCount(String keyword);
	
	int getSearchCategoryListCount(String keyword);
	
	ArrayList<Clss> searchTitle(SearchAndPage searches);	//제목으로검색

	ArrayList<Clss> searchTag(SearchAndPage searches);	//태그검색

	ArrayList<Clss> searchTeacher(SearchAndPage searches);	//강사이름으로 검색

	ArrayList<Clss> searchCategory(SearchAndPage searches);	// 카테고리로 검색

	ArrayList<Clss> aclssList(int currentPage, int limit);

	ArrayList<Clss> lclssList(int currentPage, int limit);

	ArrayList<Clss> fclssList(int currentPage, int limit);

	ArrayList<Clss> dclssList(int currentPage, int limit);

	ArrayList<Clss> oclssList(int currentPage, int limit);

	int addClssSave(int cid);

	int delClssSave(int cid);





}

