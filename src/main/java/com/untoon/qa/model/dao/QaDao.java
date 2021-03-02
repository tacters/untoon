package com.untoon.qa.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.qa.model.vo.QA;

@Repository("qaDao")
public class QaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 *		문의 전체목록조회
	 * @param cid
	 * @return
	 */
	public ArrayList<QA> selectQaList(int cid) {
		List<QA> list = sqlSession.selectList("qaMapper.selectQaList", cid); //qa-mapper.xml 생성하기
		return (ArrayList<QA>)list;
	}

	public int insertQa(QA qa) {
		return sqlSession.insert("qaMapper.insertQa", qa);
	}

	public int updateQa(QA qa) {
		return sqlSession.insert("qaMapper.updateQa", qa);
	}

	public int deleteQa(int qid) {
		return sqlSession.insert("qaMapper.deleteQa", qid);
	}

	public ArrayList<QA> myQa(String id) {
		List<QA> list = sqlSession.selectList("qaMapper.myQa",id); 
		return (ArrayList<QA>)list;
	}

}
