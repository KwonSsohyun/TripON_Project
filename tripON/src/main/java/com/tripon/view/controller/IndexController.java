package com.tripon.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripon.biz.activity.ActivityVO;
import com.tripon.biz.category.CategoryVO;
import com.tripon.biz.index.IndexService;
import com.tripon.biz.notice.NoticeVO;

@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	
//	@RequestMapping(value="/getSearchResult", method=RequestMethod.POST)
//	@ResponseBody
//	public List<IndexVO> getSearchResult(@RequestBody String searchKeyword, IndexVO vo) {
//		System.out.println("controller : " + searchKeyword);
//		vo.setSearchKeyword(searchKeyword);
//		return indexService.getSearchResult(vo);
//	}
	@RequestMapping(value="/getSearchResult", method=RequestMethod.POST)
	@ResponseBody
	public List<String> getSearchResult(@RequestBody String searchKeyword) {
		System.out.println("controller : " + searchKeyword);
		return indexService.getSearchResult(searchKeyword);
	}
	
	@RequestMapping(value="/getSearchResultList", method=RequestMethod.GET)
	public String getSearchResultList(@RequestParam String searchKeyword, Model model) {
		System.out.println("controller : " + searchKeyword);
		model.addAttribute("categoryList", indexService.getSearchCategoryList(searchKeyword));
		model.addAttribute("activityList", indexService.getSearchActivityList(searchKeyword));
		return "user_searchResultPage";
	}
	
	@RequestMapping(value="/getAllActivityList", method=RequestMethod.GET)
	public String getAllActivityList(@RequestParam String searchKeyword, Model model) {
		System.out.println("controller : " + searchKeyword);
		model.addAttribute("activityList", indexService.getSearchActivityList(searchKeyword));
		return "user_searchResultPage";
	}
	
	@RequestMapping(value="/getPopularCategory", method=RequestMethod.POST)
	@ResponseBody
	public List<CategoryVO> getPopularCategory(CategoryVO vo) {
		return indexService.getPopularCategory(vo);
	}
	
	@RequestMapping(value="/getPopularActivity", method=RequestMethod.POST)
	@ResponseBody
	public List<ActivityVO> getPopularActivity(ActivityVO vo) {
		return indexService.getPopularActivity(vo);
	}
	
	@RequestMapping(value="/getIndexNoticeList", method=RequestMethod.POST)
	@ResponseBody
	public List<NoticeVO> getIndexNoticeList(NoticeVO vo) {
		return indexService.getIndexNoticeList(vo);
	}
	
	@RequestMapping(value="/getUserNotice")
	public String getUserNotice(NoticeVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		
		model.addAttribute("userNoticeTotal", indexService.getUserNoticeCount(vo));
		model.addAttribute("userNoticeList", indexService.getUserNotice(vo));
		return "noticePage";
	}
}
