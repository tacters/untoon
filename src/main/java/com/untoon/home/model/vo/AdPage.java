package com.untoon.home.model.vo;

public class AdPage {
	private int startRow;
	private int endRow;
	
	public AdPage() {}

	public AdPage(int startRow, int endRow) {
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
		return "AdPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
