package com.untoon.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.member.model.dao.MemberDao;
import com.untoon.member.model.vo.Member;


@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(m);
		return result;
	}
	
	/*
	 * @Override public int insertTeMember(Member m) { int result =
	 * mDao.insertTeMember(m); return result; }
	 */
	

	@Override
	public int updateMember(Member m) {
		
		return mDao.updateMember(m);
	}

	@Override
	public int deleteMember(String id) {
		
		return mDao.deleteMember(id);
	}

	@Override
	public int idCheck(String id) {
			
		return mDao.idCheck(id);
	}

	@Override
	public int nicknameCheck(String nickname) {
		
		return mDao.nicknameCheck(nickname);
	}
	@Override
	public int emailCheck(String email) {
		
		return mDao.emailCheck(email);
	}

	//아이디 찾기
	@Override
	public String findId(String email) {
		
		return mDao.findId(email);
	}
	
	//관리자 -> 회원조회
	@Override
	public ArrayList<Member> selectList(int currentPage, int limit) {
		return mDao.selectList(currentPage, limit);
	}

	@Override
	public int getListCount() {
		return mDao.getListCount();
	}

	//회원정보 상세보기
	@Override
	public Member selectMember(int id) {
		return mDao.selectMember(id);
	}


}
