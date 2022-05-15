package com.tripon.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tripon.biz.category.CategoryService;
import com.tripon.biz.category.CategoryVO;

@Controller
@SessionAttributes("category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	// 카테고리 목록 검색
		@RequestMapping(value="/user_categoryPage")
		public String getCategoryList(CategoryVO vo, Model model, HttpSession session) { //, HttpServletRequest request
			System.out.println("Cat-Controller getCategoryList: 글 목록 처리");
	
			model.addAttribute("categoryList", categoryService.getCategoryList(vo));
			System.out.println("category_control======" + (model.asMap().get("categoryList")));
			
			
			return "user_categoryPage"; 
	
		}
	

}
