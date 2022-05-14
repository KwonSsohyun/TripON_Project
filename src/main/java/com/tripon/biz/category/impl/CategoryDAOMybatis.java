package com.tripon.biz.category.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.category.CategoryVO;

@Repository
public class CategoryDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertCategory(CategoryVO vo) {
		System.out.println("===> Mybatis로 insertCategory() 기능 처리");
		mybatis.insert("CategoryDAO.insertCategory", vo);
	}

	public void updateCategory(CategoryVO vo) {
		System.out.println("===> Mybatis로 updateCategory() 기능 처리");
		mybatis.update("CategoryDAO.updateCategory", vo);
	}

	public void deleteCategory(CategoryVO vo) {
		System.out.println("===> Mybatis로 deleteCategory() 기능 처리");
		mybatis.delete("CategoryDAO.deleteCategory", vo);
	}


	public CategoryVO getCategory(CategoryVO vo) {
		System.out.println("===> Mybatis로 getCategory() 기능 처리");
		return (CategoryVO) mybatis.selectOne("CategoryDAO.getCategory", vo);
	}

	public List<CategoryVO> getCategoryList(CategoryVO vo) {
		System.out.println("===> Mybatis로 getCategoryList() 기능 처리");
		return mybatis.selectList("CategoryDAO.getCategoryList", vo);
	}
	
	public int getCategoryCnt(CategoryVO vo) {
		System.out.println("===> Mybatis로 getCategoryCnt() 기능 처리");
		return mybatis.selectOne("CategoryDAO.getCategoryCnt", vo);
	}

}
