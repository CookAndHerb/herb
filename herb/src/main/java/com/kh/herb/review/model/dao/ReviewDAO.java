package com.kh.herb.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.review.model.vo.Review;
import com.kh.herb.review.model.vo.ReviewFile;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	// 리뷰 리스트 보기
	public List<Review> reviewAllList(int pNum) {
		List<Review> list = sqlSession.selectList("Review.reviewAllList", pNum);
		return list;
	}
	
	// 리뷰 추가
	public void reviewInsert(Review review) {
		System.out.println("ReviewDao insert 메서드 실행");
		System.out.println("===reNum 넣기 전===");
		// 리뷰 추가
		sqlSession.insert("Review.reviewInsert", review);
		// 방금 추가한 리뷰 번호
		int reNum = sqlSession.selectOne("Review.reviewNum");
		
		System.out.println("reNum: "+reNum);
		System.out.println("===rNum 넣기===");

		for (ReviewFile reFile : review.getmFileList()) {
			reFile.setrNum(reNum);
			System.out.println("rFile" + reFile.getrFile());
			System.out.println("rNum : " + reFile.getrNum());
			System.out.println("pNum : " + reFile.getpNum());
			
			sqlSession.insert("Review.reviewFileInsert", reFile);
		}

	}
}
