package com.tripon.biz.activity.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.activity.ActivityService;
import com.tripon.biz.activity.ActivityVO;

@Service("ActivityService")
public class ActivityServiceimpl implements ActivityService {

	@Autowired
	private ActivityDAOMybatis activityDAO;
	
	@Override
	public void insertActivity(ActivityVO vo) {
		activityDAO.insertActivity(vo);
	}

	@Override
	public void updateActivity(ActivityVO vo) {
		activityDAO.updateActivity(vo);
	}

	@Override
	public void deleteActivity(ActivityVO vo) {
		activityDAO.deleteActivity(vo);
	}

	@Override
	public ActivityVO getActivityTotal(ActivityVO vo) {
		return activityDAO.getActivityTotal(vo);
	}

	@Override
	public ActivityVO getActivity(ActivityVO vo) {
		return activityDAO.getActivity(vo);
	}

	@Override
	public List<ActivityVO> getUserActivityList(ActivityVO vo) {
		return activityDAO.getUserActivityList(vo);
	}
	
	@Override
	public List<ActivityVO> getActivityList(ActivityVO vo) {
		return activityDAO.getActivityList(vo);
	}
	
	@Override
	public ActivityVO getUserdetailsPage(ActivityVO vo) {
		return activityDAO.getUserdetailsPage(vo);
	}
	
	@Override
	public int countActivity(ActivityVO vo) {
		return activityDAO.countActivity(vo);
	}

}
