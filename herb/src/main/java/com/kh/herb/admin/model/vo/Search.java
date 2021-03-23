package com.kh.herb.admin.model.vo;

public class Search {
	private String select;
	private String keyword;
	
	public Search() {}
	public Search(String select, String keyword) {
		super();
		this.select = select;
		this.keyword = keyword;
	}
	
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
