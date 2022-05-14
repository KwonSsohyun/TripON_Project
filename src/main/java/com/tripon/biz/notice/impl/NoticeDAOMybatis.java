package com.tripon.biz.notice.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tripon.biz.notice.NoticeVO;

@Repository
public class NoticeDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertNotice(NoticeVO vo) {
		System.out.println("===> Mybatis로 insertNotice() 기능 처리");
		mybatis.insert("NoticeDAO.insertNotice", vo);
	}
	
	public void updateNotice(NoticeVO vo) {
		System.out.println("===> Mybatis로 updateNotice() 기능 처리");
		mybatis.update("NoticeDAO.updateNotice", vo);
	}
	
	public void deleteNotice(NoticeVO vo) {
		System.out.println("===> Mybatis로 deleteNotice() 기능 처리");
		for(int i = 0; i < vo.getDeleteSeq().length; i++) {
			mybatis.delete("NoticeDAO.deleteNotice", vo.getDeleteSeq()[i]);
		}
	}
	
	public NoticeVO getNoticeTotal(NoticeVO vo) {
		System.out.println("===> Mybatis로 getNoticeTotal() 기능 처리");
		return (NoticeVO) mybatis.selectOne("NoticeDAO.getNoticeTotal", vo);
	}
	
	public NoticeVO getNotice(NoticeVO vo) {
		System.out.println("===> Mybatis로 getNotice() 기능 처리");
		mybatis.update("NoticeDAO.updateCount", vo);
		return (NoticeVO) mybatis.selectOne("NoticeDAO.getNotice", vo);
	}
	
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println(vo.getSearchKeyword());
		System.out.println("===> Mybatis로 getNoticeList() 기능 처리");
		return mybatis.selectList("NoticeDAO.getNoticeList", vo);
	}
	
	public NoticeVO getUserNoticeTotal(NoticeVO vo) {
		System.out.println("===> Mybatis로 getUserNoticeTotal() 기능 처리");
		return (NoticeVO) mybatis.selectOne("NoticeDAO.getUserNoticeTotal", vo);
	}
	
	public List<NoticeVO> getUserNoticeList(NoticeVO vo) {
		System.out.println(vo.getSearchKeyword());
		System.out.println("===> Mybatis로 getUserNoticeList() 기능 처리");
		return mybatis.selectList("NoticeDAO.getUserNoticeList", vo);
	}
	
}
