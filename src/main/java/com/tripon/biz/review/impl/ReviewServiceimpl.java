package com.tripon.biz.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.review.ReviewService;
import com.tripon.biz.review.ReviewVO;

@Service("ReviewService")
public class ReviewServiceimpl implements ReviewService {

	@Autowired
	private ReviewDAOMybatis reviewDAO;
	

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO getReviewTotal(ReviewVO vo) {
		return reviewDAO.getReviewTotal(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}
	
	@Override
	public int countReview(ReviewVO vo) {
		return reviewDAO.countReview(vo);
	}

}
