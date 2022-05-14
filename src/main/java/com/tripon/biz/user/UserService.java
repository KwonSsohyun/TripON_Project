package com.tripon.biz.user;

import java.util.List;

public interface UserService {
	
	// CRUD 기능의 메소드 구현
	//  ▶ 회원 등록
	void insertMem(UserVO vo);
	
	//  ▶ 회원 수정
	void updateMem(UserVO vo);
	
	//  ▶ 회원 삭제
	void deleteMem(UserVO vo);
	
	//  ▶ 비밀번호 수정
	void updateMemPw(UserVO vo);
	
	
	
	//  ▶ 로그인 - 사용자/관리자/일치하는 회원정보 있는지 확인
	UserVO getMemLogin(UserVO vo);
	
	//  ▶ ID 기준으로 회원정보 조회 
	UserVO getMemLoginId(UserVO vo);
	
	//  ▶ 전화번호 기준으로 회원정보 조회 
	UserVO getMemLoginPh(UserVO vo);
	
	//  ▶ 개인 회원 조회 - 아이디 찾기
	UserVO getMemId(UserVO vo);
	
	//  ▶ 개인 회원 조회 - 비밀번호 찾기
	UserVO getMemPw(UserVO vo);
	
	
	
	//  ▶ 카카오 로그인 
	// 회원 인지 조회
	UserVO getKakaoMemId(UserVO vo);
	
	// 기존 네이버 회원 아니면  → 회원등록 (이메일 X, 닉네임 X)
	void insertKakaoMem_ex_nx(UserVO vo);
	// 기존 네이버 회원 아니면  → 회원등록 (이메일 X, 닉네임 O)
	void insertKakaoMem_ex_no(UserVO vo);
	// 기존 네이버 회원 아니면  → 회원등록 (이메일 O, 닉네임 X)
	void insertKakaoMem_eo_nx(UserVO vo);
	// 기존 네이버 회원 아니면  → 회원등록 (이메일 O, 닉네임 O)
	void insertKakaoMem_eo_no(UserVO vo);
	
	
	
	//  ▶ 네이버 로그인 
	// 회원 인지 조회
	UserVO getNaverMemId(UserVO vo);
	
	// 기존 네이버 회원 아니면  → 회원등록 (닉네임 X)
	void insertNaverMem_nx(UserVO vo);
	// 기존 네이버 회원 아니면  → 회원등록 (닉네임 O)
	void insertNaverMem_no(UserVO vo);
	
	
	
	
	//  ▶ 전체 회원 조회
	List<UserVO> getMemList();
	
	
	//  ▶ 전체 회원 조회 (사용자)
	List<UserVO> getUserList(UserVO vo);
	
	//  ▶ 전체 회원 조회 (관리자)
	List<UserVO> getAdminList(UserVO vo);
	
	//  ▶ 아이디 중복 체크
	int idCheck(UserVO vo);
	
	//  ▶ 일반 회원 정보 조회
	UserVO getUserOne(UserVO vo);

	//  ▶ 관리자 정보 조회
	UserVO getAdminOne(UserVO vo);
	
	// ▶ 일반 회원 정보 수정
	void userUpdate(UserVO vo);
	
	// ▶ 관리자 정보 수정
	void adminUpdate(UserVO vo);

	// ▶ 일반 회원 정보 삭제
	void userDelete(UserVO vo);

	// ▶ 관리자 정보 등록
	void adminInsert(UserVO vo);
	
	// ▶ 일반 회원 총 회원 수
	int countUser(UserVO vo);

	// ▶ 관리자 정보 삭제
	void adminDelete(UserVO vo);

	// ▶ 관리자 총 회원 수
	int countAdmin(UserVO vo);
	
}
