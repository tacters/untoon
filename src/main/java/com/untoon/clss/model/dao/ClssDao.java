package com.untoon.clss.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.clss.model.vo.Clss;
import com.untoon.member.model.vo.Member;

@Repository("clssDao")
public class ClssDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ClssDao() {
	}

	// 강사 본인 클래스 목록 불러오기
	public ArrayList<Clss> tClssList(Member loginUser) {
		List<Clss> list = sqlSession.selectList("clssMapper.tClssList", loginUser);

		return (ArrayList<Clss>) list;
	}

	// 강사 클래스 상세보기
	public Clss selectOne(int cid) {
		return sqlSession.selectOne("clssMapper.selectTClss", cid);
	}

	// 사용자 클래스 전체보기
	public ArrayList<Clss> clssList() {
		List<Clss> list = sqlSession.selectList("clssMapper.clssList");

		return (ArrayList<Clss>) list;
	}

	// 사용자 클래스 상세보기
	public Clss selectClss(int cid) {
		return sqlSession.selectOne("clssMapper.selectClss", cid);
	}

	// 관리자 미승인 클래스 목록조회
	public ArrayList<Clss> adminNlist() {
		List<Clss> list = sqlSession.selectList("clssMapper.adminNlist");
		
		return (ArrayList<Clss>) list;
	}

	// 관리자 승인 클래스 목록조회
	public ArrayList<Clss> adminYList() {
		List<Clss> list = sqlSession.selectList("clssMapper.adminYlist");

		return (ArrayList<Clss>) list;
	}

	// 관리자 기간 지난 클래스 목록조회
	public ArrayList<Clss> adminEndList() {
		List<Clss> list = sqlSession.selectList("clssMapper.adminEndList");

		return (ArrayList<Clss>) list;
	}

	// 관리자 클래스 상세보기
	public Clss adminSelectClss(int cid) {
		return sqlSession.selectOne("clssMapper.adminSelectClss", cid);
	}

	// 사용자 마이페이지에 본인 클래스 내용 불러오기
	public ArrayList<Clss> myClssList(Member loginUser) {
		List<Clss> myList = sqlSession.selectList("clssrMapper.myClssList", loginUser);
		return (ArrayList<Clss>) myList;
	}

	public int addViewCount(int cid) {
		return sqlSession.update("clssMapper.addViewCount", cid);
	}

	public int insertTclss(Clss clss) {
		return sqlSession.insert("clssMapper.insertTclss",clss);
	}

}
