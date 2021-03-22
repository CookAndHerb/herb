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
import com.kh.herb.product.model.vo.Product;

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
	
	//회원관리 페이지
	@RequestMapping("adminMember.do")
	public String adminMember() {
		return "admin/adminMember";
	}
	
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
	
	//상품등록 컨트롤러
	@RequestMapping(value="productIns.do", method=RequestMethod.POST)
	public ModelAndView insertProduct(ModelAndView mav, Product product, MultipartHttpServletRequest request) throws Exception {
		System.out.println("상품등록 메소드");
		
		String pName = request.getParameter("pName");
		int pCost = Integer.parseInt(request.getParameter("pCost"));
		List<MultipartFile> imagefileList = request.getFiles("imageName");
		String imageName = null;
		for(MultipartFile imagefile : imagefileList) {
			imageName = imagefile.getOriginalFilename();
			imageUplode(imagefile, product, request);
		}
		String imagePath;
		String pContent = request.getParameter("pContent");
		String pMaDate = request.getParameter("pMaDate");
		String pExDate = request.getParameter("pExDate");
		String pCapacity = request.getParameter("pCatacity");
		String pType = request.getParameter("pType");
		MultipartFile infoImageFile = request.getFile("infoImageName");
		String infoImageName = infoImageFile.getOriginalFilename();
		imageUplode(infoImageFile, product, request);
		String infoImagePath;
		String pCategory = request.getParameter("pCategory");
			
		product.setpName(pName);
		product.setpCost(pCost);
		product.setImageName(imageName);
		//product.setImagePath(imagePath);
		product.setpContent(pContent);
		product.setpMaDate(pMaDate);
		product.setpExDate(pExDate);
		product.setpCapacity(pCapacity);
		product.setpType(pType);
		product.setInfoImageName(infoImageName);
		//product.setInfoImagePath(infoImagePath);
		product.setpCategory(pCategory);

		
		int result = as.insertProduct(product);
		mav.addObject("result", result);
		mav.setViewName("prduct/productInsComplete");
		return mav;
	}
//	@RequestMapping(value="productIns.do", method=RequestMethod.POST)
//	public ModelAndView insertProduct(ModelAndView mav, Product product, MultipartHttpServletRequest request) throws Exception{	
//		MultipartFile imageName[] = request.getFile("imageName");
//		MultipartFile infoImageName = request.getFile("infoImageName");
//		imageFile(imageName, infoImageName, request);
//		
//		product.setImageName(imageName[]);
//		
//		int result = as.insertProduct(product);
//		mav.addObject("result", result);
//		mav.setViewName("prduct/productInsComplete");
//		return mav;
//	}
	
	//상품 정보 이미지 업로드
	private void imageUplode(MultipartFile image, Product product, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resource");
		String savePath = root+"\\productImg";
		String filePath = null;
		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		filePath = folder+"\\"+image.getOriginalFilename();
		product.setImagePath(filePath);
		product.setInfoImagePath(filePath);
		try {
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
