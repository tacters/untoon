package com.untoon.qa.model.vo;

import java.sql.Date;

public class QaReply implements java.io.Serializable {
	private static final long serialVersionUID = 3333L;
	
	private int qaid;
	private int ref_qid;
	private String qacontent;
	private String qawriter;
	private Date qa_create_date;
	private Date qa_modify_date;
	private String qa_status;
	
	public QaReply() {}

	public QaReply(int qaid, int ref_qid, String qacontent, String qawriter, Date qa_create_date, Date qa_modify_date,
			String qa_status) {
		super();
		this.qaid = qaid;
		this.ref_qid = ref_qid;
		this.qacontent = qacontent;
		this.qawriter = qawriter;
		this.qa_create_date = qa_create_date;
		this.qa_modify_date = qa_modify_date;
		this.qa_status = qa_status;
	}

	public int getQaid() {
		return qaid;
	}

	public void setQaid(int qaid) {
		this.qaid = qaid;
	}

	public int getRef_qid() {
		return ref_qid;
	}

	public void setRef_qid(int ref_qid) {
		this.ref_qid = ref_qid;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

	public String getQawriter() {
		return qawriter;
	}

	public void setQawriter(String qawriter) {
		this.qawriter = qawriter;
	}

	public Date getQa_create_date() {
		return qa_create_date;
	}

	public void setQa_create_date(Date qa_create_date) {
		this.qa_create_date = qa_create_date;
	}

	public Date getQa_modify_date() {
		return qa_modify_date;
	}

	public void setQa_modify_date(Date qa_modify_date) {
		this.qa_modify_date = qa_modify_date;
	}

	public String getQa_status() {
		return qa_status;
	}

	public void setQa_status(String qa_status) {
		this.qa_status = qa_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QaReply [qaid=" + qaid + ", ref_qid=" + ref_qid + ", qacontent=" + qacontent + ", qawriter=" + qawriter
				+ ", qa_create_date=" + qa_create_date + ", qa_modify_date=" + qa_modify_date + ", qa_status="
				+ qa_status + "]";
	}
	
	
}