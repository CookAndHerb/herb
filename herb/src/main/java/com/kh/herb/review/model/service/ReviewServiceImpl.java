package com.kh.herb.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.review.model.dao.ReviewDAO;
import com.kh.herb.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO dao;
	
	@Override
	public int reviewInsert(Review review) throws Exception {
		
		int result = dao.reviewInsert(review);
		return result;
	}

	@Override
	public List<Review> reviewAllList(int pNum) throws Exception {
		List<Review> list = dao.reviewAllList(pNum);
		return list;
	}

}
