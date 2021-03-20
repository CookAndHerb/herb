package com.kh.herb.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.herb.review.model.service.ReviewService;
import com.kh.herb.review.model.vo.Review;
import com.kh.herb.review.model.vo.ReviewFile;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reSe;
	
	// 리뷰 등록
	@RequestMapping(value="reviewInsert.do", method=RequestMethod.POST)
	public ModelAndView reInsert(HttpServletRequest request, ModelAndView modelAndView, Review review) throws Exception{		
		System.out.println("Controller reInsert 메서드 실행");
		reSe.reviewInsert(review);
		
		List<MultipartFile> files = review.getFileName();
		List<ReviewFile> fList = new ArrayList<ReviewFile>();
		
		if(files != null) {
			for(MutipartFile file : files) {
				// 원래 파일명
				
			}
		}
		
		modelAndView.addObject("num", review.getpNum()); // 상품인포 주소에 들어갈 번호
		modelAndView.setViewName("product/reviewComplete");
		
		return modelAndView;
	}
	
}
