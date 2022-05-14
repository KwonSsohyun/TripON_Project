package com.tripon.biz.faq;

import java.util.List;

public interface FaqService {
	
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertFaq(FaqVO vo);
	
	// 글 수정
	void updateFaq(FaqVO vo);
	
	// 글 삭제
	void deleteFaq(FaqVO vo);
	
	// 총 게시글 수 조회
	int getFaqTotal(FaqVO vo);
	
	// 글 상세 조회
	FaqVO getFaq(FaqVO vo);
	
	// 글 목록 조회
	List<FaqVO> getFaqList(FaqVO vo);

	int getUserFaqTotal(FaqVO vo);
	
	List<FaqVO> getUserFaqList(FaqVO vo);
	
}
