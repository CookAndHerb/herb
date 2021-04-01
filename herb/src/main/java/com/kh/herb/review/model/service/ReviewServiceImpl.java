package com.kh.herb.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.review.model.dao.ReviewDAO;
import com.kh.herb.review.model.vo.Review;
import com.kh.herb.review.model.vo.ReviewFile;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO dao;
	
	@Override
	public int reviewInsert(Review review) throws Exception {
		System.out.println("reviewService insert 메서드 실행");
		return dao.reviewInsert(review); 
	}

	@Override
	public List<Review> reviewAllList(int pNum) throws Exception {
		List<Review> list = dao.reviewAllList(pNum);
		return list;
	}

	@Override
	public int reviewAvg(int pNum) throws Exception {
		return dao.reviewAvg(pNum);
	}

	@Override
	public int reviewCount(int pNum) throws Exception {
		return dao.reviewCount(pNum);
	}

	@Override
	public int reviewDelete(int rNum) throws Exception {
		return dao.reviewDelete(rNum);
	}

	@Override
	public int reviewFileDelete(int rNum) throws Exception {
		return dao.reviewDeleteFile(rNum);
	}

	@Override
	public String reviewOrderCheck(Review review) throws Exception {
		return dao.reviewOrderCheck(review);
	}

	@Override
	public List<ReviewFile> getReviewFile(int rNum) throws Exception {
		return dao.getReviewFile(rNum);
	}

	@Override
	public int reviewUpdate(Review review) throws Exception {
		return dao.reviewUpdate(review);
	}

}
