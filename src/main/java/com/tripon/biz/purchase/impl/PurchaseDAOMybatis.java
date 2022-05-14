package com.tripon.biz.purchase.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.purchase.PurchaseVO;

@Repository
public class PurchaseDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPurchase(PurchaseVO vo) {
		System.out.println("===> Mybatis로 insertPurchase() 기능 처리");
		mybatis.insert("PurchaseDAO.insertPurchase", vo);
	}

}
