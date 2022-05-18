package com.tripon.biz.personalInformation.impl;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.personalInformation.PersonalInformationService;
import com.tripon.biz.personalInformation.PersonalInformationVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class PersonalInformationServiceimpl implements PersonalInformationService {
	@Autowired
	private PersonalInformationDAOMybatis personalInformationDAO;
	
	@Override
	public PersonalInformationVO getMember(String userId) {
		return personalInformationDAO.getMember(userId);
	}
	
	@Override
	public int nicknameCheck(String nickname) {
		return personalInformationDAO.nicknameCheck(nickname);
	}

	@Override
	public void updateNickname(PersonalInformationVO vo) {
		personalInformationDAO.updateNickname(vo);
	}
	
	@Override
	public void updatePhone(PersonalInformationVO vo) {
		personalInformationDAO.updatePhone(vo);
	}
	
	@Override
	public void updatePw(PersonalInformationVO vo) {
		personalInformationDAO.updatePw(vo);
	}

	@Override
	public void PhoneNumberAuthentication(int certificateNumber, String phoneNumber) {
		
        String api_key = "NCSXGWJZUVKUJYCY";
        String api_secret = "99YIVUHHW1BYAPRZEKZZI4QYUQ1PZUH4";
        Message coolsms = new Message(api_key, api_secret);
    
        /*
         * Parameters
         * 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
         */
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("to", phoneNumber); // 수신번호
        map.put("from", "01029952928");
        
        map.put("text", "[tripON] 인증번호 " + "[" + certificateNumber + "]" + "를 입력해주세요."); // 문자내용
        map.put("type", "sms"); // 문자 타입

        try {
        	JSONObject obj = (JSONObject) coolsms.send(map);
        	System.out.println(obj.toString());
        } catch (CoolsmsException e) {
        	System.out.println(e.getMessage());
        	System.out.println(e.getCode());
        }

    }

	@Override
	public List<PersonalInformationVO> getReservationList(String userId) {
		return personalInformationDAO.getReservationList(userId);
	}
	
	@Override
	public PersonalInformationVO getActivityInformation(String act_title) {
		return personalInformationDAO.getActivityInformation(act_title);
	}
	
	@Override
	public List<PersonalInformationVO> getPurchaseInformation(PersonalInformationVO vo) {
		return personalInformationDAO.getPurchaseInformation(vo);
	}
	
	@Override
	public void updatePurchase(int pur_num) {
		personalInformationDAO.updatePurchase(pur_num);
	}

	@Override
	public void deletePurchase(int pur_num) {
		personalInformationDAO.deletePurchase(pur_num);
	}
	
}
