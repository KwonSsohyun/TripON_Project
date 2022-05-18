package com.tripon.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripon.biz.activity.ActivityService;
import com.tripon.biz.activity.ActivityVO;
import com.tripon.biz.activity.PagingVO;
import com.tripon.biz.category.CategoryService;
import com.tripon.biz.category.CategoryVO;
import com.tripon.biz.review.ReviewService;
import com.tripon.biz.review.ReviewVO;

@Controller
@SessionAttributes("activity")
public class ActivityController {
	@Autowired
	private ActivityService activityService;
		
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ReviewService reviewService;
	
		
	//*User Details page 이동
	@RequestMapping(value="getUser_detailsPage")
	public String getUserdetailsPage(ActivityVO vo, ReviewVO rvo, PagingVO pv, Model model, HttpSession session) {
		System.out.println("상품 화면보이기");
		String cntPerPage = "10";
		
		int total = reviewService.countReview(rvo); //리뷰 갯수
		if (pv.getNowPage() == 0)  pv.setNowPage(1);//NowPage = 1
		
		pv = new PagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));

		rvo.setStart(pv.getStart());
		rvo.setListcnt(Integer.parseInt(cntPerPage));
		
		System.out.println("Review_controller ==>상품 상세 페이지 처리");
			
		model.addAttribute("activity", activityService.getUserdetailsPage(vo));
		System.out.println("상품번호:  "+vo.getAct_num());
		model.addAttribute("paging", pv);
		model.addAttribute("reviewList", reviewService.getReviewList(rvo));
		
		return "user_detailsPage";
		
	}
	
	
	// *글 목록 검색
	@RequestMapping(value="user_activityListPage")
	public String getUserActivityList(ActivityVO vo,CategoryVO cvo, Model model, HttpSession session) {
		System.out.println("activity_controller ==> user_activityListPage 글 목록 검색 처리");
			
		model.addAttribute("activityList", activityService.getUserActivityList(vo));
		model.addAttribute("category", categoryService.getCategory(cvo));
		System.out.println("category_name= "+vo.getCategory_name());
		System.out.println("activityList=" + (model.asMap().get("activityList")));
		System.out.println("user_activityListPage =" + (model.asMap().get("category")));
		return "user_activityListPage";
		
	}
	
	// 파일 업로드 경로
//		String realPath = "/Users/jonghuipark/Documents/swork/TripOn/src/main/webapp/resources/imgs/";
		
//				"C:/swork/tripON/src/main/webapp/resources/imgs/";
		
		
		
	// 글 등록
		@RequestMapping(value = "/admin/insertActivity", method = RequestMethod.POST)
		public String insertActivity(ActivityVO vo, CategoryVO cvo, HttpSession session, Model model, MultipartHttpServletRequest request) throws IOException {
			System.out.println("글 등록 처리");
			// ** 혹시 호스팅할 때 상대경로로 잘 안되면 아래의 절대경로를 사용해 볼 것. **
			// 아래 realPath는 tomcat에서 구동할 때 읽을 수 있는 상대경로이므로 서버를 구동시켜 사용해야만 제대로 인식함.
//			String realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			// 이클립스로 테스트 시에는 아래 realPath에 원하는 위치의 절대경로를 명시해야 업로드 됨.
			 String realPath = "C:/server/apache-tomcat-9.0.62/webapps/tripON/resources/imgs/";
			
			// 파일 업로드
			MultipartFile category_img = cvo.getCategory_img(); // 카테고리 썸네일
			MultipartFile act_thumbImg = vo.getAct_thumbImg(); // 상품분류 썸네일
			MultipartFile act_mainPicture = vo.getAct_mainPicture(); // 상품이미지
			MultipartFile act_inforImg = vo.getAct_inforImg(); // 상품정보이미지(multiple)
			
			if (!category_img.isEmpty()) {
				String category_imgName = category_img.getOriginalFilename();
				File file = new File(realPath + category_imgName);
				
				category_img.transferTo(file);
				cvo.setCategory_imgName(category_imgName);
			}
			
			if (!act_thumbImg.isEmpty()) {
				String act_thumbImgName = act_thumbImg.getOriginalFilename();
				File file = new File(realPath + act_thumbImgName);
				
				act_thumbImg.transferTo(file);
				vo.setAct_thumbImgName(act_thumbImgName);
			}
			
			if (!act_mainPicture.isEmpty()) {
				String act_mainPictureName = act_mainPicture.getOriginalFilename();
				File file = new File(realPath + act_mainPictureName);
				
				act_mainPicture.transferTo(file);
				vo.setAct_mainPictureName(act_mainPictureName);
			}
			
			if (!act_inforImg.isEmpty()) {
				String act_inforImgName = act_inforImg.getOriginalFilename();
				File file = new File(realPath + act_inforImgName);
				
				act_inforImg.transferTo(file);
				vo.setAct_inforImgName(act_inforImgName);
			}
			
			if (vo.getCategoryCheck() == null || vo.getCategoryCheck().equals("")) vo.setCategoryCheck(cvo.getCategory_name());
			if (cvo.getCategory_name() == null || cvo.getCategory_name().equals("")) cvo.setCategory_name(vo.getCategoryCheck());

			if (categoryService.getCategoryCnt(cvo) <= 0) categoryService.insertCategory(cvo);
			activityService.insertActivity(vo);
			return "redirect:/admin/admin_getActivityList";
		}

		// 카테고리 등록
		@RequestMapping(value = "/admin/insertCategory", method = RequestMethod.POST)
		public String insertCategory(CategoryVO vo, HttpSession session, Model model) throws IOException {
			System.out.println("카테고리 등록 처리");
			categoryService.insertCategory(vo);
			return "/admin/admin_insertActivity";
		}

		// 카테고리 목록
		@RequestMapping(value = "/admin/admin_insertActivity", method = RequestMethod.GET)
		public String getCategoryList(CategoryVO vo, HttpSession session, Model model) throws IOException {
			System.out.println("카테고리 목록 처리");
			model.addAttribute("categoryList", categoryService.getCategoryList(vo));
			return "/admin/admin_insertActivity";
		}

		// 글 수정
		@RequestMapping(value = "/admin/updateActivity", method = RequestMethod.POST)
		public String updateActivity(@ModelAttribute("activity") ActivityVO vo, @ModelAttribute("category") CategoryVO cvo, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {
			System.out.println("글 수정 처리");
			// ** 혹시 호스팅할 때 상대경로로 잘 안되면 아래의 절대경로를 사용해 볼 것. **
			// 아래 realPath는 tomcat에서 구동할 때 읽을 수 있는 상대경로이므로 서버를 구동시켜 사용해야만 제대로 인식함.
//			String realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			// 이클립스로 테스트 시에는 아래 realPath에 원하는 위치의 절대경로를 명시해야 업로드 됨.
			 String realPath = "C:/server/apache-tomcat-9.0.62/webapps/tripON/resources/imgs/";
			 
			
			// 파일 업로드 수정
			MultipartFile act_thumbImg = vo.getAct_thumbImg(); // 상품분류 썸네일
			MultipartFile act_mainPicture = vo.getAct_mainPicture(); // 상품이미지
			MultipartFile act_inforImg = vo.getAct_inforImg(); // 상품정보이미지
			
			if (!act_thumbImg.isEmpty()) {
				String act_thumbImgName = act_thumbImg.getOriginalFilename();
				File file = new File(realPath + act_thumbImgName);
				
				act_thumbImg.transferTo(file);
				vo.setAct_thumbImgName(act_thumbImgName);
			}
			
			if (!act_mainPicture.isEmpty()) {
				String act_mainPictureName = act_mainPicture.getOriginalFilename();
				File file = new File(realPath + act_mainPictureName);
				
				act_mainPicture.transferTo(file);
				vo.setAct_mainPictureName(act_mainPictureName);
			}
			
			if (!act_inforImg.isEmpty()) {
				String act_inforImgName = act_inforImg.getOriginalFilename();
				File file = new File(realPath + act_inforImgName);
				
				act_inforImg.transferTo(file);
				vo.setAct_inforImgName(act_inforImgName);
			}
			
			activityService.updateActivity(vo);
			return "redirect:/admin/admin_getActivityList";
		}

		// 카테고리 수정
		@RequestMapping(value = "/admin/updateCategory", method = RequestMethod.POST)
		public String updateCategory(@ModelAttribute("category") CategoryVO vo) {
			System.out.println("카테고리 수정 처리");
			categoryService.updateCategory(vo);
			return "redirect:/admin/admin_getActivityList";
		}

		// 글 삭제
		@RequestMapping(value = "/admin/deleteActivity", method = RequestMethod.GET)
		public String deleteActivity(ActivityVO vo) {
			System.out.println("글 삭제 처리");
			activityService.deleteActivity(vo);
			return "redirect:/admin/admin_getActivityList";
		}

		// 글 상세 조회
		@RequestMapping(value = "/admin/admin_getActivity", method = RequestMethod.GET)
		public String getActivity(ActivityVO vo, CategoryVO cvo, Model model) {
			System.out.println("글 상세 조회 처리");
			model.addAttribute("category", categoryService.getCategory(cvo));
			model.addAttribute("activity", activityService.getActivity(vo));
			return "/admin/admin_activity";
		}

		// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("상품명", "ACT_MAINTITLE");
			conditionMap.put("작성자", "ACT_WRITER");
			return conditionMap;
		}

		// 글 목록 검색
		@RequestMapping(value = "/admin/admin_getActivityList")
		public String getActivityList(PagingVO pv, ActivityVO vo, HttpServletRequest request, Model model) {
			System.out.println("글 목록 검색 처리");
			String cntPerPage = "10";

			int total = activityService.countActivity(vo);
			if (pv.getNowPage() == 0) pv.setNowPage(1);

			pv = new PagingVO(total, pv.getNowPage(), Integer.parseInt(cntPerPage));
			vo.setStart(pv.getStart());
			vo.setListcnt(Integer.parseInt(cntPerPage));

			if (vo.getSearchCondition() != null) vo.setSearchCondition(vo.getSearchCondition());
			else vo.setSearchCondition("ACT_MAINTITLE");
			
			if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
			else vo.setSearchKeyword("");
			System.out.println("SeacrchCondition: "+ vo.getSearchCondition());
			System.out.println("SeacrchKeyword: "+ vo.getSearchKeyword());

			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("searchCondition", vo.getSearchCondition());
			model.addAttribute("paging", pv);
			model.addAttribute("activityList", activityService.getActivityList(vo));
			return "/admin/admin_activityList";
		}

}
