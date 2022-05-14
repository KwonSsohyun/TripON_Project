package com.tripon.biz.category;

import org.springframework.web.multipart.MultipartFile;

public class CategoryVO {
	private String category_name;	// 공지사항
	private MultipartFile category_img;		// 카테고리 썸네일 이미지
	private String category_imgName;
	

	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public MultipartFile getCategory_img() {
		return category_img;
	}
	public void setCategory_img(MultipartFile category_img) {
		this.category_img = category_img;
	}
	public String getCategory_imgName() {
		return category_imgName;
	}
	public void setCategory_imgName(String category_imgName) {
		this.category_imgName = category_imgName;
	}

}