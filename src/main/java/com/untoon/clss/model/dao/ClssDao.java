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
	
	public ClssDao() {}
	
	public ArrayList<Clss> tClssList(Member loginUser) {
		List<Clss> list = sqlSession.selectList("clssMapper.tClssList", loginUser);
		 
		return (ArrayList<Clss>)list;
	}

	// 강사 클래스 상세보기
	public Clss selectOne(int cid) {
		return sqlSession.selectOne("clssMapper.selectClss", cid);
	}

	public ArrayList<Clss> clssList() {
		List<Clss> list = sqlSession.selectList("clssMapper.clssList");
		
		return (ArrayList<Clss>)list;
	}


}
