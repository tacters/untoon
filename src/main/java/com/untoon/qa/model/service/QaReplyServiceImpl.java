package com.untoon.qa.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.untoon.qa.model.dao.QaReplyDao;
import com.untoon.qa.model.vo.QaReply;

@Service("qaReplyService")
public class QaReplyServiceImpl implements QaReplyService {
	
	@Autowired
	private QaReplyDao qareplyDao;

	@Override
	public int insertQaReply(QaReply qaReply) {
		return qareplyDao.insertQaReply(qaReply);
	}

	@Override
	public int updateQaReply(QaReply qaReply) {
		return qareplyDao.updateQaReply(qaReply);
	}

	@Override
	public int deleteQaReply(int qaid) {
		return qareplyDao.deleteQaReply(qaid);
	}

	@Override
	public int selectQaReply(int qaid) {
		return qareplyDao.selectQaReply(qaid);
	}
	
	@Override
	public ArrayList<QaReply> selectQaReplyList(int ref_qid) {
		return qareplyDao.selectQaReplyList(ref_qid);
	}

}
