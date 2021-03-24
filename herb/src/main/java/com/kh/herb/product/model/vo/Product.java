package com.kh.herb.product.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Product {
	private int pNum; //상품번호
	private String pName; //상품명
	private int pCost; //상품가격
	private String ImageName; //이미지 이름
	private String ImagePath; //이미지 경로
	private MultipartFile image;
	private String imageName; //대표 이미지 이름
	private String imagePath; //대표 이미지 경로
	private String pContent; //상세설명
	private int pStar; //별점
	private int pSell; //수량(몇 개 살건지)
	private Date pMaDate; //제조일
	private Date pExDate; //유통기한
	private String pCapacity; //포장단위별용량
	private String pType; //식품의유형(건강기능식픔, 홍삼제품, 기타가공식품)
	private String pCategory; //카테고리
	
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
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}

	
	
}