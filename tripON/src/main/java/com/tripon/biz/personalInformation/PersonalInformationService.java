package com.tripon.biz.personalInformation;

import java.util.List;

public interface PersonalInformationService {
	
	public int nicknameCheck(String nickname);
	
	public PersonalInformationVO getMember(String userId);
	
	public void updateNickname(PersonalInformationVO vo);
	
	public void updatePhone(PersonalInformationVO vo);
	
	public void updatePw(PersonalInformationVO vo);
	
	public void PhoneNumberAuthentication(int certificateNumber, String phoneNumber);
	
	public List<PersonalInformationVO> getReservationList(String userId);
	
	public PersonalInformationVO getActivityInformation(String act_title);
	
	public List<PersonalInformationVO> getPurchaseInformation(PersonalInformationVO vo);
	
	public void updatePurchase(int pur_num);
	
	public void deletePurchase(int pur_num);
	
}
