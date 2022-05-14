package com.tripon.biz.index;

import java.util.List;

import com.tripon.biz.activity.ActivityVO;
import com.tripon.biz.category.CategoryVO;
import com.tripon.biz.notice.NoticeVO;

public interface IndexService {
	
	List<String> getSearchResult(String searchKeyword);
	
	List<CategoryVO> getSearchCategoryList(String searchKeyword);
	
	List<ActivityVO> getSearchActivityList(String searchKeyword);
	
	List<CategoryVO> getPopularCategory(CategoryVO vo);
	
	List<ActivityVO> getPopularActivity(ActivityVO vo);
	
	List<NoticeVO> getIndexNoticeList(NoticeVO vo);
	
	NoticeVO getUserNoticeCount(NoticeVO vo);
	
	List<NoticeVO> getUserNotice(NoticeVO vo);
	
}
