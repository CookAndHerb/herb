package com.kh.herb.review.model.service;

import java.util.List;

import com.kh.herb.review.model.vo.Review;

public interface ReviewService {
	
	public List<Review> reviewAllList(int pNum) throws Exception;
	
	public int reviewInsert(Review review) throws Exception;
}
