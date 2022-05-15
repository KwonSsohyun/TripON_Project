package com.tripon.biz.user;

import java.sql.Date;

// VO (Value Object)
public class UserVO {
	
	// 아이디   ▶   중복불가 PRIMARY KEY
	private String mem_id;
	
	// 유저넘버(시퀀스)   ▶   중복불가
	private int mem_seq;
	
	// 비밀번호   ▶   NOTNULL (빈값불가)
	private String mem_pw;
	
	// 이름
	private String mem_username;
	
	// 닉네임   ▶   랜덤숫자넣어주는데, 인서트문에 넣어준다. UNIX_TIMESTAMP() 
	private String mem_nickname;
	
	// 휴대폰번호
	// mem_phone ▶  다 합쳐진 전화번호
	private String mem_phone;
	private String mem_phone_01;
	private String mem_phone_02;
	private String mem_phone_03;
	
	// 이메일
	private String mem_email;
	
	// 주소
	private String mem_address;
	private String mem_address_01;
	private String mem_address_02;
	private String mem_address_03;
	
	// 가입일   ▶   자동 날짜시간 부여
	private Date mem_registdate;
	
	// 권한 (일반'N', 관리자'Y')   ▶    기본디폴트값  'N'
	private String mem_is_super;
	
	// 회원가입 경로 체크 ( '일반' , 'kakao' , 'naver' )   ▶    기본디폴트값  '일반'
	private String mem_flag;
	
	
	
	// ★ 카카오톡
	// 아이디
	private String kakao_mem_id;
	// 비밀번호
	private String kakao_mem_pw;
	// 닉네임
	private String kakao_mem_nickname;
	// 메일
	private String kakao_mem_email;
	
	
	
	// ★ 네이버
	// 아이디
	private String naver_mem_id;
	// 비밀번호
	private String naver_mem_pw;
	// 이름
	private String naver_mem_username;
	// 닉네임
	private String naver_mem_nickname;
	// 메일
	private String naver_mem_email;
	
	

	// 페이징
	private int start;
	private int listcnt;
	// 검색
	private String searchCondition;
	private String searchKeyword;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_username() {
		return mem_username;
	}
	public void setMem_username(String mem_username) {
		// mem_username = mem_username.substring(0, mem_username.indexOf(","));
		mem_username = mem_username.replace(",", "");
		this.mem_username = mem_username;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	
	
	
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	
	
	public String getMem_phone_01() {
		return mem_phone_01;
	}
	public void setMem_phone_01(String mem_phone_01) {
		this.mem_phone_01 = mem_phone_01;
	}
	public String getMem_phone_02() {
		return mem_phone_02;
	}
	public void setMem_phone_02(String mem_phone_02) {
		this.mem_phone_02 = mem_phone_02;
	}
	public String getMem_phone_03() {
		return mem_phone_03;
	}
	public void setMem_phone_03(String mem_phone_03) {
		this.mem_phone_03 = mem_phone_03;
	}
	
	
	
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	
	
	
	
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	
	
	
	public String getMem_address_01() {
		return mem_address_01;
	}
	public void setMem_address_01(String mem_address_01) {
		this.mem_address_01 = mem_address_01;
	}
	public String getMem_address_02() {
		return mem_address_02;
	}
	public void setMem_address_02(String mem_address_02) {
		this.mem_address_02 = mem_address_02;
	}
	public String getMem_address_03() {
		return mem_address_03;
	}
	public void setMem_address_03(String mem_address_03) {
		this.mem_address_03 = mem_address_03;
	}
	
	
	
	
	public Date getMem_registdate() {
		return mem_registdate;
	}
	public void setMem_registdate(Date mem_registdate) {
		this.mem_registdate = mem_registdate;
	}
	public String getMem_is_super() {
		return mem_is_super;
	}
	public void setMem_is_super(String mem_is_super) {
		this.mem_is_super = mem_is_super;
	}
	public String getMem_flag() {
		return mem_flag;
	}
	public void setMem_flag(String mem_flag) {
		this.mem_flag = mem_flag;
	}
	
	
	
	
	public String getKakao_mem_id() {
		return kakao_mem_id;
	}
	public void setKakao_mem_id(String kakao_mem_id) {
		this.kakao_mem_id = kakao_mem_id;
	}
	public String getKakao_mem_pw() {
		return kakao_mem_pw;
	}
	public void setKakao_mem_pw(String kakao_mem_pw) {
		this.kakao_mem_pw = kakao_mem_pw;
	}
	public String getKakao_mem_nickname() {
		return kakao_mem_nickname;
	}
	public void setKakao_mem_nickname(String kakao_mem_nickname) {
		this.kakao_mem_nickname = kakao_mem_nickname;
	}
	public String getKakao_mem_email() {
		return kakao_mem_email;
	}
	public void setKakao_mem_email(String kakao_mem_email) {
		this.kakao_mem_email = kakao_mem_email;
	}
	
	
	
	public String getNaver_mem_id() {
		return naver_mem_id;
	}
	public void setNaver_mem_id(String naver_mem_id) {
		this.naver_mem_id = naver_mem_id;
	}
	public String getNaver_mem_pw() {
		return naver_mem_pw;
	}
	public void setNaver_mem_pw(String naver_mem_pw) {
		this.naver_mem_pw = naver_mem_pw;
	}
	public String getNaver_mem_username() {
		return naver_mem_username;
	}
	public void setNaver_mem_username(String naver_mem_username) {
		this.naver_mem_username = naver_mem_username;
	}
	public String getNaver_mem_nickname() {
		return naver_mem_nickname;
	}
	public void setNaver_mem_nickname(String naver_mem_nickname) {
		this.naver_mem_nickname = naver_mem_nickname;
	}
	public String getNaver_mem_email() {
		return naver_mem_email;
	}
	public void setNaver_mem_email(String naver_mem_email) {
		this.naver_mem_email = naver_mem_email;
	}
	
	
	
	@Override
	public String toString() {
		return "UserVO [mem_id=" + mem_id + ", mem_seq=" + mem_seq + ", mem_pw=" + mem_pw + ", mem_username="
				+ mem_username + ", mem_nickname=" + mem_nickname + ", mem_phone=" + mem_phone + ", mem_phone_01="
				+ mem_phone_01 + ", mem_phone_02=" + mem_phone_02 + ", mem_phone_03=" + mem_phone_03 + ", mem_email="
				+ mem_email + ", mem_address=" + mem_address + ", mem_address_01=" + mem_address_01
				+ ", mem_address_02=" + mem_address_02 + ", mem_address_03=" + mem_address_03 + ", mem_registdate="
				+ mem_registdate + ", mem_is_super=" + mem_is_super + ", mem_flag=" + mem_flag + ", kakao_mem_id="
				+ kakao_mem_id + ", kakao_mem_pw=" + kakao_mem_pw + ", kakao_mem_nickname=" + kakao_mem_nickname
				+ ", kakao_mem_email=" + kakao_mem_email + ", naver_mem_id=" + naver_mem_id + ", naver_mem_pw="
				+ naver_mem_pw + ", naver_mem_username=" + naver_mem_username + ", naver_mem_nickname="
				+ naver_mem_nickname + ", naver_mem_email=" + naver_mem_email + ", start=" + start + ", listcnt="
				+ listcnt + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
}
