package com.tripon.biz.index.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.activity.ActivityVO;
import com.tripon.biz.category.CategoryVO;
import com.tripon.biz.notice.NoticeVO;

@Repository
public class IndexDAOMybatis {
	@Autowired
	private SqlSession mybatis;
	
	public List<String> getSearchResult(String searchKeyword) {
		List<String> list1 = mybatis.selectList("IndexDAO.getCategoryNames", searchKeyword);
		List<String> list2 = mybatis.selectList("IndexDAO.getActivityMaintitles", searchKeyword);
		List<String> searchResult = new ArrayList<String>();
		searchResult.addAll(list1);
		searchResult.addAll(list2);
		return searchResult;
	}
	
	public List<CategoryVO> getSearchCategoryList(String searchKeyword) {
		return mybatis.selectList("IndexDAO.getSearchCategoryList", searchKeyword);
	}
	
	public List<ActivityVO> getSearchActivityList(String searchKeyword) {
		return mybatis.selectList("IndexDAO.getSearchActiviryList", searchKeyword);
	}
	
	public List<CategoryVO> getPopularCategory(CategoryVO vo) {
		return mybatis.selectList("IndexDAO.getPopularCategory", vo);
	}
	
	public List<ActivityVO> getPopularActivity(ActivityVO vo) {
		return mybatis.selectList("IndexDAO.getPopularActivity", vo);
	}
	
	public List<NoticeVO> getIndexNoticeList(NoticeVO vo) {
		return mybatis.selectList("IndexDAO.getIndexNoticeList", vo);
	}
	
	public NoticeVO getUserNoticeCount(NoticeVO vo) {
		return (NoticeVO) mybatis.selectOne("IndexDAO.getUserNoticeCount", vo);
	}
	public List<NoticeVO> getUserNotice(NoticeVO vo) {
		return mybatis.selectList("IndexDAO.getUserNotice", vo);
	}
}
