package com.tripon.biz.activity.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.activity.ActivityVO;

@Repository
public class ActivityDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertActivity(ActivityVO vo) {
		System.out.println("===> Mybatis로 insertActivity() 기능 처리");
		mybatis.insert("ActivityDAO.insertActivity", vo);
	}

	public void updateActivity(ActivityVO vo) {
		System.out.println("===> Mybatis로 updateActivity() 기능 처리");
		mybatis.update("ActivityDAO.updateActivity", vo);
	}

	public void deleteActivity(ActivityVO vo) {
		System.out.println("===> Mybatis로 deleteActivity() 기능 처리");
		mybatis.delete("ActivityDAO.deleteActivity", vo);
	}

	public ActivityVO getActivityTotal(ActivityVO vo) {
		System.out.println("===> Mybatis로 getActivityTotal() 기능 처리");
		return (ActivityVO) mybatis.selectOne("ActivityDAO.getActivityTotal", vo);
	}

	public ActivityVO getActivity(ActivityVO vo) {
		System.out.println("===> Mybatis로 getActivity() 기능 처리");
		return (ActivityVO) mybatis.selectOne("ActivityDAO.getActivity", vo);
	}

	public List<ActivityVO> getUserActivityList(ActivityVO vo) {
		System.out.println("===> Mybatis로 getUserActivityList() 기능 처리");
		return mybatis.selectList("ActivityDAO.getUserActivityList", vo);
	}
	
	public List<ActivityVO> getActivityList(ActivityVO vo) {
		System.out.println("===> Mybatis로 getActivityList() 기능 처리");
		return mybatis.selectList("ActivityDAO.getActivityList", vo);
	}
	
	public ActivityVO getUserdetailsPage(ActivityVO vo) {
		System.out.println("===> Mybatis로 getUserdetailsPage() 기능 처리");
		return mybatis.selectOne("ActivityDAO.getUserdetailsPage", vo);
	}
	
	public int countActivity(ActivityVO vo) {
		return mybatis.selectOne("ActivityDAO.countActivity", vo);
	}

}
