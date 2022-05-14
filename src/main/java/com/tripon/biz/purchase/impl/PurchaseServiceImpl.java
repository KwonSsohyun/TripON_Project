package com.tripon.biz.purchase.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.purchase.PurchaseService;
import com.tripon.biz.purchase.PurchaseVO;

@Service("PurchaseService")
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	private PurchaseDAOMybatis purchaseDAO;

	@Override
	public void insertPurchase(PurchaseVO vo) {
		purchaseDAO.insertPurchase(vo);
	}

}
