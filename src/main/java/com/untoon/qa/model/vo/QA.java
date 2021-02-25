package com.untoon.qa.model.vo;

import java.sql.Date;

public class QA implements java.io.Serializable {
	
	private final static long serialVersionUID = 3333L;
	
	private int qid;
	private int cid; // 참조 상세보기 <수업 클래스>
	private String qwriter;
	private String qcontent;
	private Date q_create_date;
	private Date q_modify_date;
	private String q_status;
	
	public QA() {}

	public QA(int qid, int cid, String qwriter, String qcontent, Date q_create_date, Date q_modify_date,
			String q_status) {
		super();
		this.qid = qid;
		this.cid = cid;
		this.qwriter = qwriter;
		this.qcontent = qcontent;
		this.q_create_date = q_create_date;
		this.q_modify_date = q_modify_date;
		this.q_status = q_status;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public Date getQ_create_date() {
		return q_create_date;
	}

	public void setQ_create_date(Date q_create_date) {
		this.q_create_date = q_create_date;
	}

	public Date getQ_modify_date() {
		return q_modify_date;
	}

	public void setQ_modify_date(Date q_modify_date) {
		this.q_modify_date = q_modify_date;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QA [qid=" + qid + ", cid=" + cid + ", qwriter=" + qwriter + ", qcontent=" + qcontent
				+ ", q_create_date=" + q_create_date + ", q_modify_date=" + q_modify_date + ", q_status=" + q_status
				+ "]";
	}
	
	
	

}
