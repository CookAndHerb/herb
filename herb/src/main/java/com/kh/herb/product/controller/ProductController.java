package com.kh.herb.product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.product.model.service.ProductService;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.product.model.vo.ProductPage;
import com.kh.herb.review.model.service.ReviewService;
import com.kh.herb.review.model.vo.Review;

@Controller
public class ProductController {
	@Autowired
	ProductService proSe;

	@Autowired
	ReviewService reSe;

	public static final int paseSize = 9; // 화면에 보여줄 상품 개수
	
	// 상품 리스트
	@RequestMapping(value = "product.do", method = RequestMethod.GET)
	public ModelAndView productAllList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name="pSelect", defaultValue = "1") int pSelect, ModelAndView modelAndView) throws Exception {
		int currentPage = pageNum; // 현재 페이지
		int startRow = (currentPage - 1) * paseSize + 1; // 페이지별 시작 로우
		int endRow = currentPage * paseSize; // 페이지별 끝 로우
		ProductPage page = new ProductPage();
		page.setStartPage(startRow);
		page.setEndPage(endRow);
		page.setpSelect(pSelect);
		
		int count = proSe.proCount();

		List<Product> list = proSe.productAllList(page);
		/*
		 * System.out.println("count: "+count);
		 * System.out.println("currentPage: "+currentPage);
		 * System.out.println("startRow: "+startRow);
		 * System.out.println("endRow: "+endRow);
		 */
		modelAndView.addObject("list", list);
		modelAndView.addObject("pageSize", paseSize);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.addObject("count", count);
		modelAndView.addObject("pSelect", pSelect);
		modelAndView.setViewName("product/product");

		return modelAndView;
	}
	
	// 검색시 상품 리스트
	@RequestMapping(value = "productSearch.do", method = RequestMethod.GET)
	public ModelAndView productSearchList(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name = "keyword") String keyword, @RequestParam(name = "search") String search, 
			@RequestParam(name="pSelect") int pSelect, ModelAndView modelAndView) throws Exception {
		int currentPage = pageNum; // 현재 페이지
		int startRow = (currentPage - 1) * paseSize + 1; // 페이지별 시작 로우
		int endRow = currentPage * paseSize; // 페이지별 끝 로우
		
		ProductPage page = new ProductPage();
		page.setKeyword(keyword);
		page.setpCategory(search);
		int count = proSe.proSearchCount(page);
		
		page.setStartPage(startRow);
		page.setEndPage(endRow);
		page.setpSelect(pSelect);
		
		System.out.println("키워드: "+page.getKeyword());
		System.out.println("총 개수: "+count);

		List<Product> list = proSe.productSearchList(page);

		modelAndView.addObject("list", list);
		modelAndView.addObject("pageSize", paseSize);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.addObject("count", count);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("search", search);
		modelAndView.addObject("pSelect", pSelect);
		modelAndView.setViewName("product/product");

		return modelAndView;
	}
	
	//카테고리별 상품 리스트
	@RequestMapping(value="categoryList.do", method=RequestMethod.GET)
	public ModelAndView productCateList(@RequestParam(name="category") String category,
			@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,  
			@RequestParam(name="pSelect") int pSelect, ModelAndView modelAndView) throws Exception {
		
		int currentPage = pageNum; // 현재 페이지
		int startRow = (currentPage - 1) * paseSize + 1; // 페이지별 시작 로우
		int endRow = currentPage * paseSize; // 페이지별 끝 로우
		
		ProductPage page = new ProductPage();
		page.setStartPage(startRow);
		page.setEndPage(endRow);
		page.setpCategory(category);
		page.setpSelect(pSelect);

		int count = proSe.proCategoryCount(category);
		
		List<Product> list = proSe.productCateList(page);

		modelAndView.addObject("list", list);
		modelAndView.addObject("pageSize", paseSize);
		modelAndView.addObject("currentPage", currentPage);
		modelAndView.addObject("count", count);
		modelAndView.addObject("category",category);
		modelAndView.addObject("pSelect", pSelect);
		modelAndView.setViewName("product/product");
		
		return modelAndView;
	}	
	
	

	// 상품 상세페이지
	@RequestMapping("productInfo.do")
	public ModelAndView shopInfo(HttpServletRequest request, ModelAndView modelAndView, @RequestParam("num") int num)
			throws Exception {

		Product product = proSe.productInfo(num); // 상품 정보
		List<ProductFile> productFile = proSe.productInfoFile(num);
		List<Review> review = reSe.reviewAllList(num); // 리뷰 리스트

		int reAvg = 0;

		if (!review.isEmpty()) {
			reAvg = reSe.reviewAvg(num);
		}
		System.out.println("리뷰 평균: " + reAvg);

		modelAndView.addObject("num", num);
		modelAndView.addObject("vo", product);
		modelAndView.addObject("file", productFile);
		modelAndView.addObject("review", review);
		modelAndView.addObject("reAvg", reAvg);

		modelAndView.setViewName("product/productInfo");

		return modelAndView;

	}

}
