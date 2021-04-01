package com.kh.herb.review.model.service;

import java.util.List;

import com.kh.herb.review.model.vo.Review;
import com.kh.herb.review.model.vo.ReviewFile;

public interface ReviewService {
	
	public List<Review> reviewAllList(int pNum) throws Exception;
	
	public int reviewInsert(Review review) throws Exception;
	
	public int reviewAvg(int pNum) throws Exception;
	
	public int reviewCount(int pNum) throws Exception;
	
	public int reviewDelete(int rNum) throws Exception;
	
	public int reviewFileDelete(int rNum) throws Exception;
	
	public String reviewOrderCheck(Review review) throws Exception;
	
	public List<ReviewFile> getReviewFile(int rNum) throws Exception;
	
	public int reviewUpdate(Review review) throws Exception;
	
	public int oldFileDelete(Review review) throws Exception;
	
}
