package com.tripon.biz.activity;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ActivityVO {
	private int act_num;		// 상품번호
	private String act_mainTitle;		// 상품명1
	private String act_subTitle;		// 상품명2
	private String act_writer;		// 작성자
	private Date act_regdate;		// 작성일

	private int start;
	private int listcnt;

	private String searchCondition;
	private String searchKeyword;

	private String act_optName1;		// 상품옵션1
	private String act_optName2;		// 상품옵션2
	private String act_optName3;		// 상품옵션3
	private String act_optName4;		// 상품옵션4

	private String act_optPrice1;		// 상품가격1
	private String act_optPrice2;		// 상품가격2
	private String act_optPrice3;		// 상품가격3
	private String act_optPrice4;		// 상품가격4
	
	private MultipartFile act_mainPicture;		// 상품 메인 이미지
	private String act_mainPictureName;		
	
	private MultipartFile act_thumbImg;		// 상품썸네일 이미지
	private String act_thumbImgName; 
	
	private MultipartFile act_inforImg;		// 상품 정보 이미지
	private String act_inforImgName; 

	private String act_content;		// 상품설명
	private String act_announcement;		// 공지사항
	
	private String category_name;
	private String categoryCheck;
	
	private String act_address; // 위치정보
	private String act_faq;

	
	
	
	public int getAct_num() {
		return act_num;
	}
	public void setAct_num(int act_num) {
		this.act_num = act_num;
	}
	public String getAct_mainTitle() {
		return act_mainTitle;
	}
	public void setAct_mainTitle(String act_maintitle) {
		this.act_mainTitle = act_maintitle;
	}
	public String getAct_subTitle() {
		return act_subTitle;
	}
	public void setAct_subTitle(String act_subtitle) {
		this.act_subTitle = act_subtitle;
	}
	public String getAct_writer() {
		return act_writer;
	}
	public void setAct_writer(String act_writer) {
		this.act_writer = act_writer;
	}
	public Date getAct_regdate() {
		return act_regdate;
	}
	public void setAct_regdate(Date act_regdate) {
		this.act_regdate = act_regdate;
	}

	public String getAct_optName1() {
		return act_optName1;
	}
	public void setAct_optName1(String act_optnum1) {
		this.act_optName1 = act_optnum1;
	}
	public String getAct_optName2() {
		return act_optName2;
	}
	public void setAct_optName2(String act_optnum2) {
		this.act_optName2 = act_optnum2;
	}
	public String getAct_optName3() {
		return act_optName3;
	}
	public void setAct_optName3(String act_optnum3) {
		this.act_optName3 = act_optnum3;
	}
	public String getAct_optName4() {
		return act_optName4;
	}
	public void setAct_optName4(String act_optnum4) {
		this.act_optName4 = act_optnum4;
	}
	
	public String getAct_optPrice1() {
		return act_optPrice1;
	}
	public void setAct_optPrice1(String act_optprice1) {
		this.act_optPrice1 = act_optprice1;
	}
	public String getAct_optPrice2() {
		return act_optPrice2;
	}
	public void setAct_optPrice2(String act_optprice2) {
		this.act_optPrice2 = act_optprice2;
	}
	public String getAct_optPrice3() {
		return act_optPrice3;
	}
	public void setAct_optPrice3(String act_optprice3) {
		this.act_optPrice3 = act_optprice3;
	}
	public String getAct_optPrice4() {
		return act_optPrice4;
	}
	public void setAct_optPrice4(String act_optprice4) {
		this.act_optPrice4 = act_optprice4;
	}

	public String getAct_content() {
		return act_content;
	}
	public void setAct_content(String act_content) {
		this.act_content = act_content;
	}
	public String getAct_announcement() {
		return act_announcement;
	}
	public void setAct_announcement(String act_announcement) {
		this.act_announcement = act_announcement;
	}

	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchcondition) {
		this.searchCondition = searchcondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchkeyword) {
		this.searchKeyword = searchkeyword;
	}
	public String getAct_address() {
		return act_address;
	}
	public void setAct_address(String act_address) {
		this.act_address = act_address;
	}
	public String getCategoryCheck() {
		return categoryCheck;
	}
	public void setCategoryCheck(String categoryCheck) {
		this.categoryCheck = categoryCheck;
	}
	public MultipartFile getAct_mainPicture() {
		return act_mainPicture;
	}
	public void setAct_mainPicture(MultipartFile act_mainPicture) {
		this.act_mainPicture = act_mainPicture;
	}
	public String getAct_mainPictureName() {
		return act_mainPictureName;
	}
	public void setAct_mainPictureName(String act_mainPictureName) {
		this.act_mainPictureName = act_mainPictureName;
	}
	public MultipartFile getAct_thumbImg() {
		return act_thumbImg;
	}
	public void setAct_thumbImg(MultipartFile act_thumbImg) {
		this.act_thumbImg = act_thumbImg;
	}
	public String getAct_thumbImgName() {
		return act_thumbImgName;
	}
	public void setAct_thumbImgName(String act_thumbImgName) {
		this.act_thumbImgName = act_thumbImgName;
	}
	public String getAct_faq() {
		return act_faq;
	}
	public void setAct_faq(String act_faq) {
		this.act_faq = act_faq;
	}
	public MultipartFile getAct_inforImg() {
		return act_inforImg;
	}
	public void setAct_inforImg(MultipartFile act_inforImg) {
		this.act_inforImg = act_inforImg;
	}
	public String getAct_inforImgName() {
		return act_inforImgName;
	}
	public void setAct_inforImgName(String act_inforImgName) {
		this.act_inforImgName = act_inforImgName;
	}
	

}
