package com.tripon.biz.category;

import java.util.List;

public interface CategoryService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertCategory(CategoryVO vo);

	// 글 수정
	void updateCategory(CategoryVO vo);

	// 글삭제
	void deleteCategory(CategoryVO vo);
	
	// 글 상세 조회
	CategoryVO getCategory(CategoryVO vo);

	// 글 목록 조회
	List<CategoryVO> getCategoryList(CategoryVO vo);
	
	// 관리자 상품등록Cnt
	int getCategoryCnt(CategoryVO vo);	
	
}
