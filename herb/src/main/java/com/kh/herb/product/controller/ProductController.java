package com.kh.herb.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.service.ProductService;
import com.kh.herb.product.model.vo.Product;
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
	
		Product product = proSe.productInfo(num);	// 상품 정보
		List<Review> review = reSe.reviewAllList(num);	// 리뷰 리스트
		
		modelAndView.addObject("num",num);
		modelAndView.addObject("vo",product);
		modelAndView.addObject("review",review);
		modelAndView.setViewName("product/productInfo");

		return modelAndView;
		
	}
	
}
