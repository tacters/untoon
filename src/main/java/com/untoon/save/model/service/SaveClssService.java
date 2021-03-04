package com.untoon.save.model.service;

import java.util.ArrayList;

import com.untoon.save.model.vo.SaveClss;

public interface SaveClssService {
	
	int insertSC(SaveClss sc);
	int deleteSC(SaveClss sc); // 기본키 = 복합키 둘 다 매개변수로 받아와야함
	
	int countClssTotal(int cid); // SELECT ONE: sc의 CID를 "좋아요"한 총 갯수
	int countMemberTotal(int id); // SELECT ONE: sc의 ID 회원이 "좋아요"로 찜한 수없들의 총갯수
	
	SaveClss selectOne(int id);
	ArrayList<SaveClss> selectList();
	
	ArrayList<SaveClss> selectTop8(); // 좋아요가 가장 많은 8개 CLSS
	ArrayList<SaveClss> selectCategory(String clss_category); // 찾는 카테고리에 가장 인기 많은 수업 순
	ArrayList<SaveClss> selectPersonalSave(String id); // SELECT ALL 개인이 좋아요한 수업 리스트
	
}
