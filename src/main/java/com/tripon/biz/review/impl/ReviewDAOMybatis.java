package com.tripon.biz.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.review.ReviewVO;

@Repository
public class ReviewDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertReview(ReviewVO vo) {
		System.out.println("===> Mybatis로 insertReview() 기능 처리");
		mybatis.insert("ReviewDAO.insertReview", vo);
	}

	public void updateReview(ReviewVO vo) {
		System.out.println("===> Mybatis로 updateReview() 기능 처리");
		mybatis.update("ReviewDAO.updateReview", vo);
	}

	public void deleteReview(ReviewVO vo) {
		System.out.println("===> Mybatis로 deleteReview() 기능 처리" + vo.getReview_num());
		mybatis.delete("ReviewDAO.deleteReview", vo);
	}

	public ReviewVO getReviewTotal(ReviewVO vo) {
		System.out.println("===> Mybatis로 getReviewTotal() 기능 처리");
		return (ReviewVO) mybatis.selectOne("ReviewDAO.getReviewTotal", vo);
	}

	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("===> Mybatis로 getReview() 기능 처리");
		return (ReviewVO) mybatis.selectOne("ReviewDAO.getReview", vo);
	}

	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("===> Mybatis로 getReviewList() 기능 처리");
		return mybatis.selectList("ReviewDAO.getReviewList", vo);
	}
	
	public int countReview(ReviewVO vo) {
		return mybatis.selectOne("ReviewDAO.countReview", vo);
	}

}
