package com.tripon.biz.category.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.category.CategoryService;
import com.tripon.biz.category.CategoryVO;

@Service("CategoryService")
public class CategoryServiceimpl implements CategoryService {

	@Autowired
	private CategoryDAOMybatis categoryDAO;
	
	@Override
	public void insertCategory(CategoryVO vo) {
		categoryDAO.insertCategory(vo);
	}

	@Override
	public void updateCategory(CategoryVO vo) {
		categoryDAO.updateCategory(vo);
	}

	@Override
	public void deleteCategory(CategoryVO vo) {
		categoryDAO.deleteCategory(vo);
	}

	@Override
	public CategoryVO getCategory(CategoryVO vo) {
		return categoryDAO.getCategory(vo);
	}

	@Override
	public List<CategoryVO> getCategoryList(CategoryVO vo) {
		return categoryDAO.getCategoryList(vo);
	}
	
	@Override
	public int getCategoryCnt(CategoryVO vo) {
		return categoryDAO.getCategoryCnt(vo);
	}

}
