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
	// 리뷰 리스트
	public List<Review> reviewAllList(int pNum) {
		List<Review> list = sqlSession.selectList("Review.reviewAllList", pNum);
		return list;
	}
	
	// 리뷰 추가
	public int reviewInsert(Review review) {
		System.out.println("ReviewDao insert 메서드 실행");
		System.out.println("===reNum 넣기 전===");
		// 리뷰 추가
		int result = sqlSession.insert("Review.reviewInsert", review);
		
		if(review.getmFileList() != null) {
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
		return result;
		
	}
	// 리뷰 삭제
	public int reviewDelete(int rNum) {
		return sqlSession.delete("Review.reviewDelete",rNum);
	}
	// 리뷰 파일 삭제
	public int reviewDeleteFile(int rNum) {
		return sqlSession.delete("Review.reviewFileDelete",rNum);
	}
	// 별점 평균
	public int reviewAvg(int pNum) {
		return sqlSession.selectOne("Review.reviewAvg",pNum);
	}
	// 리뷰 개수
	public int reviewCount(int pNum) {
		return sqlSession.selectOne("Review.reviewCount",pNum);
	}
	// 배송상태 조회
	public String reviewOrderCheck(Review review) {
		return sqlSession.selectOne("Review.reviewOrderCheck", review);
	}
	// 리뷰 수정할 때 기존 파일 가져오기
	public List<ReviewFile> getReviewFile(int rNum){
		System.out.println("getReviewFile Dao 실행");
		System.out.println("getReviewFile Dao rNum: "+rNum);
		return sqlSession.selectList("Review.getReviewFile", rNum);
	}
	// 리뷰 수정
	public int reviewUpdate(Review review) {
		System.out.println("ReviewDao Update 메서드 실행");
		// 리뷰 수정
		int result = sqlSession.update("Review.reviewUpdate", review);
			
		if(review.getmFileList() != null) {		
			for (ReviewFile reFile : review.getmFileList()) {
				reFile.setrNum(review.getrNum());
				System.out.println("rFile" + reFile.getrFile());
				System.out.println("rNum : " + reFile.getrNum());
				System.out.println("pNum : " + reFile.getpNum());
					
				sqlSession.insert("Review.reviewFileInsert", reFile);
			}
		}
		return result;
			
	}
	// 선택한 기존파일 삭제
	public int oldFileDelete(Review review) {
		System.out.println("ReviewDao oldFileDelete 메서드 실행");
		int result = 0;
		if(review.getOldFileList() != null) {
			for(ReviewFile file : review.getOldFileList()) {
				System.out.println("rFile: "+file.getrFile());
				System.out.println("rNum: "+file.getrNum());
				System.out.println("pNum: "+file.getpNum());
				
				result = sqlSession.delete("Review.oldFileDelete", file);
			}
		}
		return result;
	}
}
