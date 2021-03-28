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
	public void reviewInsert(Review review) throws Exception {
		System.out.println("reviewService insert 메서드 실행");
		dao.reviewInsert(review); 
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

}
