package com.tripon.view.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripon.biz.faq.FaqService;
import com.tripon.biz.faq.FaqVO;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;
	
//	String realPath = request.getSession().getServletContext().getRealPath("/img/");
//	String realPath = "C:/user/swork/SpringFileUpload/src/main/webapp/img/";
	
	// 관리자 페이지

	// 글 등록
	@RequestMapping(value="/admin/insertFaq")
	public String insertFaq(FaqVO vo, HttpServletRequest request) throws IOException {
		System.out.println("글 등록 처리");
		faqService.insertFaq(vo);
		return "redirect:/admin/getFaqList?pageNum=" + request.getParameter("pageNum");
	}
	
	// 글 수정
	@RequestMapping(value="/admin/updateFaq")
	public String updateFaq(FaqVO vo, HttpServletRequest request) {
		faqService.updateFaq(vo);
		return "redirect:/admin/getFaqList?pageNum=" + request.getParameter("pageNum");
	}
	
	// 글 삭제
	@RequestMapping(value="/admin/deleteFaq", method=RequestMethod.POST)
	public String deleteFaq(FaqVO vo, HttpServletRequest request) {
		System.out.println("글 삭제 처리");
		faqService.deleteFaq(vo);
		return "redirect:/admin/getFaqList?pageNum=" + request.getParameter("pageNum");
	}
	
	// 글 상세 조회
	@RequestMapping(value="/admin/getFaq")
	public String getFaq(FaqVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		model.addAttribute("faq", faqService.getFaq(vo));
		return "admin/admin_faqdetail";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "FAQ_TITLE");
		conditionMap.put("내용", "FAQ_CONTENT");
		conditionMap.put("작성자", "FAQ_MEM_ID");
		conditionMap.put("카테고리", "FAQ_CATEGORY");
		return conditionMap;
	}
	
	// 글 목록 검색
	@RequestMapping(value="/admin/getFaqList")
	public String getFaqList(FaqVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) vo.setSearchCondition("FAQ_TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("faqTotal", faqService.getFaqTotal(vo)); // 총 개수를 int 타입으로 받아옴.
		if(request.getParameter("pageNum") != null) {
			if(faqService.getFaqList(vo).size() < 1 && !request.getParameter("pageNum").contentEquals("1")) { 
				vo.setPageNum(Integer.parseInt(request.getParameter("pageNum")) - 1);
			}
		}
		model.addAttribute("faqList", faqService.getFaqList(vo));
		return "admin/admin_faqList";
		
	}
	
// 사용자 페이지

	@RequestMapping(value="/getUserFaqList")
	public String getUserFaqList(FaqVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		if(vo.getFaq_category() == null) vo.setFaq_category("TOP7");
		model.addAttribute("userFaqTotal", faqService.getUserFaqTotal(vo)); // 총 개수를 int 타입으로 받아옴.
		model.addAttribute("userFaqList", faqService.getUserFaqList(vo));
		return "faqPage";
		
	}
	
	@RequestMapping(value="/getUserFaqSearchList")
	public String getUserFaqSearchList(FaqVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
	
		if(vo.getSearchCondition() == null) vo.setSearchCondition("FAQ_TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("userFaqTotal", faqService.getFaqTotal(vo)); // 총 개수를 int 타입으로 받아옴.
		model.addAttribute("userFaqList", faqService.getFaqList(vo));
		return "faqPage";
		
	}

	@RequestMapping(value="/admin/*", method=RequestMethod.GET)
	public String path01(HttpServletRequest request) {
		System.out.println("/* 컨트롤러");
		
		String uri = request.getRequestURI();
		System.out.println("uri 입니다 :" + uri);
		
		String context = request.getContextPath();
		System.out.println("context 입니다 :" + context);
		
		String path = uri.substring(context.length());
		System.out.println("총 path 입니다 : " + path);
		
		return path;
	}
	@RequestMapping(value="/admin/*", method=RequestMethod.POST)
	public String path02(HttpServletRequest request) {
		System.out.println("/* 컨트롤러");
		
		String uri = request.getRequestURI();
		System.out.println("uri 입니다 :" + uri);
		
		String context = request.getContextPath();
		System.out.println("context 입니다 :" + context);
		
		String path = uri.substring(context.length());
		System.out.println("총 path 입니다 : " + path);
		
		return path;
	}
	@RequestMapping(value="/*", method=RequestMethod.POST)
	public String path03(HttpServletRequest request) {
		System.out.println("/* 컨트롤러");
		
		String uri = request.getRequestURI();
		System.out.println("uri 입니다 :" + uri);

		String context = request.getContextPath();
		System.out.println("context 입니다 :" + context);
		
		String path = uri.substring(context.length());
		System.out.println("총 path 입니다 : " + path);
		
		return path;
	}
	@RequestMapping(value="/error/error", method=RequestMethod.GET)
	public String path04(HttpServletRequest request) {
		System.out.println("/error/error 컨트롤러");
		
		return "error/error";
	}
	
}
