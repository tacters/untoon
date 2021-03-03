package com.untoon.member.model.vo;

public class MemberPage {
	
	private int startRow;
	private int endRow;
	
	public MemberPage() {}

	public MemberPage(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
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

	@Override
	public String toString() {
		return "MemberPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	
	
	

}
