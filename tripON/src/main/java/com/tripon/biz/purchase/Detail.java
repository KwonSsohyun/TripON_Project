package com.tripon.biz.purchase;

public class Detail {
	String productName;
	String productDate;
	String productOption01;
	String optionCount01;
	String productOption02;
	String optionCount02;
	String productOption03;
	String optionCount03;
	String productOption04;
	String optionCount04;
	String priceint;
	String userId;
	String act_num;
	public String getProductDate() {
		return productDate;
	}
	public void setProductDate(String productDate) {
		this.productDate = productDate;
	}
	public String getProductOption01() {
		productOption01 = productOption01.replace("-상품가격:", "");
		return productOption01;
	}
	public void setProductOption01(String productOption01) {
		this.productOption01 = productOption01;
	}
	public String getOptionCount01() {
		return optionCount01;
	}
	public void setOptionCount01(String optionCount01) {
		this.optionCount01 = optionCount01;
	}
	public String getProductOption02() {
		productOption02 = productOption02.replace("-상품가격:", "");
		return productOption02;
	}
	public void setProductOption02(String productOption02) {
		this.productOption02 = productOption02;
	}
	public String getOptionCount02() {
		if(productOption02 == "") {
			optionCount02 = "0";
		}
		return optionCount02;
	}
	public void setOptionCount02(String optionCount02) {
		this.optionCount02 = optionCount02;
	}
	public String getProductOption03() {
		productOption03 = productOption03.replace("-상품가격:", "");
		return productOption03;
	}
	public void setProductOption03(String productOption03) {
		this.productOption03 = productOption03;
	}
	public String getOptionCount03() {
		if(productOption03 == "") {
			optionCount03 = "0";
		}
		return optionCount03;
	}
	public void setOptionCount03(String optionCount03) {
		this.optionCount03 = optionCount03;
	}
	public String getProductOption04() {
		productOption04 = productOption04.replace("-상품가격:", "");
		return productOption04;
	}
	public void setProductOption04(String productOption04) {
		this.productOption04 = productOption04;
	}
	public String getOptionCount04() {
		if(productOption04 == "") {
			optionCount04 = "0";
		}
		return optionCount04;
	}
	public void setOptionCount04(String optionCount04) {
		this.optionCount04 = optionCount04;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPriceint() {
		return priceint;
	}
	public void setPriceint(String priceint) {
		this.priceint = priceint;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getAct_num() {
		return act_num;
	}
	public void setAct_num(String act_num) {
		this.act_num = act_num;
	}
	
	
	
	
}
