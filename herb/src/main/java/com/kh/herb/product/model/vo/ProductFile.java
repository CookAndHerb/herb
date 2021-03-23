package com.kh.herb.product.model.vo;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ProductFile {
	private int pInfoNum;
	private int pNum;
	private MultipartFile pInfoFiles;
	private String pInfoFile;
	private String pInfoPath;
	
	public ProductFile() {}
	public ProductFile(int pInfoNum, int pNum, MultipartFile pInfoFiles, String pInfoFile, String pInfoPath) {
		super();
		this.pInfoNum = pInfoNum;
		this.pNum = pNum;
		this.pInfoFiles = pInfoFiles;
		this.pInfoFile= pInfoFile;
		this.pInfoPath = pInfoPath;
	}
	
	public int getpInfoNum() {
		return pInfoNum;
	}
	public void setpInfoNum(int pInfoNum) {
		this.pInfoNum = pInfoNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public MultipartFile getpInfoFiles() {
		return pInfoFiles;
	}
	public void setpInfoFiles(MultipartFile pInfoFiles) {
		this.pInfoFiles = pInfoFiles;
	}
	public String getpInfoFile() {
		return pInfoFile;
	}
	public void setpInfoFile(String pInfoFile) {
		this.pInfoFile = pInfoFile;
	}
	public String getpInfoPath() {
		return pInfoPath;
	}
	public void setpInfoPath(String pInfoPath) {
		this.pInfoPath = pInfoPath;
	}
	
	
}
