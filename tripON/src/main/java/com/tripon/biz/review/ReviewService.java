package com.tripon.biz.review;

import java.util.List;

public interface ReviewService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertReview(ReviewVO vo);

	// 글 수정
	void updateReview(ReviewVO vo);

	// 글삭제
	void deleteReview(ReviewVO vo);

	// 총 게시글 수 조회
	ReviewVO getReviewTotal(ReviewVO vo);
	
	// 글 상세 조회
	ReviewVO getReview(ReviewVO vo);

	// 글 목록 조회
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//게시물 총 개수
	int countReview(ReviewVO vo);	

	
	
	
}
