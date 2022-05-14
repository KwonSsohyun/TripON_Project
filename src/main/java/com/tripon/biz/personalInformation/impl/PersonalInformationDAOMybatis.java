package com.tripon.biz.personalInformation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.personalInformation.PersonalInformationVO;

@Repository
public class PersonalInformationDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public PersonalInformationVO getMember(String userId) {
		System.out.println("===> Mybatis로 getMember() 기능 처리");
		return (PersonalInformationVO) mybatis.selectOne("PersonalInformationDAO.getMember", userId);
	}
	
	public int nicknameCheck(String nickname) {
		System.out.println("===> Mybatis로 nicknameCheck() 기능 처리");
		return mybatis.selectOne("PersonalInformationDAO.checkNickname", nickname);
	}
	
	public void updateNickname(PersonalInformationVO vo) {
		System.out.println("===> Mybatis로 updateNickname() 기능 처리");
		mybatis.update("PersonalInformationDAO.updateMem_nickname", vo);
	}
	
	public void updatePhone(PersonalInformationVO vo) {
		System.out.println("===> Mybatis로 updatePhone() 기능 처리");
		mybatis.update("PersonalInformationDAO.updateMem_phone", vo);
	}
	
	public void updatePw(PersonalInformationVO vo) {
		System.out.println("===> Mybatis로 updatePw() 기능 처리");
		mybatis.update("PersonalInformationDAO.updateMem_pw", vo);
	}
	
	public List<PersonalInformationVO> getReservationList(String userId) {
		System.out.println("===> Mybatis로 getReservationList() 기능 처리");
		return mybatis.selectList("PersonalInformationDAO.getReservationList", userId);
	}
	
	public PersonalInformationVO getActivityInformation(String act_title) {
		System.out.println("===> Mybatis로 getActivityInformation() 기능 처리");
		return (PersonalInformationVO) mybatis.selectOne("PersonalInformationDAO.getActivityInformation", act_title);
	}
	
	public List<PersonalInformationVO> getPurchaseInformation(PersonalInformationVO vo) {
		System.out.println("===> Mybatis로 getPurchaseInformation() 기능 처리");
		return mybatis.selectList("PersonalInformationDAO.getPurchaseInformation", vo);
	}
	
	public void updatePurchase(int pur_num) {
		System.out.println("===> Mybatis로 updatePurchase() 기능 처리");
		mybatis.update("PersonalInformationDAO.updatePurchase", pur_num);
	}
	
	public void deletePurchase(int pur_num) {
		System.out.println("===> Mybatis로 deletePurchase() 기능 처리");
		mybatis.delete("PersonalInformationDAO.deletePurchase", pur_num);
	}
	
}
