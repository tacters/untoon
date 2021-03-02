package com.untoon.home.model.vo;

import java.sql.Date;

public class Ad implements java.io.Serializable {
	
	private static final long serialVersionUID = 2222L;
	
	private int adid;
	private String ad_title;
	private int ad_xy;
	private Date ad_start;
	private Date ad_end;
	private String a_status;
	private int ad_width;
	private int ad_height;
	private int ad_close; //필요 없는 컬럼 일 수도 있음 : 창닫기 방법: 1=오늘 하루 열지 않음, 2=다시 열지 않음
	

	public Ad() {}
	
	public Ad(int adid, String ad_title, int ad_xy, Date ad_start, Date ad_end, String a_status, int ad_width,
			int ad_height, int ad_close) {
		super();
		this.adid = adid;
		this.ad_title = ad_title;
		this.ad_xy = ad_xy;
		this.ad_start = ad_start;
		this.ad_end = ad_end;
		this.a_status = a_status;
		this.ad_width = ad_width;
		this.ad_height = ad_height;
		this.ad_close = ad_close;
	} 
	

	public int getAdid() {
		return adid;
	}

	public void setAdid(int adid) {
		this.adid = adid;
	}

	public String getAd_title() {
		return ad_title;
	}

	public void setAd_title(String ad_title) {
		this.ad_title = ad_title;
	}

	public int getAd_xy() {
		return ad_xy;
	}

	public void setAd_xy(int ad_xy) {
		this.ad_xy = ad_xy;
	}

	public Date getAd_start() {
		return ad_start;
	}

	public void setAd_start(Date ad_start) {
		this.ad_start = ad_start;
	}

	public Date getAd_end() {
		return ad_end;
	}

	public void setAd_end(Date ad_end) {
		this.ad_end = ad_end;
	}

	public String getA_status() {
		return a_status;
	}

	public void setA_status(String a_status) {
		this.a_status = a_status;
	}

	public int getAd_width() {
		return ad_width;
	}

	public void setAd_width(int ad_width) {
		this.ad_width = ad_width;
	}

	public int getAd_height() {
		return ad_height;
	}

	public void setAd_height(int ad_height) {
		this.ad_height = ad_height;
	}

	public int getAd_close() {
		return ad_close;
	}

	public void setAd_close(int ad_close) {
		this.ad_close = ad_close;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Ad [adid=" + adid + ", ad_title=" + ad_title + ", ad_xy=" + ad_xy + ", ad_start=" + ad_start
				+ ", ad_end=" + ad_end + ", a_status=" + a_status + ", ad_width=" + ad_width + ", ad_height="
				+ ad_height + ", ad_close=" + ad_close + "]";
	}
	
	
	
	
	

}
