package com.untoon.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.member.model.vo.Member;



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

	



}
