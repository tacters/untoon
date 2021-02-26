package com.untoon.review.model.vo;

import java.sql.Date;

public class Review implements java.io.Serializable{
	
	private final static long serialVersionUID=3333L;
	
	private int rid;
	private int cid;
	private String rwriter;
	private String rcontent;
	private Date r_create_date;
	private Date r_modify_date;
	private String r_status;
	private String ofile_r;
	private String rfile_r;
	private int save_count;
	
	public Review() {}

	public Review(int rid, int cid, String rwriter, String rcontent, Date r_create_date, Date r_modify_date,
			String r_status, String ofile_r, String rfile_r, int save_count) {
		super();
		this.rid = rid;
		this.cid = cid;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.r_create_date = r_create_date;
		this.r_modify_date = r_modify_date;
		this.r_status = r_status;
		this.ofile_r = ofile_r;
		this.rfile_r = rfile_r;
		this.save_count = save_count;
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

	public String getOfile_r() {
		return ofile_r;
	}

	public void setOfile_r(String ofile_r) {
		this.ofile_r = ofile_r;
	}

	public String getRfile_r() {
		return rfile_r;
	}

	public void setRfile_r(String rfile_r) {
		this.rfile_r = rfile_r;
	}

	public int getSave_count() {
		return save_count;
	}

	public void setSave_count(int save_count) {
		this.save_count = save_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [rid=" + rid + ", cid=" + cid + ", rwriter=" + rwriter + ", rcontent=" + rcontent
				+ ", r_create_date=" + r_create_date + ", r_modify_date=" + r_modify_date + ", r_status=" + r_status
				+ ", ofile_r=" + ofile_r + ", rfile_r=" + rfile_r + ", save_count=" + save_count + "]";
	}


}
