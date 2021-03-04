package com.untoon.save.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.save.model.vo.SaveClss;

@Repository("scDao")
public class SaveClssDao {
	//스프링-마이바티스 연동 객체 연결함 : root-context.xml 에 선언되어 있음
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	public int insertSC(SaveClss sc) {
		return sqlSession.insert("scMapper.insertSC", sc);
	}

	public int deleteSC(SaveClss sc) {
		return sqlSession.delete("scMapper.deleteSC", sc);
	}

	public int countClssTotal(int cid) {
		return sqlSession.selectOne("scMapper.countClssTotal", cid);
	}

	public int countMemberTotal(int id) {
		return sqlSession.selectOne("scMapper.countMemberTotal", id);
	}

	public SaveClss selectOne(int id) {
		return sqlSession.selectOne("scMapper.selectOne", id);
	}
	
	public ArrayList<SaveClss> selectList() {
		List<SaveClss> sclist = sqlSession.selectList("scMapper.selectList");
		return (ArrayList<SaveClss>)sclist;
	}

	public ArrayList<SaveClss> selectTop8() { // 좋아요가 가장 많은 8개 CLSS
		List<SaveClss> sclist = sqlSession.selectList("scMapper.selectTop8");
		return(ArrayList<SaveClss>)sclist;
	}

	public ArrayList<SaveClss> selectCategory(String clss_category) { // 선택한 카테고리에 가장 인기 많은 수업 순
		List<SaveClss> sclist = sqlSession.selectList("scMapper.selectCategory", clss_category);
		return(ArrayList<SaveClss>)sclist;
	}

	public ArrayList<SaveClss> selectPersonalSave(int cid) {  // SELECT ALL 개인이 좋아요한 수업 리스트
		List<SaveClss> sclist = sqlSession.selectList("scMapper.selectPersonalSave", cid);
		return(ArrayList<SaveClss>)sclist;
	}

	
}
