package com.untoon.review.model.vo;

import java.sql.Date;

public class ReviewReply {
	
	private int rrid;
	private int ref_rid;
	private int ref_rcid;
	private String rrcontent;
	private String rrwriter;
	private Date rr_create_date;
	private Date rr_modify_date;
	private String rr_status;
	
	public ReviewReply() {}

	public ReviewReply(int rrid, int ref_rid, int ref_rcid, String rrcontent, String rrwriter, Date rr_create_date,
			Date rr_modify_date, String rr_status) {
		super();
		this.rrid = rrid;
		this.ref_rid = ref_rid;
		this.ref_rcid = ref_rcid;
		this.rrcontent = rrcontent;
		this.rrwriter = rrwriter;
		this.rr_create_date = rr_create_date;
		this.rr_modify_date = rr_modify_date;
		this.rr_status = rr_status;
	}

	public int getRrid() {
		return rrid;
	}

	public void setRrid(int rrid) {
		this.rrid = rrid;
	}

	public int getRef_rid() {
		return ref_rid;
	}

	public void setRef_rid(int ref_rid) {
		this.ref_rid = ref_rid;
	}

	public int getRef_rcid() {
		return ref_rcid;
	}

	public void setRef_rcid(int ref_rcid) {
		this.ref_rcid = ref_rcid;
	}

	public String getRrcontent() {
		return rrcontent;
	}

	public void setRrcontent(String rrcontent) {
		this.rrcontent = rrcontent;
	}

	public String getRrwriter() {
		return rrwriter;
	}

	public void setRrwriter(String rrwriter) {
		this.rrwriter = rrwriter;
	}

	public Date getRr_create_date() {
		return rr_create_date;
	}

	public void setRr_create_date(Date rr_create_date) {
		this.rr_create_date = rr_create_date;
	}

	public Date getRr_modify_date() {
		return rr_modify_date;
	}

	public void setRr_modify_date(Date rr_modify_date) {
		this.rr_modify_date = rr_modify_date;
	}

	public String getRr_status() {
		return rr_status;
	}

	public void setRr_status(String rr_status) {
		this.rr_status = rr_status;
	}

	@Override
	public String toString() {
		return "ReviewReply [rrid=" + rrid + ", ref_rid=" + ref_rid + ", ref_rcid=" + ref_rcid + ", rrcontent="
				+ rrcontent + ", rrwriter=" + rrwriter + ", rr_create_date=" + rr_create_date + ", rr_modify_date="
				+ rr_modify_date + ", rr_status=" + rr_status + "]";
	}
	
	


}
