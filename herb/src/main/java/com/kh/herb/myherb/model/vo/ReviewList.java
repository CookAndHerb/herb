package com.kh.herb.myherb.model.vo;

import java.sql.Date;

public class ReviewList {
	
	private int rwNum;
	private int rNum;
	private String rContent;
	private Date rDate;
	private int rStar;
	private int pNum;
	private String rWriter;
	private String pName;
	
	public ReviewList() {}
	
	public ReviewList(int rwNum, int rNum, String rContent, Date rDate, int rStar, int pNum, String rWriter,
			String pName) {
		super();
		this.rwNum = rwNum;
		this.rNum = rNum;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rStar = rStar;
		this.pNum = pNum;
		this.rWriter = rWriter;
		this.pName = pName;
	}

	public int getRwNum() {
		return rwNum;
	}

	public void setRwNum(int rwNum) {
		this.rwNum = rwNum;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public int getrStar() {
		return rStar;
	}

	public void setrStar(int rStar) {
		this.rStar = rStar;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}
	
	
	
}
