package com.kh.herb.faq.model.vo;

import java.sql.Date;

public class Faq {

	private int faqNum;
	private String faqTitle;
	private int faqCategory;
	private String faqContent;
	private String faqWriter;
	private Date faqDate;
	private int readcount;
	
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public int getFaqCategory() {
		return faqCategory;
	}
	public void setFaqCategory(int faqCategory) {
		this.faqCategory = faqCategory;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public String getFaqWriter() {
		return faqWriter;
	}
	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}
	public Date getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}