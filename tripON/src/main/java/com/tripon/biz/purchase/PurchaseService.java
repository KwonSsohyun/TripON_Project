package com.tripon.biz.purchase;

import java.util.List;

public interface PurchaseService {
	
	// 결제 정보 등록
	void insertPurchase(PurchaseVO vo);
	
	List<userinfoVO> getUserinfoList(userinfoVO vo);
}
