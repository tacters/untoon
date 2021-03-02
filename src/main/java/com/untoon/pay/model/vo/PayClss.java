package com.untoon.pay.model.vo;

import java.sql.Date;

public class PayClss implements java.io.Serializable {
	private static final long serialVersionUID = 2222L;
	
	private int payno;
	private String pid;
	private int cid;
	private Date paydate;
	private String method;
	private int pstatus;
	private String clss_title;
	private String tchr_id;
	private int clss_price;
	private int clss_times;
	private Date clss_start;
	private Date clss_end;
	private int clss_duration;
	
	public PayClss() {}
	
	

	public int getPayno() {
		return payno;
	}



	public void setPayno(int payno) {
		this.payno = payno;
	}



	public String getPid() {
		return pid;
	}



	public void setPid(String pid) {
		this.pid = pid;
	}



	public int getCid() {
		return cid;
	}



	public void setCid(int cid) {
		this.cid = cid;
	}



	public Date getPaydate() {
		return paydate;
	}



	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}



	public String getMethod() {
		return method;
	}



	public void setMethod(String method) {
		this.method = method;
	}



	public int getPstatus() {
		return pstatus;
	}



	public void setPstatus(int pstatus) {
		this.pstatus = pstatus;
	}



	public String getClss_title() {
		return clss_title;
	}



	public void setClss_title(String clss_title) {
		this.clss_title = clss_title;
	}



	public String getTchr_id() {
		return tchr_id;
	}



	public void setTchr_id(String tchr_id) {
		this.tchr_id = tchr_id;
	}



	public int getClss_price() {
		return clss_price;
	}



	public void setClss_price(int clss_price) {
		this.clss_price = clss_price;
	}



	public int getClss_times() {
		return clss_times;
	}



	public void setClss_times(int clss_times) {
		this.clss_times = clss_times;
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



	public int getClss_duration() {
		return clss_duration;
	}



	public void setClss_duration(int clss_duration) {
		this.clss_duration = clss_duration;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public PayClss(int payno, String pid, int cid, Date paydate, String method, int pstatus, String clss_title,
			String tchr_id, int clss_price, int clss_times, Date clss_start, Date clss_end, int clss_duration) {
		super();
		this.payno = payno;
		this.pid = pid;
		this.cid = cid;
		this.paydate = paydate;
		this.method = method;
		this.pstatus = pstatus;
		this.clss_title = clss_title;
		this.tchr_id = tchr_id;
		this.clss_price = clss_price;
		this.clss_times = clss_times;
		this.clss_start = clss_start;
		this.clss_end = clss_end;
		this.clss_duration = clss_duration;
	}



	@Override
	public String toString() {
		return "PayClss [payno=" + payno + ", pid=" + pid + ", cid=" + cid + ", paydate=" + paydate + ", method="
				+ method + ", pstatus=" + pstatus + ", clss_title=" + clss_title + ", tchr_id=" + tchr_id
				+ ", clss_price=" + clss_price + ", clss_times=" + clss_times + ", clss_start=" + clss_start
				+ ", clss_end=" + clss_end + ", clss_duration=" + clss_duration + "]";
	}

	
	
	
}
