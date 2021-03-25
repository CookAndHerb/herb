package com.kh.herb.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.product.model.service.ProductService;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.review.model.service.ReviewService;
import com.kh.herb.review.model.vo.Review;

@Controller
public class ProductController {
	@Autowired
	ProductService proSe;
	
	@Autowired
	ReviewService reSe;
	
	// 상품 리스트
	@RequestMapping(value="product.do")
	public ModelAndView productAllList(ModelAndView modelAndView) throws Exception {
		List<Product> list = proSe.productAllList();
		modelAndView.addObject("list",list);
		modelAndView.setViewName("product/product");
		
		return modelAndView;
	}
	
	// 상품 상세페이지
	@RequestMapping("productInfo.do")
	public ModelAndView shopInfo(HttpServletRequest request, ModelAndView modelAndView, @RequestParam("num") int num) throws Exception{
		int reAvg = 0;
		int reCount = 0;
		
		Product product = proSe.productInfo(num);	// 상품 정보
		List<ProductFile> productFile = proSe.productInfoFile(num);
		List<Review> review = reSe.reviewAllList(num);	// 리뷰 리스트
		
		if(review.size() > 0) {
			reAvg = reSe.reviewAvg(num);	// 리뷰 평균값
			reCount = reSe.reviewCount(num);	// 리뷰 총 개수
			System.out.println("리뷰 평균: "+reAvg);
			System.out.println("리뷰 개수: "+reCount);
		}
		modelAndView.addObject("num",num);
		modelAndView.addObject("vo",product);
		modelAndView.addObject("file",productFile);
		modelAndView.addObject("review",review);
		modelAndView.addObject("reAvg", reAvg);
		modelAndView.addObject("reCount", reCount);
		
		modelAndView.setViewName("product/productInfo");

		return modelAndView;
		
	}
	
}
