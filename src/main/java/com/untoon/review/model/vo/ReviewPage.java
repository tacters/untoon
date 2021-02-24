package com.untoon.review.model.vo;

public class ReviewPage {
	
	private int startRow;
	private int endRow;
	private int cid; //새로 추가해봄
	
	public ReviewPage() {}

	public ReviewPage(int startRow, int endRow, int cid) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.cid = cid;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "ReviewPage [startRow=" + startRow + ", endRow=" + endRow + ", cid=" + cid + "]";
	}

	
}

