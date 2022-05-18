package com.tripon.view.controller;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tripon.biz.bcrypt.BCryptPWEncoder;
import com.tripon.biz.personalInformation.PersonalInformationService;
import com.tripon.biz.personalInformation.PersonalInformationVO;

@Controller
@SessionAttributes("userId")
public class PersonalInformationController {
	@Autowired
	private PersonalInformationService personalInformationServiceimpl;
	@Autowired
	private BCryptPWEncoder bcryptPWEncoder;
	
	@RequestMapping(value="/goInfo_managementPage", method=RequestMethod.GET)
	public String goInfo_managementPAge(@ModelAttribute("userId") String userId, Model model) {
		model.addAttribute("info_member", personalInformationServiceimpl.getMember(userId));
		return "info_managementPage";
	}
	
	@RequestMapping(value="/nicknameCheck", method=RequestMethod.POST)
	@ResponseBody
	public int nicknameCheck(@RequestBody String nickname) {
		System.out.println("nicknameCheck() 호출");
		int count = 0;
		count = personalInformationServiceimpl.nicknameCheck(nickname);
		
		return count;
	}
	
	@RequestMapping(value="/info_updateNickname", method=RequestMethod.POST)
	public String updateNickname(PersonalInformationVO vo) {
		personalInformationServiceimpl.updateNickname(vo);
		return "redirect:/goInfo_managementPage";
	}
	
	@RequestMapping(value="/info_updatePhone", method=RequestMethod.POST)
	public String updatePhone(PersonalInformationVO vo) {
		personalInformationServiceimpl.updatePhone(vo);
		return "redirect:/goInfo_managementPage";
	}
	
	@RequestMapping(value="/info_checkPw", method=RequestMethod.POST)
	@ResponseBody
	public boolean checkPw(@ModelAttribute("userId") String userId, @RequestBody String pw, PersonalInformationVO vo) {
		vo = personalInformationServiceimpl.getMember(userId);
		boolean match = bcryptPWEncoder.isMatch(pw, vo.getMem_pw());
		return match;
	}
	
	@RequestMapping(value="/info_updatePw", method=RequestMethod.POST)
	public String updatePw(PersonalInformationVO vo) {
		vo.setMem_pw(bcryptPWEncoder.encrypt(vo.getMem_pw()));
		personalInformationServiceimpl.updatePw(vo);
		return "redirect:/goInfo_managementPage";
	}
	
	@RequestMapping(value="/AuthenticatePhoneNumber", method=RequestMethod.POST)
	@ResponseBody
	public String PhoneNumberAuthentication(@RequestBody String phoneNumber) {
		int phoneNumberAuthentication = ThreadLocalRandom.current().nextInt(1000, 10000);
		System.out.println(phoneNumberAuthentication);
		System.out.println(phoneNumber);
		
		personalInformationServiceimpl.PhoneNumberAuthentication(phoneNumberAuthentication, phoneNumber);
		
		return "" + phoneNumberAuthentication;
	}
	
	@RequestMapping(value="/getReservationList", method=RequestMethod.GET)
	public String getReservationList(@ModelAttribute("userId") String userId, Model model) {
		model.addAttribute("phonenum", personalInformationServiceimpl.getMember(userId).getMem_phone());
		System.out.println(personalInformationServiceimpl.getMember(userId).getMem_phone());
		model.addAttribute("reservationList", personalInformationServiceimpl.getReservationList(userId));
		return "reservationPage";
	}
	
	@RequestMapping(value="/getActivityInformation", method=RequestMethod.POST)
	@ResponseBody
	public PersonalInformationVO getActivityInformation(@RequestBody String act_title, PersonalInformationVO vo) {
		return personalInformationServiceimpl.getActivityInformation(act_title);
	}
	
	@RequestMapping(value="/getPurchaseInformation", method=RequestMethod.POST)
	@ResponseBody
	public List<PersonalInformationVO> getPurchaseInformation(@RequestBody String act_mainTitle, @ModelAttribute("userId") String userId, PersonalInformationVO vo) {
		vo.setAct_mainTitle(act_mainTitle);
		vo.setMem_id(userId);
		return personalInformationServiceimpl.getPurchaseInformation(vo);
	}
	
	@RequestMapping(value="/updatePurchase", method=RequestMethod.POST)
	public String updatePurchase(@RequestParam(value="pur_num", required=false) int pur_num) {
		personalInformationServiceimpl.updatePurchase(pur_num);
		return "redirect:/getReservationList";
	}
	
	@RequestMapping(value="/deletePurchase", method=RequestMethod.POST)
	public String deletePurchase(@RequestParam(value="pur_num", required=false) int pur_num) {
		personalInformationServiceimpl.deletePurchase(pur_num);
		return "redirect:/getReservationList";
	}

}
