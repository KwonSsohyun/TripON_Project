package com.tripon.biz.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripon.biz.notice.NoticeService;
import com.tripon.biz.notice.NoticeVO;

@Service("NoticeService")
public class NoticeServiceimpl implements NoticeService {
	
	@Autowired
	private NoticeDAOMybatis noticeDAO;
	
	@Override
	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
	}
	
	@Override
	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}

	@Override
	public NoticeVO getNoticeTotal(NoticeVO vo) {
		return noticeDAO.getNoticeTotal(vo);
	}

	@Override
	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	@Override
	public NoticeVO getUserNoticeTotal(NoticeVO vo) {
		return noticeDAO.getUserNoticeTotal(vo);
	}

	@Override
	public List<NoticeVO> getUserNoticeList(NoticeVO vo) {
		return noticeDAO.getUserNoticeList(vo);
	}
}
