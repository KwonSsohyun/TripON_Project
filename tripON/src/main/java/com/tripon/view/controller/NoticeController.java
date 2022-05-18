package com.tripon.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.tripon.biz.notice.NoticeService;
import com.tripon.biz.notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
//	String realPath = request.getSession().getServletContext().getRealPath("/img/");
//	String realPath = "C:/user/swork/SpringFileUpload/src/main/webapp/img/";

	// 관리자 페이지
	
	// 글 등록
	@RequestMapping(value="/admin/insertNotice", method=RequestMethod.POST)
	public String insertNotice(NoticeVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("글 등록 처리");
		// 파일 업로드 처리
		MultipartFile[] uploadFile = vo.getUploadFile();
		if(!uploadFile[0].getOriginalFilename().trim().equals("")) {
			
			// ** 혹시 호스팅할 때 상대경로로 잘 안되면 아래의 절대경로를 사용해 볼 것. **
			// 아래 realPath는 tomcat에서 구동할 때 읽을 수 있는 상대경로이므로 서버를 구동시켜 사용해야만 제대로 인식함.
//			String realPath = request.getSession().getServletContext().getRealPath("/resources/attachments/");
			// 이클립스로 테스트 시에는 아래 realPath에 원하는 위치의 절대경로를 명시해야 업로드 됨.
			 String realPath = "C:/server/apache-tomcat-9.0.62/webapps/tripON/resources/attachments/";
			
			
			System.out.println(realPath);
			String filenames = "";
			for(int i = 0; i < uploadFile.length; i++) {
				System.out.println(uploadFile[i].getOriginalFilename());
				String fileName = uploadFile[i].getOriginalFilename();
				uploadFile[i].transferTo(new File(realPath + fileName));
				System.out.println(realPath + fileName);
				filenames += fileName;
				if((i + 1) < uploadFile.length) {
					filenames += ",";
				}
			}
			vo.setNtc_filename(filenames);
		} else {
			vo.setNtc_filename("파일 없음");
		}
		
		noticeService.insertNotice(vo);
		return "redirect:/admin/getNoticeList?pageNum=" + request.getParameter("pageNum");
	}
	
	// 글 수정
	@RequestMapping(value="/admin/updateNotice", method=RequestMethod.POST)
	public String updateNotice(NoticeVO vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		MultipartFile[] uploadFile = vo.getUploadFile();
		if(!uploadFile[0].getOriginalFilename().trim().equals("")) {
			
			// ** 혹시 호스팅할 때 상대경로로 잘 안되면 아래의 절대경로를 사용해 볼 것. **
			// 아래 realPath는 tomcat에서 구동할 때 읽을 수 있는 상대경로이므로 서버를 구동시켜 사용해야만 제대로 인식함.
//			String realPath = request.getSession().getServletContext().getRealPath("/resources/attachments/");
			// 이클립스로 테스트 시에는 아래 realPath에 원하는 위치의 절대경로를 명시해야 업로드 됨.
			 String realPath = "C:/server/apache-tomcat-9.0.62/webapps/tripON/resources/attachments/";
			
			System.out.println(realPath);
			String filenames = "";
			if(vo.getNtc_filename() != null || !vo.getNtc_filename().trim().equals("")) {
				filenames = vo.getNtc_filename() + ",";
			}
			for(int i = 0; i < uploadFile.length; i++) {
				System.out.println(uploadFile[i].getOriginalFilename());
				String fileName = uploadFile[i].getOriginalFilename();
				uploadFile[i].transferTo(new File(realPath + fileName));
				System.out.println(realPath + fileName);
				filenames += fileName;
				if((i + 1) < uploadFile.length) {
					filenames += ",";
				}
			}
			vo.setNtc_filename(filenames);
		} else {
			vo.setNtc_filename("파일 없음");
		}
		
		noticeService.updateNotice(vo);
		return "redirect:/admin/getNoticeList?pageNum=" + request.getParameter("pageNum");
	}
	
	// 글 삭제
	@RequestMapping(value="/admin/deleteNotice", method=RequestMethod.POST)
	public String deleteNotice(NoticeVO vo, HttpServletRequest request) {
		System.out.println("글 삭제 처리");
		noticeService.deleteNotice(vo);
		return "redirect:/admin/getNoticeList?pageNum=" + request.getParameter("pageNum");
	}
	
	// 글 상세 조회
	@RequestMapping(value="/admin/getNotice")
	public String getNotice(NoticeVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		
		model.addAttribute("notice", noticeService.getNotice(vo));
		return "admin/admin_noticedetail";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "NTC_TITLE");
		conditionMap.put("내용", "NTC_CONTENT");
		conditionMap.put("작성자", "NTC_MEM_ID");
		conditionMap.put("공지대상", "NTC_TARGET");
		return conditionMap;
	}
	
	// 글 목록 검색
	@RequestMapping(value="/admin/getNoticeList")
	public String getadminNoticeList(NoticeVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) vo.setSearchCondition("NTC_TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("noticeTotal", noticeService.getNoticeTotal(vo));
		if(request.getParameter("pageNum") != null) {
			if(noticeService.getNoticeList(vo).size() < 1 && !request.getParameter("pageNum").contentEquals("1")) {
				vo.setPageNum(Integer.parseInt(request.getParameter("pageNum")) - 1);
			}
		}
		model.addAttribute("noticeList", noticeService.getNoticeList(vo));
		return "admin/admin_noticeList";
	}
	
	@RequestMapping(value="/getUserNoticeList")
	public String getNoticeList(NoticeVO vo, Model model, HttpServletRequest request, String str) {
		System.out.println("글 목록 검색 처리");
		
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		
		if(vo.getSearchCondition() == null) vo.setSearchCondition("NTC_TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("userNoticeTotal", noticeService.getUserNoticeTotal(vo));
		model.addAttribute("userNoticeList", noticeService.getUserNoticeList(vo));
		return "noticePage";
	}
	
}
