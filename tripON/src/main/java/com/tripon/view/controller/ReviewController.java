package com.tripon.view.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tripon.biz.review.ReviewService;
import com.tripon.biz.review.ReviewVO;

@Controller
@SessionAttributes("review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
		
	//4.28 edited
	@RequestMapping(value = "/insertReview")
	public String insertReview(ReviewVO rvo, HttpSession session) throws IOException {
		System.out.println("/insertReview 컨트롤러");
		reviewService.insertReview(rvo);
		return "redirect:/getUser_detailsPage?act_num="+rvo.getAct_num();
	}
	
	//4.28 edited
	// 글 삭제
	@RequestMapping(value="/deleteReview")
	public String deleteReview(ReviewVO rvo, HttpSession session) {
		System.out.println("Review 삭제 처리");
		reviewService.deleteReview(rvo);
		return "redirect:/getUser_detailsPage?act_num="+rvo.getAct_num();
	}
	
	
//	String realPath = request.getSession().getServletContext().getRealPath("/img/");
//	String realPath = "C:/user/swork/SpringFileUpload/src/main/webapp/img/";
	
	
	
//	
//	// 글 등록
//	@RequestMapping(value="/insertActivity")
//	public String insertActivity(ActivityVO vo) throws IOException {
//		System.out.println("글 등록 처리");
//		// 파일 업로드 처리
////		MultipartFile uploadFile = vo.getUploadFile();
////		System.out.println(uploadFile.getOriginalFilename());
////		if(!uploadFile.isEmpty()) {
////			String fileName = uploadFile.getOriginalFilename();
////			uploadFile.transferTo(new File("C:/user/swork/SpringFileUpload/src/main/webapp/img/" + fileName));
////			vo.setFileName(fileName);
////		} else {
////			vo.setFileName("파일 없음");
////		}
//		
////		boardDAO.insertBoard(vo);
//		activityService.insertActivity(vo);
//		return "activity";
//	}
//	
//	// 글 수정
//	@RequestMapping(value="/updateActivity")
//	public String updateActivity(@ModelAttribute("activity") ActivityVO vo) {
////		boardDAO.updateBoard(vo);
//		activityService.updateActivity(vo);
//		return "activity";
//	}
//	

//	
//	// 글 상세 조회
//	@RequestMapping(value="/getActivity.do")
//	public String getActivity(ActivityVO vo, Model model) {
//		System.out.println("글 상세 조회 처리");
////		BoardVO vo1 = boardService.getBoard(vo);
////		vo1.setCnt(vo1.getCnt() + 1);
////		boardService.updateBoard(vo1);
//		
////		model.addAttribute("board", boardDAO.getBoard(vo));
//		model.addAttribute("activity", activityService.getActivity(vo));
//		return "getActivity.jsp";
//	}
//	
//	// 검색 조건 목록 설정
//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		Map<String, String> conditionMap = new HashMap<String, String>();
//		conditionMap.put("제목", "TITLE");
//		conditionMap.put("내용", "CONTENT");
//		return conditionMap;
//	}
//	
//	// 글 목록 검색
//	@RequestMapping(value="/activity")
//	public String getActivityList(ActivityVO vo, Model model, HttpServletRequest request) {
//		System.out.println("글 목록 검색 처리");
//
//		model.addAttribute("activityList", activityService.getActivityList(vo));
//		return "activityPage";
//		
//	}
}
