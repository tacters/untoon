package com.untoon.pay.model.vo;

import java.sql.Date;

public class Pay implements java.io.Serializable {
	private static final long serialVersionUID = 2222L;
	
	private int payno;
	private String pid;
	private int cid;
	private Date paydate;
	private String method;
	private int pstatus;
	
	
	
	public Pay() {}

	public Pay(int payno, String pid, int cid, Date paydate, String method, int pstatus) {
		super();
		this.payno = payno;
		this.pid = pid;
		this.cid = cid;
		this.paydate = paydate;
		this.method = method;
		this.pstatus = pstatus;
	}

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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Pay [payno=" + payno + ", pid=" + pid + ", cid=" + cid + ", paydate=" + paydate + ", method=" + method
				+ ", pstatus=" + pstatus + "]";
	}
	
	
	
	
}
