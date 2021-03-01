package com.untoon.qa.model.vo;

import java.sql.Date;

public class QaClss {

	private int qid;
	private static int cid; // 참조 상세보기 <수업 클래스>
	private String qwriter;
	private String qcontent;
	private Date q_create_date;
	private Date q_modify_date;
	private String q_status;
}
