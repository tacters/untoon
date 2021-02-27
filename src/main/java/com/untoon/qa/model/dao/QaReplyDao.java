package com.untoon.qa.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.qa.model.vo.QA;
import com.untoon.qa.model.vo.QaReply;

@Repository("qaReplyDao")
public class QaReplyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int insertQaReply(QaReply qaReply) {
		return sqlSession.insert("qareplyMapper.insertQaReply", qaReply);
	}
	
	public int updateQaReply(QaReply qaReply) {
		return sqlSession.update("qareplyMapper.updateQaReply", qaReply);
	}

	public int deleteQaReply(int qaid) {
		return sqlSession.update("qareplyMapper.deleteQaReply", qaid);
	}

	public int selectQaReply(int qaid) {
		return sqlSession.selectOne("qareplyMapper.selectQaReply", qaid);
	}
	
	public ArrayList<QaReply> selectQaReplyList(int ref_qid) {
		List<QaReply> list = sqlSession.selectList("qareplyMapper.selectQaReplyList", ref_qid);
		return (ArrayList<QaReply>)list;
	}

}
