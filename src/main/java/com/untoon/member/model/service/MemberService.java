package com.untoon.member.model.service;

import com.untoon.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int insertMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(String id);
	
	int idCheck(String id);
	
	int nicknameCheck(String nickname);
}
