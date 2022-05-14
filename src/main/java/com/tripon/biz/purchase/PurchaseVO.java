package com.tripon.biz.purchase;

import java.sql.Date;

public class PurchaseVO {
	private int pur_num;			// 정렬 분류 번호
	private int pur_statenum;		// 0=결제 취소, 1=결제 완료, 그 외=이용 완료
	private String pur_impId;		// 결제 고유 ID
	private String pur_merchantId;	// 결제 거래 ID (결제 취소에 이용)
	private String pur_user_id;		// 유저 ID
	private String pur_user_name;	// 유저 이름
	private String pur_purchaseDate;// 결제 날짜
	private String pur_bookingDate;	// 예약 날짜
	private String pur_act_title;	// 상품 이름
	private String pur_opt_name_1;	// 패키지 옵션 1
	private String pur_opt_name_2;
	private String pur_opt_name_3;
	private String pur_opt_name_4;
	private int pur_opt_count_1;	// 패키지 옵션 수량 1
	private int pur_opt_count_2;
	private int pur_opt_count_3;
	private int pur_opt_count_4;
	private int pur_price;			// 가격
	
	
	public int getPur_num() {
		return pur_num;
	}
	public void setPur_num(int pur_num) {
		this.pur_num = pur_num;
	}
	public int getPur_statenum() {
		return pur_statenum;
	}
	public void setPur_statenum(int pur_statenum) {
		this.pur_statenum = pur_statenum;
	}
	public String getPur_impId() {
		return pur_impId;
	}
	public void setPur_impId(String pur_impId) {
		this.pur_impId = pur_impId;
	}
	public String getPur_merchantId() {
		return pur_merchantId;
	}
	public void setPur_merchantId(String pur_merchantId) {
		this.pur_merchantId = pur_merchantId;
	}
	public String getPur_user_id() {
		return pur_user_id;
	}
	public void setPur_user_id(String pur_user_id) {
		this.pur_user_id = pur_user_id;
	}
	public String getPur_user_name() {
		return pur_user_name;
	}
	public void setPur_user_name(String pur_user_name) {
		this.pur_user_name = pur_user_name;
	}
	public String getPur_purchaseDate() {
		return pur_purchaseDate;
	}
	public void setPur_purchaseDate(String pur_purchaseDate) {
		this.pur_purchaseDate = pur_purchaseDate;
	}
	public String getPur_bookingDate() {
		return pur_bookingDate;
	}
	public void setPur_bookingDate(String pur_bookingDate) {
		this.pur_bookingDate = pur_bookingDate;
	}
	public String getPur_act_title() {
		return pur_act_title;
	}
	public void setPur_act_title(String pur_act_title) {
		this.pur_act_title = pur_act_title;
	}
	public String getPur_opt_name_1() {
		return pur_opt_name_1;
	}
	public void setPur_opt_name_1(String pur_opt_name_1) {
		this.pur_opt_name_1 = pur_opt_name_1;
	}
	public String getPur_opt_name_2() {
		return pur_opt_name_2;
	}
	public void setPur_opt_name_2(String pur_opt_name_2) {
		this.pur_opt_name_2 = pur_opt_name_2;
	}
	public String getPur_opt_name_3() {
		return pur_opt_name_3;
	}
	public void setPur_opt_name_3(String pur_opt_name_3) {
		this.pur_opt_name_3 = pur_opt_name_3;
	}
	public String getPur_opt_name_4() {
		return pur_opt_name_4;
	}
	public void setPur_opt_name_4(String pur_opt_name_4) {
		this.pur_opt_name_4 = pur_opt_name_4;
	}
	public int getPur_opt_count_1() {
		return pur_opt_count_1;
	}
	public void setPur_opt_count_1(int pur_opt_count_1) {
		this.pur_opt_count_1 = pur_opt_count_1;
	}
	public int getPur_opt_count_2() {
		return pur_opt_count_2;
	}
	public void setPur_opt_count_2(int pur_opt_count_2) {
		this.pur_opt_count_2 = pur_opt_count_2;
	}
	public int getPur_opt_count_3() {
		return pur_opt_count_3;
	}
	public void setPur_opt_count_3(int pur_opt_count_3) {
		this.pur_opt_count_3 = pur_opt_count_3;
	}
	public int getPur_opt_count_4() {
		return pur_opt_count_4;
	}
	public void setPur_opt_count_4(int pur_opt_count_4) {
		this.pur_opt_count_4 = pur_opt_count_4;
	}
	public int getPur_price() {
		return pur_price;
	}
	public void setPur_price(int pur_price) {
		this.pur_price = pur_price;
	}
}
