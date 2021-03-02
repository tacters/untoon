package com.untoon.review.model.vo;

import java.sql.Date;

public class ReviewClss {

	private int rid;
	private int cid;
	private String rwriter;
	private String rcontent;
	private Date r_create_date;
	private Date r_modify_date;
	private String r_status;
	private int save_count;
	private String clss_title;
	private Date clss_start;
	private Date clss_end;
	private String tchr_id;
	
	public ReviewClss() {}

	public ReviewClss(int rid, int cid, String rwriter, String rcontent, Date r_create_date, Date r_modify_date,
			String r_status, int save_count, String clss_title, Date clss_start, Date clss_end, String tchr_id) {
		super();
		this.rid = rid;
		this.cid = cid;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.r_create_date = r_create_date;
		this.r_modify_date = r_modify_date;
		this.r_status = r_status;
		this.save_count = save_count;
		this.clss_title = clss_title;
		this.clss_start = clss_start;
		this.clss_end = clss_end;
		this.tchr_id = tchr_id;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getR_create_date() {
		return r_create_date;
	}

	public void setR_create_date(Date r_create_date) {
		this.r_create_date = r_create_date;
	}

	public Date getR_modify_date() {
		return r_modify_date;
	}

	public void setR_modify_date(Date r_modify_date) {
		this.r_modify_date = r_modify_date;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public int getSave_count() {
		return save_count;
	}

	public void setSave_count(int save_count) {
		this.save_count = save_count;
	}

	public String getClss_title() {
		return clss_title;
	}

	public void setClss_title(String clss_title) {
		this.clss_title = clss_title;
	}

	public Date getClss_start() {
		return clss_start;
	}

	public void setClss_start(Date clss_start) {
		this.clss_start = clss_start;
	}

	public Date getClss_end() {
		return clss_end;
	}

	public void setClss_end(Date clss_end) {
		this.clss_end = clss_end;
	}

	public String getTchr_id() {
		return tchr_id;
	}

	public void setTchr_id(String tchr_id) {
		this.tchr_id = tchr_id;
	}

	@Override
	public String toString() {
		return "ReviewClss [rid=" + rid + ", cid=" + cid + ", rwriter=" + rwriter + ", rcontent=" + rcontent
				+ ", r_create_date=" + r_create_date + ", r_modify_date=" + r_modify_date + ", r_status=" + r_status
				+ ", save_count=" + save_count + ", clss_title=" + clss_title + ", clss_start=" + clss_start
				+ ", clss_end=" + clss_end + ", tchr_id=" + tchr_id + "]";
	}
	
	
	
}
