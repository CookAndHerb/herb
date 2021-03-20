package com.kh.herb.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.herb.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService as;
	
	//관리자 페이지 메인
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	//상품관리 페이지
	@RequestMapping("adminProduct.do")
	public String adminProduct() {
		return "admin/adminProduct";
	}
	
	//상품등록 페이지
	@RequestMapping("productIns.do")
	public String productInsPage() {
		return "product/productIns";
	}
}
