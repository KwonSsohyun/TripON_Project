package com.tripon.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.user.UserService;
import com.tripon.biz.user.UserVO;

@Service("userService")
public class UserServiceimpl implements UserService {
	
	@Autowired
	private UserDAOMybatis userDAO; // = new UserDAOMybatis();
	
	// ----------------------------------------------------------

	@Override
	public void insertMem(UserVO vo) { // ▶  회원 등록
		userDAO.insertMem(vo);
	}

	@Override
	public void updateMem(UserVO vo) { // ▶  회원 수정
		userDAO.updateMem(vo);
	}

	@Override
	public void deleteMem(UserVO vo) { // ▶  회원 삭제
		userDAO.deleteMem(vo);
	}
	
	@Override
	public void updateMemPw(UserVO vo) { // ▶  비밀번호 수정
		userDAO.updateMemPw(vo);
	}

	
	
	@Override
	public UserVO getMemLogin(UserVO vo) { // ▶ 로그인 - 사용자/관리자/일치하는 회원정보 있는지 확인
		return userDAO.selectMemLogin(vo);
	}
	
	@Override
	public UserVO getMemLoginId(UserVO vo) { // ▶ ID 기준으로 회원정보 조회 
		return userDAO.selectMemLoginId(vo);
	}
	
	@Override
	public UserVO getMemLoginPh(UserVO vo) { // ▶ 전화번호 기준으로 회원정보 조회 
		return userDAO.selectMemLoginPh(vo);
	}
	
	@Override
	public UserVO getMemId(UserVO vo) { // ▶  개인 회원 조회 - 아이디 찾기
		return userDAO.selectMemId(vo);
	}
	
	@Override
	public UserVO getMemPw(UserVO vo) { // ▶ 개인 회원 조회 - 비밀번호 찾기
		return userDAO.selectMemPw(vo);
	}

	
	
	
	@Override
	public UserVO getKakaoMemId(UserVO vo) { // ▶ 카카오 로그인  - 회원 인지 조회
		return userDAO.selectKakaoMemId(vo);
	}
	
	
	@Override
	public void insertKakaoMem_ex_nx(UserVO vo) { // ▶ 카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 X, 닉네임 X)
		userDAO.insertKakaoMem_ex_nx(vo);
	}
	
	@Override
	public void insertKakaoMem_ex_no(UserVO vo) { // ▶ 카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 X, 닉네임 O)
		userDAO.insertKakaoMem_ex_no(vo);
	}
	
	@Override
	public void insertKakaoMem_eo_nx(UserVO vo) { // ▶ 카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 O, 닉네임 X)
		userDAO.insertKakaoMem_eo_nx(vo);
	}
	
	@Override
	public void insertKakaoMem_eo_no(UserVO vo) { // ▶ 카카오 로그인  - 기존 카카오 회원 아니면  → 회원등록 (이메일 O, 닉네임 O)
		userDAO.insertKakaoMem_eo_no(vo);
	}
	
	
	
	
	@Override
	public UserVO getNaverMemId(UserVO vo) { // ▶ 네이버 로그인  - 회원 인지 조회
		return userDAO.selectNaverMemId(vo);
	}
	
	
	@Override
	public void insertNaverMem_nx(UserVO vo) { // ▶ 네이버 로그인  - 기존 네이버 회원 아니면  → 회원등록 (닉네임 X)
		userDAO.insertNaverMem_nx(vo);
	}
	
	@Override
	public void insertNaverMem_no(UserVO vo) { // ▶ 네이버 로그인  - 기존 네이버 회원 아니면  → 회원등록 (닉네임 O)
		userDAO.insertNaverMem_no(vo);
	}
	
	
	
	
	
	@Override
	public List<UserVO> getMemList() { // ▶  전체 회원 조회
		return userDAO.selectMemList();
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) { // ▶  전체 회원 조회 (사용자)
		return userDAO.selectUserList(vo);
	}

	@Override
	public List<UserVO> getAdminList(UserVO vo) { // ▶  전체 회원 조회 (관리자)
		return userDAO.selectAdminList(vo);
	}
		
	@Override
	public int idCheck(UserVO vo) { // ▶  아이디 중복 체크
		return userDAO.idCheck(vo);
	}
	
	@Override
	public UserVO getUserOne(UserVO vo) { //  ▶ 일반 회원 정보 조회
		System.out.println("UserServiceImpl getUserOne");
		return userDAO.selectUserOne(vo);
	}

	@Override
	public UserVO getAdminOne(UserVO vo) { //  ▶ 관리자 정보 조회
		return userDAO.selectAdminOne(vo);
	}

	@Override
	public void userUpdate(UserVO vo) { // ▶ 일반 회원 정보 수정
		userDAO.userUpdate(vo);
	}

	@Override
	public void adminUpdate(UserVO vo) { // ▶ 관리자 정보 수정
		userDAO.adminUpdate(vo);
		
	}

	@Override
	public void userDelete(UserVO vo) { // ▶ 일반 회원 정보 삭제
		userDAO.userDelete(vo);
		
	}

	@Override
	public void adminInsert(UserVO vo) { // ▶ 관리자 정보 등록
		userDAO.adminInsert(vo);
		
	}

	@Override
	public int countUser(UserVO vo) { // ▶ 일반 회원 총 회원 수
		return userDAO.countUser(vo);
	}

	@Override
	public void adminDelete(UserVO vo) { // ▶ 관리자 정보 삭제
		userDAO.adminDelete(vo);		
		
	}

	@Override
	public int countAdmin(UserVO vo) { // ▶ 관리자 총 회원 수
		return userDAO.countAdmin(vo);
	}
	
	
}
