package com.tripon.biz.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.faq.FaqService;
import com.tripon.biz.faq.FaqVO;

@Service("FaqService")
public class FaqServiceimpl implements FaqService {
	
	@Autowired
	private FaqDAOMybatis faqDAO;
	
	@Override
	public void insertFaq(FaqVO vo) {
		faqDAO.insertFaq(vo);
	}
	
	@Override
	public void updateFaq(FaqVO vo) {
		faqDAO.updateFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		faqDAO.deleteFaq(vo);
	}

	@Override
	public int getFaqTotal(FaqVO vo) {
		return faqDAO.getFaqTotal(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {
		return faqDAO.getFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
		return faqDAO.getFaqList(vo);
	}

	@Override
	public int getUserFaqTotal(FaqVO vo) {
		return faqDAO.getUserFaqTotal(vo);
	}
	
	@Override
	public List<FaqVO> getUserFaqList(FaqVO vo) {
		return faqDAO.getUserFaqList(vo);
	}

}
