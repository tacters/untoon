package com.untoon.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.common.SearchAndPage;
import com.untoon.member.model.vo.Member;
import com.untoon.member.model.vo.MemberPage;



@Repository("mDao")
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		
		
		return (Member)sqlSession.selectOne("memberMapper.loginMember", m);
		
	}
	
	 public int insertMember(Member m) {
	
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	/*
	 * // 강사 회원가입 public int insertTeMember(Member m) { return
	 * sqlSession.insert("memberMapper.insertTeMember", m);
	 * 
	 * }
	 */

	public int updateMember(Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(String id) {
		
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public int idCheck(String id) {

		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	public int nicknameCheck(String nickname) {
		
		return sqlSession.selectOne("memberMapper.nicknameCheck", nickname);
	}

	public int emailCheck(String email) {
		
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}
	
	//아이디 찾기
	public String findId(String email) {
		
		return sqlSession.selectOne("memberMapper.findId", email);
	}

	//회원조회 목록
	public ArrayList<Member> selectList(int currentPage, int limit) {
		//전달된 값을 이용해 출력할 시작행과 끝행을 계산함
		int startRow = (currentPage -1) * limit -1;
		int endRow = startRow + limit -1;
		
		List<Member> list = sqlSession.selectList("memberMapper.selectList",
						new MemberPage(startRow, endRow));
		return (ArrayList<Member>)list;
	}

	public int getListCount() {
		return sqlSession.selectOne("memberMapper.getListCount");
	}
	
	//회원정보 상세보기
	public Member selectMember(int id) {
		return sqlSession.selectOne("memberMapper.selectMember", id);
	}

	//아이디로 검색하기
	public ArrayList<Member> selectSerarchWriter(SearchAndPage searches) {
		List<Member> list = sqlSession.selectList("memberMapper.searchWriter",searches);
		return (ArrayList<Member>)list;
	}

	public int getSearchWriterListCount(String keyword) {
		return sqlSession.selectOne("memberMapper.getSearchWriterListCount", keyword);
	}

	



}
