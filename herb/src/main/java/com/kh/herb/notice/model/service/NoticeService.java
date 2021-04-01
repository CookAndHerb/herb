package com.kh.herb.notice.model.service;

import java.util.List;

import com.kh.herb.notice.model.vo.Notice;

public interface NoticeService {

	public int totalCount();
	
	public List<Notice> noticeList(int startPage, int limit) throws Exception;
	
	public int insertNotice(Notice notice) throws Exception;
	
	public int updateNotice(Notice notice) throws Exception;
	
	public int deleteNotice(int noticeNum) throws Exception;
	
	public Notice selectNotice(int noticeNum) throws Exception;
	
	public int readCount(Notice notice) throws Exception;
}
