package com.untoon.clss.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.clss.model.dao.ClssDao;
import com.untoon.clss.model.vo.Clss;
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

	// 사용자 클래스 전체조회
	@Override
	public ArrayList<Clss> clssList() {
		return cDao.clssList();
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

	//관리자 클래스 승인하기
	@Override
	public int adminApproveClss(int cid) {
		return cDao.adminApproveClss(cid);
	}


	//관리자 승인거부 클래스 목록조회
	@Override
	public ArrayList<Clss> adminRlist() {
		return cDao.adminRlist();
	}

	// 관리자 클래스 삭제하기
	@Override
	public int adminDeleteClss(int cid) {
		return cDao.adminDeleteClss(cid);
	}

	//관리자 클래스 거부하기
	@Override
	public int adminDenyClss(Clss clss) {
		return cDao.adminDenyClss(clss);
	}

	// 강사 클래스 수정하기
	@Override
	public int tUpdateClss(Clss clss) {
		return cDao.tUpdateClss(clss);
	}







}