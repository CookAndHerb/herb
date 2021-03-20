package com.kh.herb.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.herb.review.model.service.ReviewService;
import com.kh.herb.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reSe;
	
	// 리뷰 등록
	@RequestMapping(value="reviewInsert.do", method=RequestMethod.POST)
	public ModelAndView reInsert(RedirectAttributes Redirect, ModelAndView modelAndView, Review review) throws Exception{		
		reSe.reviewInsert(review);
		modelAndView.addObject("num", review.getpNum()); // 상품인포 주소에 들어갈 번호
		
		
		modelAndView.setViewName("product/reviewComplete");
		
		return modelAndView;
	}
	
}
