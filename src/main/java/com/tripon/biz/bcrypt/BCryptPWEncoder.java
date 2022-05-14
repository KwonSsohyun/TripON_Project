package com.tripon.biz.bcrypt;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class BCryptPWEncoder {
	
	// BCrypt 암호화 사용 클래스
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	
	// ▶ 사용자가 입력한  → 비밀번호 암호화 작업
    public String encrypt(String password) {
        return passwordEncoder.encode(password);
    }
	
	
	// ▶ 암호화 비밀번호 == 사용자 비밀번호   →  비교
    public boolean isMatch(String inputPw, String dbPw) {
        return passwordEncoder.matches(inputPw, dbPw);
    }
	

}
