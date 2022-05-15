package com.tripon.view.interceptor;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tripon.biz.purchase.Detail;


// 로그인처리를 담당하는 인터셉터
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	
	// ▶ preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("-------- 인터셉터 처음 --------");

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userId");
		
		
	    System.out.println("패스경로 : " + request.getRequestURI());
	    // 패스경로 - 마이페이지 :  /goInfo_managementPage
	    // 패스경로 - 상품구매    :  /purchase 
		
	    
		
	    // 세션 없으면, 로그인 페이지로 이동
	    if(obj==null) {
	         if(request.getRequestURI().equals("/goInfo_managementPage")) {
	            System.out.println("마이페이지 미로그인 진입");
	            
	            // 세션에 값 저장
	            session.setAttribute("mypage", "/goInfo_managementPage");
	            
	            response.sendRedirect(request.getContextPath() + "/login");
	            return false;
	            
	       } else if(request.getRequestURI().equals("/purchase")) {
	            System.out.println("상품구매 미로그인 진입");
	            
	            Detail detail = new Detail();
	            detail.setUserId(request.getParameter("userId"));
	    		detail.setPriceint(request.getParameter("priceint"));
	    		detail.setProductName(request.getParameter("productName"));
	    		detail.setProductDate(request.getParameter("productDate"));
	    		detail.setProductOption01(request.getParameter("productOption01"));
	    		detail.setOptionCount01(request.getParameter("optionCount01"));
	    		detail.setProductOption02(request.getParameter("productOption02"));
	    		detail.setOptionCount02(request.getParameter("optionCount02"));
	    		detail.setProductOption03(request.getParameter("productOption03"));
	    		detail.setOptionCount03(request.getParameter("optionCount03"));
	    		detail.setProductOption04(request.getParameter("productOption04"));
	    		detail.setOptionCount04(request.getParameter("optionCount04"));
	            
	            // 세션에 값 저장
	            session.setAttribute("purchase", "/purchase");
	            session.setAttribute("detail", detail);
	            
	            response.sendRedirect(request.getContextPath() + "/login");
	            return false;
	       }
	    }
	    
		// 세션 있으면, 컨트롤러 타게함.
		return true;
	}
	
	
	
	// ▶ postHandle() : 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		System.out.println("--------- 인터셉터 끝 ---------");
		
		// Cache 방지 
//		if("HTTP/1.1".equals(request.getProtocol())) {
//			response.setHeader ("Cache-Control", "no-cache, no-store, must-revalidate");
//		} else {
//			response.setHeader ("Pragma", "no-cache");
//		}
//		response.setDateHeader ("Expires", 0);

	}

	
	
	
	
	
}
