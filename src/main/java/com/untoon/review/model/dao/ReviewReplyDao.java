package com.untoon.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.untoon.review.model.vo.ReviewReply;


@Repository("rrDao")
public class ReviewReplyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insertReviewReply(ReviewReply reviewReply) {
		return sqlSession.insert("reviewReplyMapper.insertReviewReply", reviewReply);
	}

	public int updateReviewReply(int rrid) {
		return sqlSession.update("reviewReplyMapper.updateReviewReply", rrid);
	}

	public int deleteReviewReply(int rrid) {
		return sqlSession.insert("reviewReplyMapper.deleteReviewReply", rrid);
	}

	public ArrayList<ReviewReply> selectReviewReplyList(int ref_rid) {
		List<ReviewReply> list = sqlSession.selectList("reviewReplyMapper.selectReviewReplyList", ref_rid);
		return (ArrayList<ReviewReply>)list;
	}

	public ReviewReply selectReviewReply(int rrid) {
		return sqlSession.selectOne("reviewReplyMapper.selectReviewReply", rrid);
	}

}
