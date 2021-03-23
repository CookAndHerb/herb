package com.kh.herb.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.admin.model.service.AdminService;
import com.kh.herb.admin.model.vo.Search;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

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
	
//	//회원관리 페이지
//	@RequestMapping("adminMember.do")
//	public String adminMember() {
//		return "admin/adminMember";
//	}
	
	//주문관리 페이지
	@RequestMapping("adminOrder.do")
	public String adminOrder() {
		return "admin/adminOrder";
	}
	
	//상품등록 페이지
	@RequestMapping("productIns.do")
	public String productInsPage() {
		return "product/productIns";
	}
	
	//상품등록
	@RequestMapping(value="productIns.do", method=RequestMethod.POST)
	public ModelAndView insertProduct(ModelAndView mav, Product product, ProductFile pf, 
			@RequestParam("pInfoFiles") MultipartFile pInfoFiles[], MultipartHttpServletRequest request) throws Exception {
		Product fileProduct = imageUplode(product, request);
		
		product.setImageName(fileProduct.getImageName());
		product.setImagePath(fileProduct.getImagePath());

		
		int result1 = as.insertProduct(product);
		//System.out.println(product.getpNum());
		
		ProductFile infoFile = new ProductFile();
		
;
		for(MultipartFile productInfo : pInfoFiles) {
			 infoFile = infoImage(productInfo, request);
			 pf.setpInfoFile(infoFile.getpInfoFile());
			 pf.setpInfoPath(infoFile.getpInfoPath());
			 int cnt = as.insertFile(pf);
		}
		
		
//		pf.setpInfoFile(infoFile.getpInfoFile());
//		pf.setpInfoPath(infoFile.getpInfoPath());
//		
//		int result2 = as.insertFile(pf);
		
		mav.addObject("result1", result1);
		mav.setViewName("product/productInsComplete");
		return mav;
	}
	
	//상품 대표 이미지 업로드
	private Product imageUplode(Product product, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resource");
		//String root = "C:\\finalproject\\herb\\herb\\herb\\src\\main\\webapp\\resources";
		String savePath = root+"\\productImg";
		String filePath = null;
		MultipartFile image = product.getImage();
		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		filePath = savePath+"\\"+image.getOriginalFilename();
		//product.setImagePath(filePath);
		//product.setInfoImagePath(filePath);
		try {
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		product = new Product();
		product.setImageName(image.getOriginalFilename());
		product.setImagePath(savePath);
		return product;
	}
	
	//상품 정보 이미지 업로드
	private ProductFile infoImage(MultipartFile infoImage, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resource");
		//String root = "C:\\finalproject\\herb\\herb\\herb\\src\\main\\webapp\\resources";
		String savePath = root+"\\productImg";
		String filePath = null;
		MultipartFile image = infoImage;
		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		
		//product.setImagePath(filePath);
		//product.setInfoImagePath(filePath);
		try {
			filePath = savePath+"\\"+image.getOriginalFilename();
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ProductFile pf = new ProductFile();
		pf.setpInfoFile(image.getOriginalFilename());
		pf.setpInfoPath(savePath);
		return pf;
	}
	
	
	//회원관리
	@RequestMapping("adminMember.do")
	public ModelAndView memberList(ModelAndView mav) throws Exception{
		List<Member> memberList = as.memberList();
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/adminMember");
		return mav;
	}
	
	//회원 검색
	@RequestMapping("searchMember.do")
	public ModelAndView searchMember(ModelAndView mav, @RequestParam(value="select") String select, 
			@RequestParam(value="keyword") String keyword, Search search) throws Exception{
		System.out.println("select : "+select);
		System.out.println("keyword : "+keyword);
		search.setSelect(select);
		search.setKeyword(keyword);
		List<Member> searchMember = as.searchMember(search);
		mav.addObject("searchMember", searchMember);
		mav.setViewName("admin/searchMember");
		return mav;
	}
}
