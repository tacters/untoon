package com.untoon.member.model.service;

import java.util.List;

import com.untoon.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	/* int insertTeMember(Member m); */
	
	int updateMember(Member m);
	
	int deleteMember(String id);
	
	int idCheck(String id);
	
	int nicknameCheck(String nickname);

	int emailCheck(String email);
	
	//아이디 찾기
	String findId(String email);

	
}
