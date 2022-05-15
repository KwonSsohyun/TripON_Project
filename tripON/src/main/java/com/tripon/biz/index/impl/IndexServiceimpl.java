package com.tripon.biz.index.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.activity.ActivityVO;
import com.tripon.biz.category.CategoryVO;
import com.tripon.biz.index.IndexService;
import com.tripon.biz.notice.NoticeVO;

@Service
public class IndexServiceimpl implements IndexService {
	@Autowired
	private IndexDAOMybatis indexDAOMybatis;

	@Override
	public List<String> getSearchResult(String searchKeyword) {
		System.out.println("serviceimpl : " + searchKeyword);
		return indexDAOMybatis.getSearchResult(searchKeyword);
	}
	
	@Override
	public List<CategoryVO> getSearchCategoryList(String searchKeyword) {
		return indexDAOMybatis.getSearchCategoryList(searchKeyword);
	}
	
	@Override
	public List<ActivityVO> getSearchActivityList(String searchKeyword) {
		return indexDAOMybatis.getSearchActivityList(searchKeyword);
	}
	
	@Override
	public List<CategoryVO> getPopularCategory(CategoryVO vo) {
		return indexDAOMybatis.getPopularCategory(vo);
	}
	
	@Override
	public List<ActivityVO> getPopularActivity(ActivityVO vo) {
		return indexDAOMybatis.getPopularActivity(vo);
	}
	
	@Override
	public List<NoticeVO> getIndexNoticeList(NoticeVO vo) {
		return indexDAOMybatis.getIndexNoticeList(vo);
	}

	@Override
	public NoticeVO getUserNoticeCount(NoticeVO vo) {
		return indexDAOMybatis.getUserNoticeCount(vo);
	}

	@Override
	public List<NoticeVO> getUserNotice(NoticeVO vo) {
		return indexDAOMybatis.getUserNotice(vo);
	}

}
