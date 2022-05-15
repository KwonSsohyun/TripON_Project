package com.tripon.biz.purchaseManager;

import java.util.List;

public interface PurchaseManagerService {

	//Purchase 관리자 페이지 리스트
		List<PurchaseManagerVO> getPurchaseManagerList(PurchaseManagerVO vo);
		
	//Total 값 - Purchase table
		public int getTotal();
	
	//결제 취소 - DB update : update 수행 시 데이터 행의 변경 > 변경된 값에 따른 수행 여부 확인을 위한 int 설정
		public int updateState(PurchaseManagerVO vo);
}
