package com.untoon.qa.model.service;

import java.util.ArrayList;

import com.untoon.qa.model.vo.QaReply;

public interface QaReplyService {
	
	ArrayList<QaReply> selectQaReplyList(int ref_qid);
	int insertQaReply(QaReply qaReply);
	int updateQaReply(QaReply qaReply);
	int deleteQaReply(int qaid);
	int selectQaReply(int qaid);
}
