package com.kh.herb.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.notice.model.dao.NoticeDAO;
import com.kh.herb.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public int totalCount() {
		return noticeDAO.listCount();
	}

	@Override
	public List<Notice> noticeList(int startPage, int limit) throws Exception {
		return noticeDAO.noticeList(startPage, limit);
	}

	@Override
	public int insertNotice(Notice notice) throws Exception {
		return noticeDAO.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) throws Exception {
		return noticeDAO.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNum) throws Exception {
		return noticeDAO.deleteNotice(noticeNum);
	}

	@Override
	public Notice selectNotice(int noticeNum) throws Exception {
		return noticeDAO.selectNotice(noticeNum);
	}

	@Override
	public int readCount(Notice notice) throws Exception {
		return noticeDAO.readCount(notice);
	}
	
	
}
