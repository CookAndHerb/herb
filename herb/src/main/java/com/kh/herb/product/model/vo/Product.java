package com.kh.herb.product.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Product {
	private int pNum;
	private String pName;
	private int pCost;
	private String ImageName;
	private String ImagePath;
	private String pContent;
	private int pStar;
	private int pSell;
	private Date pMaDate;
	private Date pExDate;
	private String pCapacity;
	private String pType;
	private String infoImageName;
	private String infoImagePath;
	private String pCategory;
	
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
	public String getImageName() {
		return ImageName;
	}
	public void setImageName(String imageName) {
		ImageName = imageName;
	}
	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public int getpStar() {
		return pStar;
	}
	public void setpStar(int pStar) {
		this.pStar = pStar;
	}
	public int getpSell() {
		return pSell;
	}
	public void setpSell(int pSell) {
		this.pSell = pSell;
	}
	public Date getpMaDate() {
		return pMaDate;
	}
	public void setpMaDate(Date pMaDate) {
		this.pMaDate = pMaDate;
	}
	public Date getpExDate() {
		return pExDate;
	}
	public void setpExDate(Date pExDate) {
		this.pExDate = pExDate;
	}
	public String getpCapacity() {
		return pCapacity;
	}
	public void setpCapacity(String pCapacity) {
		this.pCapacity = pCapacity;
	}
	public String getpType() {
		return pType;
	}
	public void setpType(String pType) {
		this.pType = pType;
	}
	public String getInfoImageName() {
		return infoImageName;
	}
	public void setInfoImageName(String infoImageName) {
		this.infoImageName = infoImageName;
	}
	public String getInfoImagePath() {
		return infoImagePath;
	}
	public void setInfoImagePath(String infoImagePath) {
		this.infoImagePath = infoImagePath;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	
	
}