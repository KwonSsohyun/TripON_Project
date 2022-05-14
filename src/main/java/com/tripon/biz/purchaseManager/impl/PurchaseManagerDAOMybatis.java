package com.tripon.biz.purchaseManager.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.purchaseManager.PurchaseManagerVO;

@Repository
public class PurchaseManagerDAOMybatis {
	//데이터 베이스 연동을 처리하는 DAO클래스
	@Autowired
	private SqlSessionTemplate mybatis; //mybatis에서 제공..?
	
	//Purchase 관리자 페이지 리스트
	public List<PurchaseManagerVO> getPurchaseManagerList(PurchaseManagerVO vo){
		System.out.println("PurchaseManagerDAOMybatis출력문 : PurchaseManagerList 출력");
		return mybatis.selectList("PurchaseManagerDAO.purchaseList", vo);
	}
	
	//Total 값 - Purchase table
	public int getTotal() {
		return mybatis.selectOne("PurchaseManagerDAO.getTotal");
	}
	
	//결제 취소 - DB update
	public int updateState(PurchaseManagerVO vo){
		System.out.println("PurchaseManagerDAOMybatis출력문 : updateState 수행");
		return mybatis.update("PurchaseManagerDAO.updateState", vo);
	}
	
//	<!-- mapping.xml의 namespace와 id -->
//	<mapper namespace="PurchaseManagerDAO">
//		<select id="getPurchaseManagerList" resultType="Purchase">

}
