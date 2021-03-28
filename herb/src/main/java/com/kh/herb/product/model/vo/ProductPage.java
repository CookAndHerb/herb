package com.kh.herb.product.model.vo;

public class ProductPage {
	private int startPage;
	private int endPage;
	private String pCategory;
	private String pSelect;
	private String keyword;
	
	public ProductPage() {}
	
	public ProductPage(int startPage, int endPage, String pCategory, String pSelect, String keyword) {
		this.startPage = startPage;
		this.endPage = endPage;
		this.pCategory = pCategory;
		this.pSelect = pSelect;
		this.keyword = keyword;
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpSelect() {
		return pSelect;
	}
	public void setpSelect(String pSelect) {
		this.pSelect = pSelect;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
