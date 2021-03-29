package com.kh.herb.product.model.vo;

public class ProductPage {
	private int startPage;
	private int endPage;
	private String pCategory;
	private int pSelect;
	private String keyword;
	
	public ProductPage() {}
	
	public ProductPage(int startPage, int endPage, String pCategory, int pSelect, String keyword) {
		this.startPage = startPage;
		this.endPage = endPage;
		this.pCategory = pCategory;
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

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getpSelect() {
		return pSelect;
	}

	public void setpSelect(int pSelect) {
		this.pSelect = pSelect;
	}

}
