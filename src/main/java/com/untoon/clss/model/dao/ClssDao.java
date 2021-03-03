package com.untoon.clss.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.clss.model.vo.Clss;
import com.untoon.clss.model.vo.ClssPage;
import com.untoon.common.SearchAndPage;
import com.untoon.member.model.vo.Member;

@Repository("clssDao")
public class ClssDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ClssDao() {
	}

	// 강사 본인 클래스 목록 불러오기
	public ArrayList<Clss> tClssList(Member loginUser) {

		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		/*
		 * int startRow = (currentPage - 1) * limit - 1; int endRow = startRow + limit -
		 * 1;
		 */
		List<Clss> list = sqlSession.selectList("clssMapper.tClssList", loginUser);

		return (ArrayList<Clss>) list;
	}

	// 강사 클래스 상세보기
	public Clss selectOne(int cid) {
		return sqlSession.selectOne("clssMapper.selectTClss", cid);
	}

	// 사용자 뷰티/헬스 클래스 전체보기
	public ArrayList<Clss> clssList(int currentPage, int limit) {

		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.clssList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	// 사용자 클래스 상세보기
	public Clss selectClss(int cid) {
		return sqlSession.selectOne("clssMapper.selectClss", cid);
	}

	// 관리자 미승인 클래스 목록조회
	public ArrayList<Clss> adminNlist(int currentPage, int limit) {

		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.adminNlist", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	// 관리자 승인 클래스 목록조회
	public ArrayList<Clss> adminYList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.adminYlist", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	// 관리자 기간 지난 클래스 목록조회
	public ArrayList<Clss> adminEndList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.adminEndList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	// 관리자 승인거부 클래스 목록조회
	public ArrayList<Clss> adminRlist(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.adminRlist", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	// 관리자 클래스 상세보기
	public Clss adminSelectClss(int cid) {
		return sqlSession.selectOne("clssMapper.adminSelectClss", cid);
	}

	// 사용자 마이페이지에 본인 클래스 내용 불러오기
	public ArrayList<Clss> myClssList(String id) {
		List<Clss> myList = sqlSession.selectList("clssMapper.myClssList", id);
		return (ArrayList<Clss>) myList;
	}

	public int addViewCount(int cid) {
		return sqlSession.update("clssMapper.addViewCount", cid);
	}

	public int insertTclss(Clss clss) {
		return sqlSession.insert("clssMapper.insertTclss", clss);
	}

	// 관리자 클래스 승인하기
	public int adminApproveClss(int cid) {
		return sqlSession.update("clssMapper.approveClss", cid);
	}

	// 관리자 클래스 거부하기
	public int adminDenyClss(int cid, String clss_comment) {
		return sqlSession.update("clssMapper.denyClss", cid);
	}

	// 관리자 클래스 삭제하기
	public int adminDeleteClss(int cid) {
		return sqlSession.delete("clssMapper.adminDeleteClss", cid);
	}

	// 관리자 클래스 거부하기
	public int adminDenyClss(Clss clss) {
		return sqlSession.update("clssMapper.denyClss", clss);
	}

	public int tUpdateClss(Clss clss) {
		return sqlSession.update("clssMapper.tUpdateClss", clss);
	}

	// 제목 검색 페이징 처리
	public int getSearchTitleListCount(String keyword) {
		return sqlSession.selectOne("clssMapper.getSearchTitleListCount", keyword);
	}

	public int getSearchTagListCount(String keyword) {
		return sqlSession.selectOne("clssMapper.getSearchTagListCount", keyword);
	}

	public int getSearchTeacherListCount(String keyword) {
		return sqlSession.selectOne("clssMapper.getSearchTeacherCount", keyword);
	}

	public int getSearchCategoryListCount(String keyword) {
		return sqlSession.selectOne("clssMapper.getSearchCategoryCount", keyword);
	}

	// 제목 검색
	public ArrayList<Clss> searchTitle(SearchAndPage searches) {
		List<Clss> list = sqlSession.selectList("clssMapper.searchTitle", searches);
		return (ArrayList<Clss>) list;
	}

	// 태그검색
	public ArrayList<Clss> searchTag(SearchAndPage searches) {
		List<Clss> list = sqlSession.selectList("clssMapper.searchTag", searches);
		return (ArrayList<Clss>) list;
	}

	// 강사검색
	public ArrayList<Clss> searchTeacher(SearchAndPage searches) {
		List<Clss> list = sqlSession.selectList("clssMapper.searchTeacher", searches);
		return (ArrayList<Clss>) list;
	}

	// 카테고리검색
	public ArrayList<Clss> searchCategory(SearchAndPage searches) {
		List<Clss> list = sqlSession.selectList("clssMapper.searchCategory", searches);
		return (ArrayList<Clss>) list;
	}

	// 뷰티/헬스 페이징처리
	public int getListCount() {
		return sqlSession.selectOne("clssMapper.getListCount");
	}

	public int getArtCount() {
		return sqlSession.selectOne("clssMapper.getArtCount");
	}

	public int getLanguageCount() {
		return sqlSession.selectOne("clssMapper.getLanguageCount");
	}

	public int getFinanceCount() {
		return sqlSession.selectOne("clssMapper.getFinanceCount");
	}

	public int getDataCount() {
		return sqlSession.selectOne("clssMapper.getDataCount");
	}

	public int getOtherCount() {
		return sqlSession.selectOne("clssMapper.getOtherCount");
	}

	public ArrayList<Clss> aclssList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.aclssList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	public ArrayList<Clss> lclssList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.lclssList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	public ArrayList<Clss> fclssList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.fclssList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	public ArrayList<Clss> dclssList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.dclssList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	public ArrayList<Clss> oclssList(int currentPage, int limit) {
		// 전달된 값을 이용해서 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage - 1) * limit - 1;
		int endRow = startRow + limit - 1;
		List<Clss> list = sqlSession.selectList("clssMapper.oclssList", new ClssPage(startRow, endRow));

		return (ArrayList<Clss>) list;
	}

	public int getAdminNListCount() {
		return sqlSession.selectOne("clssMapper.getAdminNListCount");
	}

	public int getAdminYListCount() {
		return sqlSession.selectOne("clssMapper.getAdminYListCount");
	}

	public int getAdminRListCount() {
		return sqlSession.selectOne("clssMapper.getAdminRListCount");
	}

	public int getAdminEListCount() {
		return sqlSession.selectOne("clssMapper.getAdminEListCount");
	}


	public int addClssSave(int cid) {
		return sqlSession.update("clssMapper.addClssSave", cid);
	}

	public int delClssSave(int cid) {
		return sqlSession.update("clssMapper.delClssSave", cid);
	}

}
