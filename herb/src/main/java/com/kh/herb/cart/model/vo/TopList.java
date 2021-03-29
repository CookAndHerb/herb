package com.kh.herb.cart.model.vo;

public class TopList {

	private int rNum;
	private int pNum;
	private String pName;
	private int pCost;
	private String pImageName;
	private int pSell;
	
	public TopList() {}
	
	public TopList(int rNum, int pNum, String pName, int pCost, String pImageName, int pSell) {
		super();
		this.rNum = rNum;
		this.pNum = pNum;
		this.pName = pName;
		this.pCost = pCost;
		this.pImageName = pImageName;
		this.pSell = pSell;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpCost() {
		return pCost;
	}

	public void setpCost(int pCost) {
		this.pCost = pCost;
	}

	public String getpImageName() {
		return pImageName;
	}

	public void setpImageName(String pImageName) {
		this.pImageName = pImageName;
	}

	public int getpSell() {
		return pSell;
	}

	public void setpSell(int pSell) {
		this.pSell = pSell;
	}
	
	
}
