package com.tripon.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	
	@Autowired
	public SqlSessionTemplate mybatis;
	
	
	// ▶  회원 등록
	public void insertMem(UserVO vo) {
		mybatis.insert("UserDAO.insertMem", vo);
	}
	
	// ▶  회원 수정
	public void updateMem(UserVO vo) {
		mybatis.update("UserDAO.updateMem", vo);
	}
	
	// ▶  회원 삭제
	public void deleteMem(UserVO vo) {
		mybatis.delete("UserDAO.deleteMem", vo);
	}
	
	// ▶  비밀번호 수정
	public void updateMemPw(UserVO vo) {
		mybatis.delete("UserDAO.updateMemPw", vo);
	}
	
	
	
	
	// ▶ 로그인 - 사용자/관리자/일치하는 회원정보 있는지 확인
	public UserVO selectMemLogin(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectMemLogin", vo);
	}
	
	// ▶ ID 기준으로 회원정보 조회 
	public UserVO selectMemLoginId(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectMemLoginId", vo);
	}
	
	// ▶ 전화번호 기준으로 회원정보 조회 
	public UserVO selectMemLoginPh(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectMemLoginPh", vo);
	}
	
	// ▶  개인 회원 조회 - 아이디 찾기
	public UserVO selectMemId(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectMemId", vo);
	}
	
	// ▶  개인 회원 조회 - 비밀번호 찾기
	public UserVO selectMemPw(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectMemPw", vo);
	}
	
	
	
	
	// ▶  카카오 로그인  - 회원 인지 조회
	public UserVO selectKakaoMemId(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectKakaoMemId", vo);
	}
	
	// ▶  카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 X, 닉네임 X)
	public void insertKakaoMem_ex_nx(UserVO vo) {
		mybatis.insert("UserDAO.insertKakaoMem_ex_nx", vo);
	}
	
	// ▶  카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 X, 닉네임 O)
	public void insertKakaoMem_ex_no(UserVO vo) {
		mybatis.insert("UserDAO.insertKakaoMem_ex_no", vo);
	}
	
	// ▶  카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 O, 닉네임 X)
	public void insertKakaoMem_eo_nx(UserVO vo) {
		mybatis.insert("UserDAO.insertKakaoMem_eo_nx", vo);
	}
	
	// ▶  카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 O, 닉네임 O)
	public void insertKakaoMem_eo_no(UserVO vo) {
		mybatis.insert("UserDAO.insertKakaoMem_eo_no", vo);
	}
	
	
	
	
	// ▶  네이버 로그인  - 회원 인지 조회
	public UserVO selectNaverMemId(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.selectNaverMemId", vo);
	}
	
	// ▶  네이버 로그인  - 기존 네이버 회원 아니면  → 회원등록 (닉네임 X)
	public void insertNaverMem_nx(UserVO vo) {
		mybatis.insert("UserDAO.insertNaverMem_nx", vo);
	}
	
	// ▶  네이버 로그인  - 기존 네이버 회원 아니면  → 회원등록 (닉네임 O)
	public void insertNaverMem_no(UserVO vo) {
		mybatis.insert("UserDAO.insertNaverMem_no", vo);
	}
	
	
	
	
	
	
	// ▶  전체 회원 조원
	public List<UserVO> selectMemList(){
		return mybatis.selectList("UserDAO.selectMemList");
	}
	
	// ▶  전체 회원 조회 (사용자)
	public List<UserVO> selectUserList(UserVO vo){
		return mybatis.selectList("UserDAO.selectUserList", vo);
	}
	
	// ▶  전체 회원 조회 (관리자)
	public List<UserVO> selectAdminList(UserVO vo){
		return mybatis.selectList("UserDAO.selectAdminList", vo);
	}
	
	// ▶  아이디 중복 체크
	public int idCheck(UserVO vo){
		return mybatis.selectOne("UserDAO.idCheck", vo);
	}
	
//  ▶ 일반 회원 정보 조회
	public UserVO selectUserOne(UserVO vo) {
		System.out.println("selectUserOne()");
		return mybatis.selectOne("UserDAO.selectUserOne", vo);
	}
	
	//  ▶ 관리자 정보 조회
	public UserVO selectAdminOne(UserVO vo) {
		return mybatis.selectOne("UserDAO.selectAdminOne",vo);
	}
	
	// ▶  일반 회원 정보 수정
	public void userUpdate(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}

	// ▶  관리자 정보 수정
	public void adminUpdate(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}

	// ▶  일반 회원 정보 삭제
	public void userDelete(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);	
	}

	// ▶  관리자 정보 등록
	public void adminInsert(UserVO vo) {
		mybatis.update("UserDAO.insertUser", vo);
		
	}

	// ▶ 일반 회원 총 회원 수
	public int countUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.countUser", vo);
	}

	// ▶  관리자 정보 삭제
	public void adminDelete(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);			
	}

	// ▶ 관리자 총 회원 수
	public int countAdmin(UserVO vo) {
		return mybatis.selectOne("UserDAO.countAdmin", vo);
	}

}
