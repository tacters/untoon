package com.untoon.save.model.vo;

public class SaveClss implements java.io.Serializable{
	private final static long serialVersionUID = 3333L;
	
	private int cid;
	private String id;
	private String clss_category;
	
	public SaveClss() {}

	public SaveClss(int cid, String id, String clss_category) {
		super();
		this.cid = cid;
		this.id = id;
		this.clss_category = clss_category;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getClss_category() {
		return clss_category;
	}

	public void setClss_category(String clss_category) {
		this.clss_category = clss_category;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SaveClss [cid=" + cid + ", id=" + id + ", clss_category=" + clss_category + "]";
	}

	
	

}
