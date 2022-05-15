package com.tripon.biz.purchaseManager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.purchaseManager.PurchaseManagerService;
import com.tripon.biz.purchaseManager.PurchaseManagerVO;

@Service("PurchaseManagerService")
public class PurchaseManagerServiceImpl implements PurchaseManagerService{
	// PurchaseManagerService를 사용하는 Impl
	
	@Autowired
	PurchaseManagerDAOMybatis purchasemanagerDAO;

	//Purchase 관리자 페이지 리스트
	@Override
	public List<PurchaseManagerVO> getPurchaseManagerList(PurchaseManagerVO vo) {
		return purchasemanagerDAO.getPurchaseManagerList(vo);
	}
	
	//Total 값 - Purchase table
	@Override
	public int getTotal() {
		return purchasemanagerDAO.getTotal();
	}
	
	//결제 취소 - DB update
	@Override
	public int updateState(PurchaseManagerVO vo) {
		return purchasemanagerDAO.updateState(vo);		
	}
}
