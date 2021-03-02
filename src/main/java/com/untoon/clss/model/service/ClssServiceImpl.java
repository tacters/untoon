package com.untoon.clss.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.clss.model.dao.ClssDao;
import com.untoon.clss.model.vo.Clss;
import com.untoon.common.SearchAndPage;
import com.untoon.member.model.vo.Member;

@Service("clssService")
public class ClssServiceImpl implements ClssService {
	@Autowired
	private ClssDao cDao;

	@Override
	public ArrayList<Clss> tClssList(Member loginUser) { // 강사 리스트 조회용
		return cDao.tClssList(loginUser);
	}

	// 강사 클래스 상세보기
	@Override
	public Clss selectTclss(int cid) {
		return cDao.selectOne(cid);
	}

	// 사용자 뷰티/헬스 클래스 전체조회
	@Override
	public ArrayList<Clss> clssList(int currentPage, int limit) {
		return cDao.clssList(currentPage, limit);
	}
	
	@Override
	public ArrayList<Clss> aclssList(int currentPage, int limit) {
		return cDao.aclssList(currentPage, limit);
	}

	@Override
	public ArrayList<Clss> lclssList(int currentPage, int limit) {
		return cDao.lclssList(currentPage, limit);
	}

	@Override
	public ArrayList<Clss> fclssList(int currentPage, int limit) {
		return cDao.fclssList(currentPage, limit);
	}

	@Override
	public ArrayList<Clss> dclssList(int currentPage, int limit) {
		return cDao.dclssList(currentPage, limit);
	}

	@Override
	public ArrayList<Clss> oclssList(int currentPage, int limit) {
		return cDao.oclssList(currentPage, limit);
	}

	// 사용자 클래스 상세보기
	@Override
	public Clss selectClss(int cid) {
		return cDao.selectClss(cid);
	}

	// 관리자 미승인 클래스 목록조회
	@Override
	public ArrayList<Clss> adminNlist() {
		return cDao.adminNlist();
	}

	// 관리자 승인 클래스 목록조회
	@Override
	public ArrayList<Clss> adminYList() {
		return cDao.adminYList();
	}

	// 관리자 기간 지난 클래스 목록조회
	@Override
	public ArrayList<Clss> adminEndList() {
		return cDao.adminEndList();
	}

	// 관리자 클래스 상세보기
	@Override
	public Clss adminSelectClss(int cid) {
		return cDao.adminSelectClss(cid);
	}

	// 사용자 마이페이지에 본인 클래스 내용 불러오기
	@Override
	public ArrayList<Clss> myClssList(String id) {
		return cDao.myClssList(id);
	}

	@Override
	public int addViewCount(int cid) {
		return cDao.addViewCount(cid);
	}

	// 강사 클래스 등록하기
	@Override
	public int insertTclss(Clss clss) {
		return cDao.insertTclss(clss);
	}

	// 관리자 클래스 승인하기
	@Override
	public int adminApproveClss(int cid) {
		return cDao.adminApproveClss(cid);
	}

	// 관리자 승인거부 클래스 목록조회
	@Override
	public ArrayList<Clss> adminRlist() {
		return cDao.adminRlist();
	}

	// 관리자 클래스 삭제하기
	@Override
	public int adminDeleteClss(int cid) {
		return cDao.adminDeleteClss(cid);
	}

	// 관리자 클래스 거부하기
	@Override
	public int adminDenyClss(Clss clss) {
		return cDao.adminDenyClss(clss);
	}

	// 강사 클래스 수정하기
	@Override
	public int tUpdateClss(Clss clss) {
		return cDao.tUpdateClss(clss);
	}

	// 제목 검색 페이징 처리
	@Override
	public int getSearchTitleListCount(String keyword) {
		return cDao.getSearchTitleListCount(keyword);
	}

	@Override
	public int getSearchTagListCount(String keyword) {
		return cDao.getSearchTagListCount(keyword);
	}

	@Override
	public int getSearchTeacherListCount(String keyword) {
		return cDao.getSearchTeacherListCount(keyword);
	}

	@Override
	public int getSearchCategoryListCount(String keyword) {
		return cDao.getSearchCategoryListCount(keyword);
	}

	// 제목으로검색
	@Override
	public ArrayList<Clss> searchTitle(SearchAndPage searches) {
		return cDao.searchTitle(searches);
	}

	@Override
	public ArrayList<Clss> searchTag(SearchAndPage searches) {
		return cDao.searchTag(searches);
	}

	@Override
	public ArrayList<Clss> searchTeacher(SearchAndPage searches) {
		return cDao.searchTeacher(searches);
	}

	@Override
	public ArrayList<Clss> searchCategory(SearchAndPage searches) {
		return cDao.searchCategory(searches);
	}

	// 뷰티/헬스 페이징 처리
	@Override
	public int getListCount() {
		return cDao.getListCount();
	}

	@Override
	public int getArtCount() {
		return cDao.getArtCount();
	}

	@Override
	public int getLanguageCount() {
		return cDao.getLanguageCount();
	}

	@Override
	public int getFinanceCount() {
		return cDao.getFinanceCount();
	}

	@Override
	public int getDataCount() {
		return cDao.getDataCount();
	}

	@Override
	public int getOtherCount() {
		return cDao.getOtherCount();
	}


}