package com.tripon.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tripon.biz.phone.PhoneService;

@Controller
public class PhoneController {
	
	@Autowired
	PhoneService testService;
	
	@RequestMapping(value = "/phoneCheck", method=RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String usertPhoneNumber) {
		
		System.out.println("휴대폰 문자 보내기");
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		
		System.out.println(randomNumber);
		
		// ▶ 실제 서비스에서는 해당 주석 풀어주세요.
		// testService.certifiedPhoneNumber(usertPhoneNumber, randomNumber);
		
		return Integer.toString(randomNumber);
	}
	
	
	
}
