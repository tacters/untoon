package com.untoon.clss.model.vo;

import java.sql.Date;

public class Clss {

	private int cid;
	private String clss_title;
	private int clss_price;
	private Date clss_registration;
	private Date clss_update;
	private String clss_category;
	private String clss_content;
	private int clss_times;
	private Date clss_start;
	private Date clss_end;
	private int clss_duration;
	private int clss_min;
	private int clss_max;
	private int clss_enrolled;
	private String clss_policy;
	private int clss_status;
	private int view_count;
	private String clss_original_filename;
	private String clss_rename_filename;
	private String clss_url;
	private String tchr_id;
	private String tchr_introduction;
	private String tchr_profile;
	private String clss_comment;
	
	public Clss() {}

	public Clss(int cid, String clss_title, int clss_price, Date clss_registration, Date clss_update,
			String clss_category, String clss_content, int clss_times, Date clss_start, Date clss_end,
			int clss_duration, int clss_min, int clss_max, int clss_enrolled, String clss_policy, int clss_status,
			int view_count, String clss_original_filename, String clss_rename_filename, String clss_url, String tchr_id,
			String tchr_introduction, String tchr_profile, String clss_comment) {
		super();
		this.cid = cid;
		this.clss_title = clss_title;
		this.clss_price = clss_price;
		this.clss_registration = clss_registration;
		this.clss_update = clss_update;
		this.clss_category = clss_category;
		this.clss_content = clss_content;
		this.clss_times = clss_times;
		this.clss_start = clss_start;
		this.clss_end = clss_end;
		this.clss_duration = clss_duration;
		this.clss_min = clss_min;
		this.clss_max = clss_max;
		this.clss_enrolled = clss_enrolled;
		this.clss_policy = clss_policy;
		this.clss_status = clss_status;
		this.view_count = view_count;
		this.clss_original_filename = clss_original_filename;
		this.clss_rename_filename = clss_rename_filename;
		this.clss_url = clss_url;
		this.tchr_id = tchr_id;
		this.tchr_introduction = tchr_introduction;
		this.tchr_profile = tchr_profile;
		this.clss_comment = clss_comment;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getClss_title() {
		return clss_title;
	}

	public void setClss_title(String clss_title) {
		this.clss_title = clss_title;
	}

	public int getClss_price() {
		return clss_price;
	}

	public void setClss_price(int clss_price) {
		this.clss_price = clss_price;
	}

	public Date getClss_registration() {
		return clss_registration;
	}

	public void setClss_registration(Date clss_registration) {
		this.clss_registration = clss_registration;
	}

	public Date getClss_update() {
		return clss_update;
	}

	public void setClss_update(Date clss_update) {
		this.clss_update = clss_update;
	}

	public String getClss_category() {
		return clss_category;
	}

	public void setClss_category(String clss_category) {
		this.clss_category = clss_category;
	}

	public String getClss_content() {
		return clss_content;
	}

	public void setClss_content(String clss_content) {
		this.clss_content = clss_content;
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

	public int getClss_min() {
		return clss_min;
	}

	public void setClss_min(int clss_min) {
		this.clss_min = clss_min;
	}

	public int getClss_max() {
		return clss_max;
	}

	public void setClss_max(int clss_max) {
		this.clss_max = clss_max;
	}

	public int getClss_enrolled() {
		return clss_enrolled;
	}

	public void setClss_enrolled(int clss_enrolled) {
		this.clss_enrolled = clss_enrolled;
	}

	public String getClss_policy() {
		return clss_policy;
	}

	public void setClss_policy(String clss_policy) {
		this.clss_policy = clss_policy;
	}

	public int getClss_status() {
		return clss_status;
	}

	public void setClss_status(int clss_status) {
		this.clss_status = clss_status;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getClss_original_filename() {
		return clss_original_filename;
	}

	public void setClss_original_filename(String clss_original_filename) {
		this.clss_original_filename = clss_original_filename;
	}

	public String getClss_rename_filename() {
		return clss_rename_filename;
	}

	public void setClss_rename_filename(String clss_rename_filename) {
		this.clss_rename_filename = clss_rename_filename;
	}

	public String getClss_url() {
		return clss_url;
	}

	public void setClss_url(String clss_url) {
		this.clss_url = clss_url;
	}

	public String getTchr_id() {
		return tchr_id;
	}

	public void setTchr_id(String tchr_id) {
		this.tchr_id = tchr_id;
	}

	public String getTchr_introduction() {
		return tchr_introduction;
	}

	public void setTchr_introduction(String tchr_introduction) {
		this.tchr_introduction = tchr_introduction;
	}

	public String getTchr_profile() {
		return tchr_profile;
	}

	public void setTchr_profile(String tchr_profile) {
		this.tchr_profile = tchr_profile;
	}

	public String getClss_comment() {
		return clss_comment;
	}

	public void setClss_comment(String clss_comment) {
		this.clss_comment = clss_comment;
	}

	@Override
	public String toString() {
		return "Clss [cid=" + cid + ", clss_title=" + clss_title + ", clss_price=" + clss_price + ", clss_registration="
				+ clss_registration + ", clss_update=" + clss_update + ", clss_category=" + clss_category
				+ ", clss_content=" + clss_content + ", clss_times=" + clss_times + ", clss_start=" + clss_start
				+ ", clss_end=" + clss_end + ", clss_duration=" + clss_duration + ", clss_min=" + clss_min
				+ ", clss_max=" + clss_max + ", clss_enrolled=" + clss_enrolled + ", clss_policy=" + clss_policy
				+ ", clss_status=" + clss_status + ", view_count=" + view_count + ", clss_original_filename="
				+ clss_original_filename + ", clss_rename_filename=" + clss_rename_filename + ", clss_url=" + clss_url
				+ ", tchr_id=" + tchr_id + ", tchr_introduction=" + tchr_introduction + ", tchr_profile=" + tchr_profile
				+ ", clss_comment=" + clss_comment + "]";
	}

	
	
	


}
