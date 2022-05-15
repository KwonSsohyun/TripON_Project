package com.tripon.biz.activity;

import java.util.List;

public interface ActivityService {

	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertActivity(ActivityVO vo);

	// 글 수정
	void updateActivity(ActivityVO vo);

	// 글삭제
	void deleteActivity(ActivityVO vo);

	// 총 게시글 수 조회
	ActivityVO getActivityTotal(ActivityVO vo);
	
	// 글 상세 조회
	ActivityVO getActivity(ActivityVO vo);

	// 글 목록 조회
	List<ActivityVO> getUserActivityList(ActivityVO vo);
	
	// 글 목록 조회
	List<ActivityVO> getActivityList(ActivityVO vo);
	
	//Detail 페이지 조회;
	ActivityVO getUserdetailsPage(ActivityVO vo);
	
	//게시물 총 개수
	int countActivity(ActivityVO vo);	
	
}
